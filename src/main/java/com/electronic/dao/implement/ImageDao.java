package com.electronic.dao.implement;

import com.electronic.dao.IImageDao;
import com.electronic.mapper.ImageMapper;
import com.electronic.mapper.WishListMapper;
import com.electronic.model.Image;
import com.electronic.model.WishList;

import java.util.List;
import java.util.StringJoiner;

public class ImageDao extends AbstractDao<Image> implements IImageDao {
    @Override
    public List<Image> findByProductId(String productId) {
        String sql = "SELECT * FROM IMAGE WHERE product_id = ?";
        return query(sql, new ImageMapper(), productId);
    }

    @Override
    public Image findOne(String id) {
        StringJoiner joiner = new StringJoiner(" ");
        joiner.add("SELECT * FROM image WHERE image_id = ?");
        List<Image> result = query(joiner.toString(), new ImageMapper(), id);
        return result.isEmpty() ? null : result.get(0);
    }

    @Override
    public Image insert(Image image) {
        StringJoiner joiner = new StringJoiner(" ");
        joiner.add("insert into image(image_id, product_id, image_url) values(?,?,?)");
        insert(joiner.toString(), image.getId(), image.getProductId(), image.getUrl());
        return findOne(image.getId());
    }

    @Override
    public void update(Image image) {
        StringJoiner joiner = new StringJoiner(" ");
        joiner.add("update image set image_id = ?, product_id = ?, image_url = ? where image_id = ?");
        update(joiner.toString(), image.getId(), image.getProductId(), image.getUrl(), image.getId());
    }

    @Override
    public void delete(String id) {
        String sql = "delete from image where image_id = ?";
        delete(sql, id);
    }

    @Override
    public void deleteByProductId(String productId) {
        String sql = "delete from image where product_id = ?";
        delete(sql, productId);
    }

}
