package com.electronic.service.implement;

import com.electronic.dao.IWishListDao;
import com.electronic.dao.IWishListItemDao;
import com.electronic.dao.IImageDao;
import com.electronic.dao.implement.WishListDao;
import com.electronic.dao.implement.WishListItemDao;
import com.electronic.dao.implement.ImageDao;
import com.electronic.model.CartItem;
import com.electronic.model.Product;
import com.electronic.model.WishList;
import com.electronic.model.WishListItem;
import com.electronic.service.IWishListService;
import com.electronic.service.IWishListService;

import java.util.List;

public class WishListService implements IWishListService {
    private final IWishListDao wishListDao = new WishListDao();
    private final IWishListItemDao wishListItemDao = new WishListItemDao();
    private final IImageDao imageDao = new ImageDao();

    @Override
    public List<WishList> findAll() {
        List<WishList> lists = wishListDao.findAll();
        for (WishList list : lists) {
            List<WishListItem> items = wishListItemDao.findByWishListId(list.getId());
            for (WishListItem item : list.getItems()) {
                Product product = item.getProduct();
                product.setImages(imageDao.findByProductId(product.getId()));
            }
            list.addAllItem(items);
        }
        return lists;
    }

    @Override
    public WishList findOne(String id) {
        WishList list = wishListDao.findOne(id);
        if (list != null) {
            List<WishListItem> items = wishListItemDao.findByWishListId(list.getId());
            for (WishListItem item : items) {
                Product product = item.getProduct();
                product.setImages(imageDao.findByProductId(product.getId()));
            }
            list.addAllItem(items);
        }
        return list;
    }

    @Override
    public WishList findByUserId(String userId) {
        WishList list = wishListDao.findByUserId(userId);
        if (list != null) list.addAllItem(findItemByWishListId(list.getId()));
        return list;
    }

    @Override
    public WishList insert(WishList wishList) {
        wishList.setItems(updateItems(wishList.getItems()));
        if (findOne(wishList.getId()) == null) wishListDao.insert(wishList);
        else wishListDao.update(wishList);
        return findOne(wishList.getId());
    }

    @Override
    public void update(WishList wishList) {
        wishList.setItems(updateItems(wishList.getItems()));
        wishListDao.update(wishList);
    }

    @Override
    public void delete(String id) {
        wishListItemDao.deleteByWishListId(id);
        wishListDao.delete(id);
    }

    @Override
    public List<WishListItem> updateItems(List<WishListItem> items) {
        for (WishListItem item : items) {
            WishListItem _item = wishListItemDao.findOne(item.getId());
            if (_item == null) wishListItemDao.insert(item);
            else wishListItemDao.update(item);
        }
        return items;
    }

    @Override
    public void deleteItem(String id) {
        wishListItemDao.delete(id);
    }

    public List<WishListItem> findItemByWishListId(String id) {
        List<WishListItem> items = wishListItemDao.findByWishListId(id);
        for (WishListItem item : items)
            item.getProduct().setImages(imageDao.findByProductId(item.getProduct().getId()));
        return items;
    }

}
