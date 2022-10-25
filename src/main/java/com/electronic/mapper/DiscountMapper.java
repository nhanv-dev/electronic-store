package com.electronic.mapper;

import com.electronic.model.Category;
import com.electronic.model.Discount;
import com.electronic.model.Discount;

import java.sql.ResultSet;
import java.sql.SQLException;

public class DiscountMapper implements IRowMapper<Discount> {
    @Override
    public Discount mapRow(ResultSet rs) {
        Discount discount = new Discount();
        try {
            discount.setId(rs.getString("discount_id"));
            discount.setName(rs.getString("discount_name"));
            discount.setDesc(rs.getString("discount_desc"));
            discount.setPercent(rs.getFloat("discount_percent"));
            discount.setActive(rs.getBoolean("discount_active"));
            discount.setCreatedAt(rs.getTimestamp("createdAt"));
            discount.setModifiedAt(rs.getTimestamp("modifiedAt"));
            discount.setDeletedAt(rs.getTimestamp("deletedAt"));
        } catch (SQLException exception) {
            System.out.println(exception.getMessage());
            return null;
        }
        return discount;
    }
}
