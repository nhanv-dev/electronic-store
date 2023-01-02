package com.electronic.model;

import com.electronic.utils.RandomStringGenerator;

public class OrderItem {
    private String id, orderId;
    private Product product;
    private int quantity;

    public OrderItem(String id, String orderId, Product product, int quantity) {
        this.id = id;
        this.orderId = orderId;
        this.product = product;
        this.quantity = quantity;
    }

    public OrderItem() {
        id = RandomStringGenerator.randomString(10);
        quantity = 0;
        product = new Product();
    }

    public double getTotal() {
        if (product.getDiscount() != null && product.getDiscount().isActive())
            return product.getPrice().doubleValue() * (1 - product.getDiscount().getPercent()) * quantity;
        return product.getPrice().doubleValue() * quantity;
    }

    @Override
    public String toString() {
        return "OrderItem{" +
                "id='" + id + '\'' +
                ", orderId='" + orderId + '\'' +
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

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
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
