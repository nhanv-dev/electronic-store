package com.electronic.dao.implement;

import com.electronic.dao.IWishListItemDao;
import com.electronic.mapper.CartItemMapper;
import com.electronic.mapper.WishListItemMapper;
import com.electronic.model.WishListItem;

import java.util.List;
import java.util.StringJoiner;

public class WishListItemDao extends AbstractDao<WishListItem> implements IWishListItemDao {

    @Override
    public WishListItem findOne(String id) {
        StringJoiner joiner = new StringJoiner(" ");
        joiner.add("select * from wishlist_item");
        joiner.add("left join product p on wishlist_item.product_id = p.product_id");
        joiner.add("left join discount d on p.discount_id = d.discount_id");
        joiner.add("left join inventory i on p.inventory_id = i.inventory_id");
        joiner.add("left join category c on p.category_id = c.category_id");
        joiner.add("where item_id = ?");
        List<WishListItem> result = query(joiner.toString(), new WishListItemMapper(), id);
        return result.isEmpty() ? null : result.get(0);
    }

    @Override
    public List<WishListItem> findByWishListId(String wishListId) {
        StringJoiner joiner = new StringJoiner(" ");
        joiner.add("select * from wishlist_item");
        joiner.add("left join product p on wishlist_item.product_id = p.product_id");
        joiner.add("left join discount d on p.discount_id = d.discount_id");
        joiner.add("left join inventory i on p.inventory_id = i.inventory_id");
        joiner.add("left join category c on p.category_id = c.category_id");
        joiner.add("where wishlist_id = ?");
        return query(joiner.toString(), new WishListItemMapper(), wishListId);
    }

    @Override
    public WishListItem insert(WishListItem wishListItem) {
        StringJoiner joiner = new StringJoiner(" ");
        joiner.add("insert into wishlist_item(item_id, wishlist_id, product_id) values(?, ?, ?)");
        insert(joiner.toString(), wishListItem.getId(), wishListItem.getWishListId(), wishListItem.getProduct().getId());
        return findOne(wishListItem.getId());
    }

    @Override
    public void update(WishListItem wishListItem) {
        StringJoiner joiner = new StringJoiner(" ");
        joiner.add("update wishlist_item set wishlist_id = ?, product_id = ?");
        joiner.add("where item_id = ?");
        update(joiner.toString(), wishListItem.getWishListId(), wishListItem.getProduct().getId(), wishListItem.getId());
    }

    @Override
    public void delete(String id) {
        StringJoiner joiner = new StringJoiner(" ");
        joiner.add("delete from wishlist_item where item_id = ?");
        delete(joiner.toString(), id);
    }

    @Override
    public void deleteByProductId(String productId) {
        String sql = "delete from wishlist_item where product_id = ?";
        delete(sql, productId);
    }

    @Override
    public void deleteByWishListId(String id) {
        StringJoiner joiner = new StringJoiner(" ");
        joiner.add("delete from wishlist_item where wishlist_id = ?");
        delete(joiner.toString(), id);
    }
}
