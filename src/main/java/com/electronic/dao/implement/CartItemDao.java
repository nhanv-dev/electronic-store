package com.electronic.dao.implement;

import com.electronic.dao.ICartItemDao;
import com.electronic.dao.IUserDao;
import com.electronic.mapper.CartItemMapper;
import com.electronic.mapper.IRowMapper;
import com.electronic.mapper.ProductMapper;
import com.electronic.mapper.UserMapper;
import com.electronic.model.CartItem;
import com.electronic.model.User;

import java.util.List;
import java.util.StringJoiner;

public class CartItemDao extends AbstractDao<CartItem> implements ICartItemDao {

    @Override
    public CartItem findOne(String id) {
        StringJoiner joiner = new StringJoiner(" ");
        joiner.add("select * from cart_item");
        joiner.add("left join product p on cart_item.product_id = p.product_id");
        joiner.add("left join discount d on p.discount_id = d.discount_id");
        joiner.add("left join inventory i on p.inventory_id = i.inventory_id");
        joiner.add("left join category c on p.category_id = c.category_id");
        joiner.add("where item_id = ?");
        List<CartItem> result = query(joiner.toString(), new CartItemMapper(), id);
        return result.isEmpty() ? null : result.get(0);
    }

    @Override
    public List<CartItem> findByCartId(String cartId) {
        StringJoiner joiner = new StringJoiner(" ");
        joiner.add("select * from cart_item");
        joiner.add("left join product p on cart_item.product_id = p.product_id");
        joiner.add("left join discount d on p.discount_id = d.discount_id");
        joiner.add("left join inventory i on p.inventory_id = i.inventory_id");
        joiner.add("left join category c on p.category_id = c.category_id");
        joiner.add("where cart_id = ?");
        return query(joiner.toString(), new CartItemMapper(), cartId);
    }

    @Override
    public CartItem insert(CartItem cartItem) {
        StringJoiner joiner = new StringJoiner(" ");
        joiner.add("insert into cart_item(item_id, cart_id, product_id, quantity)");
        joiner.add("values(?, ?, ?, ?)");
        insert(joiner.toString(), cartItem.getId(), cartItem.getCartId(), cartItem.getProduct().getId(), cartItem.getQuantity());
        return findOne(cartItem.getId());
    }

    @Override
    public void update(CartItem cartItem) {
        StringJoiner joiner = new StringJoiner(" ");
        joiner.add("update cart_item set cart_id = ?, product_id = ?, quantity = ?");
        joiner.add("where item_id = ?");
        update(joiner.toString(), cartItem.getCartId(), cartItem.getProduct().getId(), cartItem.getQuantity(), cartItem.getId());
    }

    @Override
    public void delete(String id) {
        StringJoiner joiner = new StringJoiner(" ");
        joiner.add("delete from cart_item where item_id = ?");
        delete(joiner.toString(), id);
    }

    @Override
    public void deleteByProductId(String productId) {
        String sql = "delete from cart_item where product_id = ?";
        delete(sql, productId);
    }

    @Override
    public void deleteByCartId(String cartId) {
        StringJoiner joiner = new StringJoiner(" ");
        joiner.add("delete from cart_item where cart_id = ?");
        delete(joiner.toString(), cartId);
    }
}
