package com.electronic.mapper;

import com.electronic.model.Category;

import java.sql.ResultSet;
import java.sql.SQLException;

public class CategoryMapper implements IRowMapper<Category> {

    @Override
    public Category mapRow(ResultSet rs) {
        Category category = new Category();
        try {
            category.setId(rs.getString("category_id"));
            category.setName(rs.getString("category_name"));
            category.setSlug(rs.getString("category_slug"));
            category.setCreatedAt(rs.getTimestamp("createdAt"));
            category.setModifiedAt(rs.getTimestamp("modifiedAt"));
            category.setDeletedAt(rs.getTimestamp("deletedAt"));
        } catch (SQLException exception) {
            return null;
        }
        return category;
    }
}
