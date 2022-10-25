package com.electronic.dao.implement;

import com.electronic.dao.ICartDao;
import com.electronic.dao.ICartItemDao;
import com.electronic.mapper.CartItemMapper;
import com.electronic.mapper.CartMapper;
import com.electronic.mapper.ProductMapper;
import com.electronic.model.Cart;
import com.electronic.model.CartItem;

import java.util.List;
import java.util.StringJoiner;

public class CartDao extends AbstractDao<Cart> implements ICartDao {


    @Override
    public List<Cart> findAll() {
        StringJoiner joiner = new StringJoiner(" ");
        joiner.add("select * from cart");
        return query(joiner.toString(), new CartMapper());
    }

    @Override
    public Cart findOne(String id) {
        StringJoiner joiner = new StringJoiner(" ");
        joiner.add("select * from cart");
        joiner.add("where cart_id = ?");
        List<Cart> result = query(joiner.toString(), new CartMapper(), id);
        return result.isEmpty() ? null : result.get(0);
    }

    @Override
    public Cart findByUserId(String userId) {
        StringJoiner joiner = new StringJoiner(" ");
        joiner.add("select * from cart");
        joiner.add("where user_id = ?");
        List<Cart> result = query(joiner.toString(), new CartMapper(), userId);
        return result.isEmpty() ? null : result.get(0);
    }

    @Override
    public Cart insert(Cart cart) {
        StringJoiner joiner = new StringJoiner(" ");
        joiner.add("insert into cart (cart_id, user_id, cart_total)");
        joiner.add("values (?, ?, ?)");
        insert(joiner.toString(), cart.getId(), cart.getUserId(), cart.getTotal());
        return findOne(cart.getId());
    }

    @Override
    public void update(Cart cart) {
        StringJoiner joiner = new StringJoiner(" ");
        joiner.add("update cart set user_id = ?, cart_total = ?");
        joiner.add("where cart_id = ?");
        update(joiner.toString(), cart.getUserId(), cart.getTotal(), cart.getId());
    }

    @Override
    public void delete(String id) {
        StringJoiner joiner = new StringJoiner(" ");
        joiner.add("delete from cart where cart_id = ?");
        delete(joiner.toString(), id);
    }
}
