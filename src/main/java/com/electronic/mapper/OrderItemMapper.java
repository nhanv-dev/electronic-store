package com.electronic.mapper;

import com.electronic.model.OrderItem;
import com.electronic.model.Product;

import java.sql.ResultSet;
import java.sql.SQLException;

public class OrderItemMapper implements IRowMapper<OrderItem> {
    private final ProductMapper productMapper = new ProductMapper();

    @Override
    public OrderItem mapRow(ResultSet rs) {
        OrderItem item = new OrderItem();
        Product product = productMapper.mapRow(rs);
        try {
            item.setId(rs.getString("item_id"));
            item.setOrderId(rs.getString("order_id"));
            item.setQuantity(rs.getInt("orders_item.quantity"));
            item.setProduct(product);
        } catch (SQLException exception) {
            System.out.println(exception.getMessage());
            return null;
        }
        return item;
    }
}
