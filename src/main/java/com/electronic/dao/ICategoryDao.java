package com.electronic.dao;

import com.electronic.model.Category;

import java.util.List;

public interface ICategoryDao extends GenericDao<Category> {
    List<Category> findAll();

    Category findOne(String id);

    Category findBySlug(String slug);

    Category findByName(String name);

    Category insert(Category category);

    void update(Category category);

    void delete(String id);
}
