package com.electronic.dao.implement;

import com.electronic.dao.IOrderItemDao;
import com.electronic.dao.IWishListItemDao;
import com.electronic.mapper.CartMapper;
import com.electronic.mapper.OrderItemMapper;
import com.electronic.mapper.WishListMapper;
import com.electronic.model.Cart;
import com.electronic.model.OrderItem;
import com.electronic.model.WishList;
import com.electronic.model.WishListItem;

import java.util.List;
import java.util.StringJoiner;

public class OrderItemDao extends AbstractDao<OrderItem> implements IOrderItemDao {

    @Override
    public OrderItem findOne(String id) {
        StringJoiner joiner = new StringJoiner(" ");
        joiner.add("select * from orders_item ");
        joiner.add("inner join product p on orders_item.product_id = p.product_id");
        joiner.add("left join discount d on p.discount_id = d.discount_id");
        joiner.add("left join inventory i on p.inventory_id = i.inventory_id");
        joiner.add("left join category c on p.category_id = c.category_id");
        joiner.add("where item_id = ?");
        List<OrderItem> result = query(joiner.toString(), new OrderItemMapper(), id);
        return result.isEmpty() ? null : result.get(0);
    }

    @Override
    public List<OrderItem> findByOrderId(String orderId) {
        StringJoiner joiner = new StringJoiner(" ");
        joiner.add("select * from orders_item ");
        joiner.add("inner join product p on orders_item.product_id = p.product_id");
        joiner.add("left join discount d on p.discount_id = d.discount_id");
        joiner.add("left join inventory i on p.inventory_id = i.inventory_id");
        joiner.add("left join category c on p.category_id = c.category_id");
        joiner.add("where order_id = ?");
        return query(joiner.toString(), new OrderItemMapper(), orderId);
    }

    @Override
    public OrderItem insert(OrderItem orderItem) {
        StringJoiner joiner = new StringJoiner(" ");
        joiner.add("insert into orders_item(item_id, order_id, product_id, quantity) values(?, ?, ?, ?)");
        insert(joiner.toString(),  orderItem.getId(),
                orderItem.getOrderId(), orderItem.getProduct().getId(), orderItem.getQuantity());
        return findOne(orderItem.getId());
    }

    @Override
    public void update(OrderItem orderItem) {
        StringJoiner joiner = new StringJoiner(" ");
        joiner.add("update orders_item set item_id = ?, order_id = ?, product_id = ?, quantity = ?");
        update(joiner.toString(), orderItem.getId(), orderItem.getOrderId(), orderItem.getProduct().getId(), orderItem.getQuantity());
    }

    @Override
    public void deleteByProductId(String productId) {
        String sql = "delete from orders_item where product_id = ?";
        delete(sql, productId);
    }

    @Override
    public void deleteByOrderId(String orderId) {
        String sql = "delete from orders_item where order_id = ?";
        delete(sql, orderId);
    }

    @Override
    public void delete(String id) {
        StringJoiner joiner = new StringJoiner(" ");
        joiner.add("delete from orders_item where item_id = ?");
        delete(joiner.toString(), id);
    }
}
