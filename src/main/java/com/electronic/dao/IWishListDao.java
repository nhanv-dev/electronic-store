package com.electronic.dao;

import com.electronic.model.WishList;

import java.util.List;

public interface IWishListDao extends GenericDao<WishList> {
    List<WishList> findAll();

    WishList findOne(String id);

    WishList findByUserId(String userId);

    WishList insert(WishList wishList);

    void update(WishList wishList);

    void delete(String id);
}
