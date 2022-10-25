package com.electronic.service;

import com.electronic.model.Product;
import com.electronic.utils.ProductFilter;
import com.electronic.utils.Paginable;
import com.electronic.utils.Sortable;

import java.util.List;

public interface IProductService {

    List<Product> findAll(Paginable paginable, ProductFilter productFilter, Sortable sortable);

    List<Product> findByCategoryId(String categoryId, Paginable paginable, ProductFilter productFilter, Sortable sortable);

    List<Product> searchByName(String name, Paginable paginable, ProductFilter productFilter, Sortable sortable);

    List<Product> findByTopSale(int top, ProductFilter productFilter, Sortable sortable);

    Product findOne(String productId);

    Product findBySlug(String productSlug);

    Product insert(Product product);

    Product update(Product product);

    Product updateInventory(Product product);

    void delete(String id);

    void deleteByCategoryId(String categoryId);

    void deleteRelatedProduct(String productId);

    int count(ProductFilter productFilter);

    int countByCategoryId(String id, ProductFilter productFilter);

    int countBySearchName(String name, ProductFilter productFilter);

    void deleteImage(String id);
}
