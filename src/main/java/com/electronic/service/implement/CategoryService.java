package com.electronic.service.implement;

import com.electronic.dao.*;
import com.electronic.dao.implement.*;
import com.electronic.model.Category;
import com.electronic.model.Product;
import com.electronic.service.ICategoryService;

import java.util.List;

public class CategoryService implements ICategoryService {
    private final ICategoryDao categoryDao = new CategoryDao();
    private final IProductDao productDao = new ProductDao();
    private final IOrderItemDao orderItemDao = new OrderItemDao();
    private final ICartItemDao cartItemDao = new CartItemDao();
    private final IWishListItemDao wishListItemDao = new WishListItemDao();
    private final IImageDao imageDao = new ImageDao();
    private final IInventoryDao inventoryDao = new InventoryDao();

    @Override
    public List<Category> findAll() {
        return categoryDao.findAll();
    }

    @Override
    public Category findOne(String id) {
        return categoryDao.findOne(id);
    }

    @Override
    public Category findBySlug(String slug) {
        return categoryDao.findBySlug(slug);
    }

    @Override
    public Category findByName(String name) {
        return categoryDao.findByName(name);
    }

    @Override
    public Category insert(Category category) {
        return categoryDao.insert(category);
    }

    @Override
    public void update(Category category) {
        categoryDao.update(category);
    }

    @Override
    public void delete(String id) {
        List<Product> products = productDao.findByCategoryId(id, null, null, null);
        for (Product product : products) deleteRelatedProduct(product.getId());
        productDao.deleteByCategoryId(id);
        for (Product product : products) inventoryDao.delete(product.getInventory().getId());
        categoryDao.delete(id);
    }

    public void deleteRelatedProduct(String productId) {
        imageDao.deleteByProductId(productId);
        cartItemDao.deleteByProductId(productId);
        orderItemDao.deleteByProductId(productId);
        wishListItemDao.delete(productId);
    }
}
