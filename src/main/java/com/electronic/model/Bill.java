package com.electronic.model;

public class Bill {
    private String name_product;
    private String price_product;
    private int quantity_product;

    public Bill(String name_product, String price_product, int quantity_product) {
        this.name_product = name_product;
        this.price_product = price_product;
        this.quantity_product = quantity_product;
    }

    @Override
    public String toString() {
        return "Bill{" +
                "name_product='" + name_product + '\'' +
                ", price_product='" + price_product + '\'' +
                ", quantity_product=" + quantity_product +
                '}';
    }
}
