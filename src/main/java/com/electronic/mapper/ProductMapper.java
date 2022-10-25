package com.electronic.mapper;

import com.electronic.model.Category;
import com.electronic.model.Discount;
import com.electronic.model.Inventory;
import com.electronic.model.Product;

import java.sql.ResultSet;
import java.sql.SQLException;

public class ProductMapper implements IRowMapper<Product> {
    private final CategoryMapper categoryMapper = new CategoryMapper();

    private final DiscountMapper discountMapper = new DiscountMapper();
    private final InventoryMapper inventoryMapper = new InventoryMapper();

    @Override
    public Product mapRow(ResultSet rs) {
        Product product = new Product();
        Discount discount = discountMapper.mapRow(rs);
        Category category = categoryMapper.mapRow(rs);
        Inventory inventory = inventoryMapper.mapRow(rs);
        try {
            product.setId(rs.getString("product_id"));
            product.setName(rs.getString("product_name"));
            product.setSlug(rs.getString("product_slug"));
            product.setSku(rs.getString("product_sku"));
            product.setDesc(rs.getString("product_desc"));
            product.setPrice(rs.getBigDecimal("product_price"));
            product.setInventory(inventory);
            product.setCategory(category);
            product.setDiscount(discount);
            product.setCreatedAt(rs.getTimestamp("createdAt"));
            product.setModifiedAt(rs.getTimestamp("modifiedAt"));
            product.setDeletedAt(rs.getTimestamp("deletedAt"));
        } catch (SQLException exception) {
            System.out.println(exception.getMessage());
            return null;
        }
        return product;
    }
}
