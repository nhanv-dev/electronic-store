package com.electronic.dao.implement;

import com.electronic.dao.ICategoryDao;
import com.electronic.mapper.CategoryMapper;
import com.electronic.model.Category;
import com.electronic.utils.SlugGeneratorUtils;

import java.util.List;
import java.util.StringJoiner;

public class CategoryDao extends AbstractDao<Category> implements ICategoryDao {

    @Override
    public List<Category> findAll() {
        String sql = "SELECT * FROM category";
        return query(sql, new CategoryMapper());
    }

    @Override
    public Category findOne(String id) {

        StringJoiner joiner = new StringJoiner(" ");
        joiner.add("SELECT * FROM category");
        joiner.add("WHERE category_id = ?");
        List<Category> result = query(joiner.toString(), new CategoryMapper(), id);
        return result.isEmpty() ? null : result.get(0);
    }

    @Override
    public Category findBySlug(String slug) {
        StringJoiner joiner = new StringJoiner(" ");
        joiner.add("SELECT * FROM category");
        joiner.add("WHERE category_slug = ?");
        List<Category> result = query(joiner.toString(), new CategoryMapper(), slug);
        return result.isEmpty() ? null : result.get(0);
    }

    @Override
    public Category findByName(String name) {
        StringJoiner joiner = new StringJoiner(" ");
        joiner.add("SELECT * FROM category");
        joiner.add("WHERE category_name = ?");
        List<Category> result = query(joiner.toString(), new CategoryMapper(), name);
        return result.isEmpty() ? null : result.get(0);
    }

    @Override
    public Category insert(Category category) {
        if (category.getSlug() == null || category.getSlug().isEmpty())
            category.setSlug(SlugGeneratorUtils.toSlug(category.getName()));
        StringJoiner joiner = new StringJoiner(" ");
        joiner.add("insert into category(category_id, category_name, category_slug)");
        joiner.add("values(?,?,?)");
        insert(joiner.toString(), category.getId(), category.getName(), category.getSlug());
        return findOne(category.getId());
    }

    @Override
    public void update(Category category) {
        if (category.getSlug() == null || category.getSlug().isEmpty())
            category.setSlug(SlugGeneratorUtils.toSlug(category.getName()));
        StringJoiner joiner = new StringJoiner(" ");
        joiner.add("update category set category_name = ? ,category_slug = ? where category_id = ?");
        update(joiner.toString(), category.getName(), category.getSlug(), category.getId());
    }

    @Override
    public void delete(String id) {
        StringJoiner joiner = new StringJoiner(" ");
        joiner.add("delete from category where category_id = ?");
        delete(joiner.toString(), id);
    }
}
