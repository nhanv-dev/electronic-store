package com.electronic.dao.implement;

import com.electronic.dao.IWishListDao;
import com.electronic.mapper.WishListItemMapper;
import com.electronic.mapper.WishListMapper;
import com.electronic.model.WishList;

import java.util.List;
import java.util.StringJoiner;

public class WishListDao extends AbstractDao<WishList> implements IWishListDao {

    @Override
    public List<WishList> findAll() {
        String sql = "SELECT * FROM WISHLIST";
        return query(sql, new WishListMapper());
    }

    @Override
    public WishList findOne(String id) {
        StringJoiner joiner = new StringJoiner(" ");
        joiner.add("SELECT * FROM wishlist WHERE wishlist_id = ?");
        List<WishList> result = query(joiner.toString(), new WishListMapper(), id);
        return result.isEmpty() ? null : result.get(0);
    }

    @Override
    public WishList findByUserId(String userId) {
        StringJoiner joiner = new StringJoiner(" ");
        joiner.add("select * from wishlist left join user on wishlist.user_id = user.user_id");
        joiner.add("where wishlist.user_id = ?");
        List<WishList> result = query(joiner.toString(), new WishListMapper(), userId);
        return result.isEmpty() ? null : result.get(0);
    }

    @Override
    public WishList insert(WishList wishList) {
        StringJoiner joiner = new StringJoiner(" ");
        joiner.add("insert into wishlist(wishlist_id, user_id) values(?, ?)");
        insert(joiner.toString(), wishList.getId(), wishList.getUserId());
        return findOne(wishList.getId());
    }

    @Override
    public void update(WishList wishList) {
        StringJoiner joiner = new StringJoiner(" ");
        joiner.add("update wishlist set user_id = ?");
        joiner.add("where wishlist_id = ?");
        update(joiner.toString(), wishList.getUserId(), wishList.getId());
    }

    @Override
    public void delete(String id) {
        StringJoiner joiner = new StringJoiner(" ");
        joiner.add("delete from wishlist where wishlist_id = ?");
        delete(joiner.toString(), id);
    }
}
