package com.electronic.mapper;

import com.electronic.model.Order;

import java.sql.ResultSet;
import java.sql.SQLException;

public class OrderMapper implements IRowMapper<Order> {

    @Override
    public Order mapRow(ResultSet rs) {
        Order order = new Order();
        try {
            order.setId(rs.getString("order_id"));
            order.setUserId(rs.getString("user_id"));
            order.setTotal(rs.getDouble("order_total"));
            order.setStatus(rs.getString("order_status.desc"));
            order.setCreatedAt(rs.getTimestamp("createdAt"));
            order.setModifiedAt(rs.getTimestamp("modifiedAt"));
            order.setDeletedAt(rs.getTimestamp("deletedAt"));
        } catch (SQLException exception) {
            System.out.println(exception.getMessage());
            return null;
        }
        return order;
    }
}
