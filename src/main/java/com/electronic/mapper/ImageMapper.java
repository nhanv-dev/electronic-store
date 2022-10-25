package com.electronic.mapper;

import com.electronic.model.Image;

import java.sql.ResultSet;
import java.sql.SQLException;

public class ImageMapper implements IRowMapper<Image> {

    @Override
    public Image mapRow(ResultSet rs) {
        Image image = new Image();
        try {
            image.setId(rs.getString("image_id"));
            image.setProductId(rs.getString("product_id"));
            image.setUrl(rs.getString("image_url"));
        } catch (SQLException exception) {
            System.out.println(exception.getMessage());
            return null;
        }
        return image;
    }
}
