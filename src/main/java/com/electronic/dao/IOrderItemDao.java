package com.electronic.dao;

import com.electronic.model.OrderItem;

import java.util.List;

public interface IOrderItemDao extends GenericDao<OrderItem> {
    OrderItem findOne(String id);

    List<OrderItem> findByOrderId(String orderId);

    OrderItem insert(OrderItem orderItem);

    void update(OrderItem orderItem);

    void deleteByProductId(String productId);

    void deleteByOrderId(String orderId);

    void delete(String id);
}
