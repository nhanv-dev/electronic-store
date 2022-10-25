package com.electronic.mapper;

import com.electronic.model.Cart;
import com.electronic.model.CartItem;

import java.sql.ResultSet;
import java.sql.SQLException;

public class CartMapper implements IRowMapper<Cart> {

    @Override
    public Cart mapRow(ResultSet rs) {
        Cart cart = new Cart();
        try {
            cart.setId(rs.getString("cart_id"));
            cart.setUserId(rs.getString("user_id"));
            cart.setTotal(rs.getDouble("cart_total"));
        } catch (SQLException exception) {
            System.out.println(exception.getMessage());
            return null;
        }
        return cart;
    }
}
