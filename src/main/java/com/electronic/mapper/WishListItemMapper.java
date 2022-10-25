package com.electronic.mapper;

import com.electronic.model.WishListItem;
import com.electronic.model.Product;

import java.sql.ResultSet;
import java.sql.SQLException;

public class WishListItemMapper implements IRowMapper<WishListItem> {
    private final ProductMapper productMapper = new ProductMapper();

    @Override
    public WishListItem mapRow(ResultSet rs) {
        WishListItem item = new WishListItem();
        Product product = productMapper.mapRow(rs);
        try {
            item.setId(rs.getString("item_id"));
            item.setWishListId(rs.getString("wishlist_id"));
            item.setProduct(product);
        } catch (SQLException exception) {
            System.out.println(exception.getMessage());
            return null;
        }
        return item;
    }
}
