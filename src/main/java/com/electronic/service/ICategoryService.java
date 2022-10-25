package com.electronic.service;

import com.electronic.model.Category;

import java.util.List;

public interface ICategoryService {

    List<Category> findAll();

    Category findOne(String id);

    Category findBySlug(String slug);

    Category findByName(String name);

    Category insert(Category category);

    void update(Category category);

    void delete(String id);
}
