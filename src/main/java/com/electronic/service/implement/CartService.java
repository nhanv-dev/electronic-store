package com.electronic.service.implement;

import com.electronic.dao.ICartDao;
import com.electronic.dao.ICartItemDao;
import com.electronic.dao.ICategoryDao;
import com.electronic.dao.IImageDao;
import com.electronic.dao.implement.CartDao;
import com.electronic.dao.implement.CartItemDao;
import com.electronic.dao.implement.CategoryDao;
import com.electronic.dao.implement.ImageDao;
import com.electronic.model.Cart;
import com.electronic.model.CartItem;
import com.electronic.model.Category;
import com.electronic.service.ICartService;
import com.electronic.service.ICategoryService;

import java.util.List;

public class CartService implements ICartService {
    private final ICartDao cartDao = new CartDao();
    private final ICartItemDao cartItemDao = new CartItemDao();
    private final IImageDao imageDao = new ImageDao();

    @Override
    public List<Cart> findAll() {
        List<Cart> carts = cartDao.findAll();
        for (Cart cart : carts) {
            if (cart != null) cart.addAllItem(findItemByCartId(cart.getId()));
        }
        return carts;
    }

    @Override
    public Cart findOne(String id) {
        Cart cart = cartDao.findOne(id);
        if (cart != null) cart.addAllItem(findItemByCartId(cart.getId()));
        return cart;
    }

    @Override
    public Cart findByUserId(String userId) {
        Cart cart = cartDao.findByUserId(userId);
        if (cart != null) cart.addAllItem(findItemByCartId(cart.getId()));
        return cart;
    }

    @Override
    public Cart insert(Cart cart) {
        if (cartDao.findOne(cart.getId()) == null) cartDao.insert(cart);
        else cartDao.update(cart);
        updateItems(cart.getItems());
        return findOne(cart.getId());
    }

    @Override
    public void update(Cart cart) {
        cart.setItems(updateItems(cart.getItems()));
        cartDao.update(cart);
    }

    @Override
    public void delete(String id) {
        cartItemDao.deleteByCartId(id);
        cartDao.delete(id);
    }

    @Override
    public CartItem insertItem(CartItem item) {
        if (cartItemDao.findOne(item.getId()) == null) cartItemDao.insert(item);
        else cartItemDao.update(item);
        return cartItemDao.findOne(item.getId());
    }

    @Override
    public void updateItem(CartItem item) {
        cartItemDao.update(item);
    }

    @Override
    public void deleteItemById(String id) {
        cartItemDao.delete(id);
    }

    @Override
    public List<CartItem> updateItems(List<CartItem> items) {
        for (CartItem item : items) {
            CartItem _item = cartItemDao.findOne(item.getId());
            if (_item == null) cartItemDao.insert(item);
            else cartItemDao.update(item);
        }
        return items;
    }

    public List<CartItem> findItemByCartId(String cartId) {
        List<CartItem> items = cartItemDao.findByCartId(cartId);
        for (CartItem item : items) item.getProduct().setImages(imageDao.findByProductId(item.getProduct().getId()));
        return items;
    }
}
