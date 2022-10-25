package com.electronic.service;

import com.electronic.model.Cart;
import com.electronic.model.WishList;
import com.electronic.model.WishListItem;

import java.util.List;

public interface IWishListService {

    List<WishList> findAll();

    WishList findOne(String id);

    WishList findByUserId(String userId);

    WishList insert(WishList wishList);

    void update(WishList wishList);

    void delete(String id);

    List<WishListItem> updateItems(List<WishListItem> items);

    void deleteItem(String id);
}
