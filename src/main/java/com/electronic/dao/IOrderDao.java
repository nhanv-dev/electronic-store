package com.electronic.dao;

import com.electronic.model.Order;
import com.electronic.model.OrderItem;

import java.util.List;

public interface IOrderDao extends GenericDao<Order> {
    List<Order> findAll();
    List<Order> findByUser(String id);
    List<Order> findByUserAndStatus(String userId, String status);

    Order findOne(String id);

    Order findByUserId(String userId);

    Order insert(Order order);

    void update(Order order);

    void delete(String id);
}
