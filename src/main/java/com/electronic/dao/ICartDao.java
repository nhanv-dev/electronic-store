package com.electronic.dao;

import com.electronic.model.Cart;
import com.electronic.model.CartItem;

import java.util.List;

public interface ICartDao extends GenericDao<Cart> {
    List<Cart> findAll();

    Cart findOne(String id);

    Cart findByUserId(String userId);

    Cart insert(Cart cart);

    void update(Cart cart);

    void delete(String id);
}
