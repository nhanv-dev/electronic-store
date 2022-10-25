package com.electronic.dao;

import com.electronic.model.Inventory;


public interface IInventoryDao extends GenericDao<Inventory> {

    Inventory findOne(String id);

    Inventory insert(Inventory inventory);

    void update(Inventory inventory);

    void delete(String id);

    void updateByProductId(String productId, int quantity);

}
