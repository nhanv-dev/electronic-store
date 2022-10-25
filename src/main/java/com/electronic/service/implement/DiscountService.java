package com.electronic.service.implement;

import com.electronic.dao.ICategoryDao;
import com.electronic.dao.IDiscountDao;
import com.electronic.dao.IProductDao;
import com.electronic.dao.implement.CategoryDao;
import com.electronic.dao.implement.DiscountDao;
import com.electronic.dao.implement.ProductDao;
import com.electronic.model.Category;
import com.electronic.model.Discount;
import com.electronic.model.Product;
import com.electronic.service.ICategoryService;
import com.electronic.service.IDiscountService;

import java.util.List;

public class DiscountService implements IDiscountService {
    private final IDiscountDao discountDao = new DiscountDao();
    private final IProductDao productDao = new ProductDao();

    @Override
    public Discount findOne(String id) {
        return discountDao.findOne(id);
    }

    @Override
    public List<Discount> findAll() {
        return discountDao.findAll();
    }

    @Override
    public List<Discount> findByActive(boolean active) {
        return discountDao.findByActive(active);
    }

    @Override
    public Discount insert(Discount discount) {
        return discountDao.insert(discount);
    }

    @Override
    public void update(Discount discount) {
        discountDao.update(discount);
    }

    @Override
    public void delete(String id) {
        List<Product> products = productDao.findByDiscountId(id);
        for (Product product : products) {
            product.setDiscount(null);
            productDao.update(product);
        }
        discountDao.delete(id);
    }
}
