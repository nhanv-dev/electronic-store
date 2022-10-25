package com.electronic.mapper;

import com.electronic.dao.IImageDao;
import com.electronic.dao.implement.ImageDao;
import com.electronic.model.CartItem;
import com.electronic.model.Product;

import java.sql.ResultSet;
import java.sql.SQLException;

public class CartItemMapper implements IRowMapper<CartItem> {
    private final ProductMapper productMapper = new ProductMapper();

    @Override
    public CartItem mapRow(ResultSet rs) {
        CartItem item = new CartItem();
        Product product = productMapper.mapRow(rs);
        try {
            item.setId(rs.getString("item_id"));
            item.setCartId(rs.getString("cart_item.cart_id"));
            item.setQuantity(rs.getInt("cart_item.quantity"));
            item.setProduct(product);
        } catch (SQLException exception) {
            System.out.println(exception.getMessage());
            return null;
        }
        return item;
    }
}
