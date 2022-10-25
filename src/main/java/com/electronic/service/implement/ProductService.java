package com.electronic.service.implement;

import com.electronic.dao.*;
import com.electronic.dao.implement.*;
import com.electronic.model.Image;
import com.electronic.model.Product;
import com.electronic.utils.ProductFilter;
import com.electronic.service.IProductService;
import com.electronic.utils.Paginable;
import com.electronic.utils.Sortable;

import java.util.List;

public class ProductService implements IProductService {
    private final IProductDao productDao = new ProductDao();
    private final IOrderItemDao orderItemDao = new OrderItemDao();
    private final ICartItemDao cartItemDao = new CartItemDao();
    private final IWishListItemDao wishListItemDao = new WishListItemDao();
    private final IImageDao imageDao = new ImageDao();
    private final IInventoryDao inventoryDao = new InventoryDao();

    @Override
    public List<Product> findAll(Paginable paginable, ProductFilter productFilter, Sortable sortable) {
        List<Product> products = productDao.findAll(paginable, productFilter, sortable);
        for (Product product : products)
            product.setImages(imageDao.findByProductId(product.getId()));

        return products;
    }

    @Override
    public List<Product> findByCategoryId(String categoryId, Paginable paginable, ProductFilter productFilter, Sortable sortable) {
        List<Product> products = productDao.findByCategoryId(categoryId, paginable, productFilter, sortable);
        for (Product product : products)
            product.setImages(imageDao.findByProductId(product.getId()));

        return products;
    }

    @Override
    public List<Product> searchByName(String name, Paginable paginable, ProductFilter productFilter, Sortable sortable) {
        List<Product> products = productDao.searchByName(name, paginable, productFilter, sortable);
        for (Product product : products)
            product.setImages(imageDao.findByProductId(product.getId()));

        return products;
    }

    @Override
    public List<Product> findByTopSale(int top, ProductFilter productFilter, Sortable sortable) {
        List<Product> products = productDao.findByTopSale(top, productFilter);
        for (Product product : products)
            product.setImages(imageDao.findByProductId(product.getId()));

        return products;
    }

    @Override
    public Product findOne(String productId) {
        Product product = productDao.findOne(productId);
        if (product != null) product.setImages(imageDao.findByProductId(product.getId()));

        return product;
    }

    @Override
    public Product findBySlug(String productSlug) {
        Product product = productDao.findBySlug(productSlug);
        if (product != null) product.setImages(imageDao.findByProductId(product.getId()));

        return product;
    }

    @Override
    public Product insert(Product product) {
        inventoryDao.insert(product.getInventory());
        productDao.insert(product);
        insertImages(product.getImages());
        return productDao.findOne(product.getId());
    }

    @Override
    public Product update(Product product) {
        inventoryDao.update(product.getInventory());
        productDao.update(product);
        insertImages(product.getImages());
        return findOne(product.getId());
    }

    @Override
    public Product updateInventory(Product product) {
        inventoryDao.update(product.getInventory());
        return findOne(product.getId());
    }

    @Override
    public void delete(String id) {
        deleteRelatedProduct(id);
        productDao.delete(id);
    }

    @Override
    public void deleteByCategoryId(String categoryId) {
        List<Product> products = productDao.findByCategoryId(categoryId, null, null, null);
        for (Product product : products) deleteRelatedProduct(product.getId());
        productDao.delete(categoryId);
    }

    @Override
    public void deleteRelatedProduct(String productId) {
        imageDao.deleteByProductId(productId);
        cartItemDao.deleteByProductId(productId);
        orderItemDao.deleteByProductId(productId);
        wishListItemDao.delete(productId);
    }

    public void insertImages(List<Image> images) {
        for (Image image : images) {
            if (imageDao.findOne(image.getId()) == null) imageDao.insert(image);
            else imageDao.update(image);
        }
    }

    @Override
    public int count(ProductFilter productFilter) {
        return productDao.count(productFilter);
    }

    @Override
    public int countByCategoryId(String id, ProductFilter productFilter) {
        return productDao.countByCategoryId(id, productFilter);
    }

    @Override
    public int countBySearchName(String name, ProductFilter productFilter) {
        return productDao.countBySearchName(name, productFilter);
    }

    @Override
    public void deleteImage(String id) {
        imageDao.delete(id);
    }
}
