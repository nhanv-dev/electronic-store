package com.electronic.dao;

import com.electronic.model.Product;
import com.electronic.utils.ProductFilter;
import com.electronic.utils.Paginable;
import com.electronic.utils.Sortable;

import java.util.List;

public interface IProductDao extends GenericDao<Product> {
    List<Product> findAll(Paginable paginable, ProductFilter filter, Sortable sortable);

    List<Product> findByCategoryId(String categoryId, Paginable paginable, ProductFilter productFilter, Sortable sortable);

    List<Product> searchByName(String name, Paginable paginable, ProductFilter productFilter, Sortable sortable);

    List<Product> findByDiscountId(String discountId);

    List<Product> findByTopSale(int top, ProductFilter productFilter);

    Product findOne(String productId);

    Product findBySlug(String productSlug);

    Product insert(Product product);

    void updateInventory(String productId, int quantity);

    void update(Product product);

    void delete(String id);

    void deleteByCategoryId(String categoryId);

    int count(ProductFilter productFilter);

    int countByCategoryId(String id, ProductFilter productFilter);

    int countBySearchName(String name, ProductFilter productFilter);
}
