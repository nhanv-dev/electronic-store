package com.electronic.utils;
import java.util.StringJoiner;

public class ProductFilter {
    private String price;
    private String status;
    private String discount;

    public String generateQuery() {
        StringJoiner joiner = new StringJoiner(" AND ");
        if (price != null) {
            if (price.equalsIgnoreCase("duoi-10-trieu"))
                joiner.add("product_price <= 10000000");
            else if (price.equalsIgnoreCase("tu-10-15-trieu"))
                joiner.add("product_price >= 10000000 AND product_price <= 15000000");
            else if (price.equalsIgnoreCase("tu-15-20-trieu"))
                joiner.add("product_price >= 15000000 AND product_price <= 20000000");
            else if (price.equalsIgnoreCase("tu-20-25-trieu"))
                joiner.add("product_price >= 20000000 AND product_price <= 25000000");
            else if (price.equalsIgnoreCase("tren-25-trieu"))
                joiner.add("product_price >= 25000000");
        }
        if (status != null && status.equalsIgnoreCase("con-hang")) joiner.add("quantity  > 0");
        if (discount != null && discount.equalsIgnoreCase("giam-gia")) joiner.add("discount_active = 1");
        return joiner.toString();
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getDiscount() {
        return discount;
    }

    public void setDiscount(String discount) {
        this.discount = discount;
    }
}

