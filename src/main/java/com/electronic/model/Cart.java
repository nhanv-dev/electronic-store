package com.electronic.model;

import com.electronic.utils.RandomStringGenerator;

import java.util.ArrayList;
import java.util.List;

public class Cart {
    private String id, userId;
    private List<CartItem> items;
    private double total;
    private int amount;

    public Cart() {
        id = RandomStringGenerator.randomString(10);
        items = new ArrayList<>();
        total = 0;
        amount = 0;
    }

    @Override
    public String toString() {
        return "Cart{" +
                "id='" + id + '\'' +
                ", userId='" + userId + '\'' +
                ", items=" + items +
                ", total=" + total +
                ", amount=" + amount +
                '}';
    }

    public void addAllItem(Cart cart) {
        if (cart != null && cart.getItems() != null)
            for (CartItem item : cart.getItems()) addItem(item);
    }

    public void addAllItem(List<CartItem> items) {
        if (items != null)
            for (CartItem item : items) addItem(item);
    }

    public void addItem(CartItem item) {
        int index = containItem(item);
        if (index >= 0) {
            CartItem _item = items.get(index);
            _item.setQuantity(_item.getQuantity() + item.getQuantity());
        } else {
            items.add(item);
            item.setCartId(id);
        }
        updateAmount();
        updateTotal();
    }

    public void removeItem(CartItem item) {
        items.removeIf(_item -> _item.getId().equals(item.getId()) || _item.getProduct().getId().equals(item.getProduct().getId()));
        updateAmount();
        updateTotal();
    }

    public void removeItem(Product product) {
        items.removeIf(item -> item.getProduct().getId().equals(product.getId()));
        updateAmount();
        updateTotal();
    }

    public void removeItem(String id) {
        items.removeIf(item -> id.equals(item.getId()));
        updateAmount();
        updateTotal();
    }

    public void updateTotal() {
        total = 0;
        for (CartItem item : items) total += item.getTotal();
    }

    public void updateAmount() {
        amount = 0;
        for (CartItem item : items) amount += item.getQuantity();
    }

    public CartItem getItemById(String id) {
        for (CartItem item : items) {
            if (item.getId().equals(id)) {
                return item;
            }
        }
        return null;
    }

    public int containItem(CartItem item) {
        for (int i = 0; i < items.size(); i++) {
            if (items.get(i).getId() != null && items.get(i).getId().equals(item.getId()))
                return i;
            if (items.get(i).getProduct().getId() != null && items.get(i).getProduct().getId().equals(item.getProduct().getId()))
                return i;
        }
        return -1;
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

    public List<CartItem> getItems() {
        return items;
    }

    public void setItems(List<CartItem> items) {
        this.items = items;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }
}
