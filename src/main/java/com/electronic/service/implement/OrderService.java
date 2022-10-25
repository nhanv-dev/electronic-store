package com.electronic.service.implement;

import com.electronic.dao.IOrderDao;
import com.electronic.dao.IOrderItemDao;
import com.electronic.dao.IImageDao;
import com.electronic.dao.implement.OrderDao;
import com.electronic.dao.implement.OrderItemDao;
import com.electronic.dao.implement.ImageDao;
import com.electronic.model.CartItem;
import com.electronic.model.Order;
import com.electronic.model.OrderItem;
import com.electronic.service.IOrderService;

import java.util.List;

public class OrderService implements IOrderService {
    private final IOrderDao orderDao = new OrderDao();
    private final IOrderItemDao orderItemDao = new OrderItemDao();
    private final IImageDao imageDao = new ImageDao();

    @Override
    public List<Order> findAll() {
        List<Order> orders = orderDao.findAll();
        for (Order order : orders) order.addAllItem(findItemByOrderId(order.getId()));
        return orders;
    }

    @Override
    public List<Order> findByUserAndStatus(String userId, String status) {
        List<Order> orders = orderDao.findByUserAndStatus(userId, status);
        for (Order order : orders) order.addAllItem(findItemByOrderId(order.getId()));
        return orders;
    }

    @Override
    public Order findOne(String id) {
        return orderDao.findOne(id);
    }

    @Override
    public Order findByUserId(String userId) {
        Order order = orderDao.findByUserId(userId);
        if (order != null) order.addAllItem(findItemByOrderId(order.getId()));
        return order;
    }

    @Override
    public Order insert(Order order) {
        if (orderDao.findOne(order.getId()) == null) orderDao.insert(order);
        else orderDao.update(order);
        updateItems(order.getItems());
        return findOne(order.getId());
    }

    @Override
    public void update(Order order) {
        order.setItems(updateItems(order.getItems()));
        orderDao.update(order);
    }

    @Override
    public void delete(String id) {
        orderItemDao.deleteByOrderId(id);
        orderDao.delete(id);
    }

    @Override
    public List<OrderItem> updateItems(List<OrderItem> items) {
        for (OrderItem item : items) {
            OrderItem _item = orderItemDao.findOne(item.getId());
            if (_item == null) orderItemDao.insert(item);
            else orderItemDao.update(item);
        }
        return items;
    }

    public List<OrderItem> findItemByOrderId(String orderId) {
        List<OrderItem> items = orderItemDao.findByOrderId(orderId);
        for (OrderItem item : items) {
            item.getProduct().setImages(imageDao.findByProductId(item.getProduct().getId()));
        }
        return items;
    }
}
