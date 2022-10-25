package com.electronic.model;

import com.electronic.utils.RandomStringGenerator;

public class WishListItem {
    private String id, cartId;
    private Product product;

    public WishListItem() {
        id = RandomStringGenerator.randomString(10);
        product = new Product();
    }


    @Override
    public String toString() {
        return "WishListItem{" + "id='" + id + '\'' + ", cartId='" + cartId + '\'' + ", product=" + product + '}';
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getWishListId() {
        return cartId;
    }

    public void setWishListId(String cartId) {
        this.cartId = cartId;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

}
