package com.electronic.dao.implement;

import com.electronic.dao.IInventoryDao;
import com.electronic.mapper.DiscountMapper;
import com.electronic.mapper.InventoryMapper;
import com.electronic.model.Discount;
import com.electronic.model.Inventory;

import java.util.List;
import java.util.StringJoiner;

public class InventoryDao extends AbstractDao<Inventory> implements IInventoryDao {

    @Override
    public Inventory findOne(String id) {
        String sql = "select * from inventory where inventory_id = ?";
        List<Inventory> result = query(sql, new InventoryMapper(), id);
        return result.isEmpty() ? null : result.get(0);
    }

    @Override
    public Inventory insert(Inventory inventory) {
        String sql = "insert into inventory(inventory_id,quantity) values(?,?)";
        insert(sql, inventory.getId(), inventory.getQuantity());
        return findOne(inventory.getId());
    }

    @Override
    public void update(Inventory inventory) {
        String sql = "update inventory set quantity = ? where inventory_id = ?";
        update(sql, inventory.getQuantity(), inventory.getId());
    }

    @Override
    public void delete(String id) {
        String sql = "delete from inventory where inventory_id = ?";
        delete(sql, id);
    }

    @Override
    public void updateByProductId(String productId, int quantity) {
        StringJoiner joiner = new StringJoiner(" ");
        joiner.add("update inventory left join product p on inventory.inventory_id = p.inventory_id");
        joiner.add("set quantity = ?");
        joiner.add("where p.product_id = ?");
        update(joiner.toString(), quantity, productId);
    }
}
