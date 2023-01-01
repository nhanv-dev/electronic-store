package com.electronic.model;

public class Bill {
    private String nameProduct;
    private String priceProduct;
    private int quantityProduct;

    public Bill(String nameProduct, String priceProduct, int quantityProduct) {
        this.nameProduct = nameProduct;
        this.priceProduct = priceProduct;
        this.quantityProduct = quantityProduct;
    }

    @Override
    public String toString() {
        return "Bill{" +
                "nameProduct='" + nameProduct + '\'' +
                ", priceProduct='" + priceProduct + '\'' +
                ", quantityProduct=" + quantityProduct +
                '}';
    }

    public String getNameProduct() {
        return nameProduct;
    }

    public void setNameProduct(String nameProduct) {
        this.nameProduct = nameProduct;
    }

    public String getPriceProduct() {
        return priceProduct;
    }

    public void setPriceProduct(String priceProduct) {
        this.priceProduct = priceProduct;
    }

    public int getQuantityProduct() {
        return quantityProduct;
    }

    public void setQuantityProduct(int quantityProduct) {
        this.quantityProduct = quantityProduct;
    }
}
