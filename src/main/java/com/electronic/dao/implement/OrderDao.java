package com.electronic.dao.implement;

import com.electronic.dao.IOrderDao;
import com.electronic.mapper.OrderMapper;
import com.electronic.mapper.WishListMapper;
import com.electronic.model.Order;
import com.electronic.model.OrderItem;

import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.StringJoiner;

public class OrderDao extends AbstractDao<Order> implements IOrderDao {

    @Override
    public List<Order> findAll() {
        String sql = "select * from orders inner join order_status on orders.order_status = order_status.id";
        return query(sql, new OrderMapper());
    }

    @Override
    public List<Order> findByUserAndStatus(String userId, String status) {
        StringJoiner joiner = new StringJoiner(" ");
        joiner.add("select * from orders");
        joiner.add("inner join order_status on orders.order_status = order_status.id");
        joiner.add("where user_id = ? and order_status.id = ?");
        return query(joiner.toString(), new OrderMapper(), userId, status);
    }


    @Override
    public Order findOne(String id) {
        StringJoiner joiner = new StringJoiner(" ");
        joiner.add("select * from orders");
        joiner.add("inner join order_status on orders.order_status = order_status.id");
        joiner.add("where order_id = ?");
        List<Order> result = query(joiner.toString(), new OrderMapper(), id);
        return result.isEmpty() ? null : result.get(0);
    }

    @Override
    public Order findByUserId(String userId) {
        StringJoiner joiner = new StringJoiner(" ");
        joiner.add("select * from orders where user_id = ?");
        List<Order> result = query(joiner.toString(), new OrderMapper(), userId);
        return result.isEmpty() ? null : result.get(0);
    }

    @Override
    public Order insert(Order order) {
        StringJoiner joiner = new StringJoiner(" ");
        joiner.add("insert into orders(order_id, user_id, order_total, order_status)");
        joiner.add("values(?, ?, ?, ?)");
        insert(joiner.toString(), order.getId(), order.getUserId(), order.getTotal(), order.getStatus());
        return findOne(order.getId());
    }

    @Override
    public void update(Order order) {
        StringJoiner joiner = new StringJoiner(" ");
        joiner.add("update orders set user_id = ?, order_total = ?, order_status = ? where order_id = ?");
        update(joiner.toString(), order.getUserId(), order.getTotal(), order.getStatus(), order.getId());
    }

    @Override
    public void delete(String id) {
        String sql = "delete from orders where order_id = ?";
        delete(sql, id);
    }
}
