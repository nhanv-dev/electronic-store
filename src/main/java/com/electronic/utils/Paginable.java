package com.electronic.utils;

public class Paginable {

    private int amount, totalProduct;
    private int offset, limit;
    private int totalPage;
    private int page;

    public Paginable() {
    }

    public Paginable(int amount, int totalProduct, int page) {
        this.amount = amount;
        this.totalProduct = totalProduct;
        this.offset = (page - 1) * amount;
        this.limit = amount;
        this.page = page;
        this.totalPage = (int) Math.ceil((double) totalProduct / amount);
    }

    @Override
    public String toString() {
        return "Paginable{" +
                "amount=" + amount +
                ", totalProduct=" + totalProduct +
                ", offset=" + offset +
                ", limit=" + limit +
                ", totalPage=" + totalPage +
                '}';
    }

    public int getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public int getOffset() {
        return offset;
    }

    public void setOffset(int offset) {
        this.offset = offset;
    }

    public int getLimit() {
        return limit;
    }

    public void setLimit(int limit) {
        this.limit = limit;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public int getTotalProduct() {
        return totalProduct;
    }

    public void setTotalProduct(int totalProduct) {
        this.totalProduct = totalProduct;
    }

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }
}