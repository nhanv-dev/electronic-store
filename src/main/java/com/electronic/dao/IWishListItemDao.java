package com.electronic.dao;

import com.electronic.model.WishListItem;

import java.util.List;

public interface IWishListItemDao extends GenericDao<WishListItem> {

    WishListItem findOne(String id);

    List<WishListItem> findByWishListId(String wishListId);

    WishListItem insert(WishListItem wishListItem);

    void update(WishListItem wishListItem);

    void delete(String id);

    void deleteByProductId(String productId);

    void deleteByWishListId(String id);
}
