package com.electronic.model;

import com.electronic.dao.implement.AbstractDao;
import com.electronic.utils.RandomStringGenerator;

import java.util.ArrayList;
import java.util.List;

public class Order extends AbstractModel {
    private String id, userId, status;
    private double total;
    private List<OrderItem> items;

    public Order() {
        id = RandomStringGenerator.randomString(10);
        total = 0;
        items = new ArrayList<>();
    }

    @Override
    public String toString() {
        return "Order{" +
                "id='" + id + '\'' +
                ", userId='" + userId + '\'' +
                ", total=" + total +
                '}';
    }

    public void addItem(OrderItem item) {
        if (!items.contains(item))
            items.add(item);
        updateTotal();
    }

    public void addAllItem(List<OrderItem> items) {
        if (items != null)
            for (OrderItem item : items) addItem(item);
        updateTotal();
    }

    public void updateTotal() {
        if (items.size() <= 0) return;
        total = 0;
        for (OrderItem item : items) {
            total += item.getTotal();
        }
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

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public List<OrderItem> getItems() {
        return items;
    }

    public void setItems(List<OrderItem> items) {
        this.items = items;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
