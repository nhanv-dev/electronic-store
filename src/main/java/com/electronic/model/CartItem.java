package com.electronic.model;

import com.electronic.utils.RandomStringGenerator;

public class CartItem {
    private String id, cartId;
    private Product product;
    private int quantity;

    public CartItem() {
        id = RandomStringGenerator.randomString(10);
        quantity = 0;
        product = new Product();

    }

    public CartItem(Product product, int quantity) {
        id = RandomStringGenerator.randomString(10);
        this.product = product;
        this.quantity = quantity;
    }

    public double getTotal() {
        if (product.getDiscount() != null && product.getDiscount().isActive())
            return (product.getPrice().doubleValue() * (1 - product.getDiscount().getPercent())) * quantity;
        return product.getPrice().doubleValue() * quantity;
    }

    @Override
    public String toString() {
        return "CartItem{" +
                "id='" + id + '\'' +
                ", cartId='" + cartId + '\'' +
                ", product=" + product +
                ", quantity=" + quantity +
                '}';
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getCartId() {
        return cartId;
    }

    public void setCartId(String cartId) {
        this.cartId = cartId;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}
