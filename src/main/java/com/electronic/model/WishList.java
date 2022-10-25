package com.electronic.model;

import com.electronic.utils.RandomStringGenerator;

import java.util.ArrayList;
import java.util.List;

public class WishList {
    private String id, userId;
    private List<WishListItem> items;

    public WishList() {
        id = RandomStringGenerator.randomString(10);
        items = new ArrayList<>();
    }

    @Override
    public String toString() {
        return "WishList{" +
                "id='" + id + '\'' +
                ", userId='" + userId + '\'' +
                ", items=" + items +
                '}';
    }

    public void addAllItem(WishList wishList) {
        if (wishList != null && wishList.getItems() != null && !wishList.getItems().isEmpty())
            for (WishListItem item : wishList.getItems()) addItem(item);

    }

    public void addAllItem(List<WishListItem> items) {
        if (items != null && !items.isEmpty())
            for (WishListItem item : items) addItem(item);

    }

    public void addItem(WishListItem item) {
        if (items.isEmpty()) {
            items.add(item);
            item.setWishListId(this.getId());
            return;
        }
        for (WishListItem _item : items) {
            if (_item.getId().equals(item.getId()) || _item.getProduct().getId().equals(item.getProduct().getId())) {
                return;
            }
        }
        items.add(item);
        item.setWishListId(id);
    }

    public void removeItem(WishListItem item) {
        for (WishListItem _item : items) {
            if (_item.getId().equals(id) || _item.getProduct().getId().equals(item.getProduct().getId()))
                items.remove(item);
        }

    }

    public void removeItem(String itemId) {
        items.removeIf(item -> item.getId().equals(itemId));
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public List<WishListItem> getItems() {
        return items;
    }

    public void setItems(List<WishListItem> items) {
        this.items = items;
    }

}
