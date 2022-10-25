package com.electronic.service;

import com.electronic.model.Discount;

import java.util.List;

public interface IDiscountService {
    Discount findOne(String id);

    List<Discount> findAll();

    List<Discount> findByActive(boolean active);

    Discount insert(Discount discount);

    void update(Discount discount);

    void delete(String id);

}
