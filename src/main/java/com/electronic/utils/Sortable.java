package com.electronic.utils;

import java.util.StringJoiner;

public class Sortable {
    private String sortBy;

    public String generateQuery() {
        StringJoiner joiner = new StringJoiner(" ");
        if (sortBy != null) {
            if (sortBy.equalsIgnoreCase("gia-tang-dan")) joiner.add("ORDER BY product_price ASC");
            if (sortBy.equalsIgnoreCase("gia-giam-dan")) joiner.add("ORDER BY product_price DESC");
            if (sortBy.equalsIgnoreCase("ten-tang-dan")) joiner.add("ORDER BY product_name ASC");
            if (sortBy.equalsIgnoreCase("ten-giam-dan")) joiner.add("ORDER BY product_name DESC");
        }
        return joiner.toString();
    }

    @Override
    public String toString() {
        return "Sortable{" +
                "sortBy='" + sortBy + '\'' +
                '}';
    }

    public String getSortBy() {
        return sortBy;
    }

    public void setSortBy(String sortBy) {
        this.sortBy = sortBy;
    }
}
