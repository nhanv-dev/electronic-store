package com.electronic.dao;

import com.electronic.model.Image;

import java.util.List;

public interface IImageDao extends GenericDao<Image> {
    List<Image> findByProductId(String productId);

    Image findOne(String id);

    Image insert(Image image);

    void update(Image image);

    void delete(String id);

    void deleteByProductId(String productId);

}
