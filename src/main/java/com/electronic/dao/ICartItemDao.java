package com.electronic.dao;

import com.electronic.model.CartItem;
import com.electronic.model.User;

import java.util.List;

public interface ICartItemDao extends GenericDao<CartItem> {
    CartItem findOne(String id);

    List<CartItem> findByCartId(String cartId);

    CartItem insert(CartItem cartItem);

    void update(CartItem cartItem);

    void delete(String id);

    void deleteByProductId(String productId);

    void deleteByCartId(String cartId);
}
