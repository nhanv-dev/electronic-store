package com.electronic.service;

import com.electronic.model.Cart;
import com.electronic.model.CartItem;

import java.util.List;

public interface ICartService {

    List<Cart> findAll();

    Cart findOne(String id);

    Cart findByUserId(String userId);

    Cart insert(Cart cart);

    void update(Cart cart);

    void delete(String id);

    CartItem insertItem(CartItem item);

    void updateItem(CartItem item);

    void deleteItemById(String id);

    List<CartItem> updateItems(List<CartItem> items);

}
