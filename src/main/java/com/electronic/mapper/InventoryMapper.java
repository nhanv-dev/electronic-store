package com.electronic.mapper;

import com.electronic.model.Inventory;

import java.sql.ResultSet;
import java.sql.SQLException;

public class InventoryMapper implements IRowMapper<Inventory> {

    @Override
    public Inventory mapRow(ResultSet rs) {
        Inventory inventory = new Inventory();
        try {
            inventory.setId(rs.getString("inventory_id"));
            inventory.setQuantity(rs.getInt("i.quantity"));
        } catch (SQLException exception) {
            return null;
        }
        return inventory;
    }
}
