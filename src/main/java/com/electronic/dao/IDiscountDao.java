package com.electronic.dao;

import com.electronic.model.Discount;

import java.util.List;

public interface IDiscountDao extends GenericDao<Discount> {

    Discount findOne(String id);

    List<Discount> findAll();

    List<Discount> findByActive(boolean active);

    Discount insert(Discount discount);

    void update(Discount discount);

    void delete(String id);
}
