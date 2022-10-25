package com.electronic.mapper;

import com.electronic.model.WishList;
import com.electronic.model.Product;

import java.sql.ResultSet;
import java.sql.SQLException;

public class WishListMapper implements IRowMapper<WishList> {

    @Override
    public WishList mapRow(ResultSet rs) {
        WishList wishlist = new WishList();
        try {
            wishlist.setId(rs.getString("wishlist_id"));
            wishlist.setUserId(rs.getString("user_id"));
        } catch (SQLException exception) {
            System.out.println(exception.getMessage());
            return null;
        }
        return wishlist;
    }
}
