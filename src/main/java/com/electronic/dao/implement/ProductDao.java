package com.electronic.dao.implement;

import com.electronic.dao.IProductDao;
import com.electronic.mapper.ProductMapper;
import com.electronic.model.Product;
import com.electronic.utils.ProductFilter;
import com.electronic.utils.Paginable;
import com.electronic.utils.SlugGeneratorUtils;
import com.electronic.utils.Sortable;

import java.util.List;
import java.util.StringJoiner;

public class ProductDao extends AbstractDao<Product> implements IProductDao {

    @Override
    public List<Product> findAll(Paginable paginable, ProductFilter productFilter, Sortable sortable) {
        StringJoiner joiner = new StringJoiner(" ");
        joiner.add("select * from product");
        joiner.add("left join discount d on product.discount_id = d.discount_id");
        joiner.add("left join inventory i on product.inventory_id = i.inventory_id");
        joiner.add("left join category c on product.category_id = c.category_id");
        joiner.add(filter(paginable, productFilter, sortable, false));

        return query(joiner.toString(), new ProductMapper());
    }

    @Override
    public List<Product> findByCategoryId(String categoryId, Paginable paginable, ProductFilter productFilter, Sortable sortable) {
        StringJoiner joiner = new StringJoiner(" ");
        joiner.add("select * from product");
        joiner.add("left join discount d on product.discount_id = d.discount_id");
        joiner.add("left join inventory i on product.inventory_id = i.inventory_id");
        joiner.add("left join category c on product.category_id = c.category_id");
        joiner.add("where product.category_id = ?");
        joiner.add(filter(paginable, productFilter, sortable, true));
        return query(joiner.toString(), new ProductMapper(), categoryId);
    }

    @Override
    public List<Product> searchByName(String name, Paginable paginable, ProductFilter productFilter, Sortable sortable) {
        StringJoiner joiner = new StringJoiner(" ");
        String pattern = "%" + name + "%";
        joiner.add("select * from product");
        joiner.add("left join discount d on product.discount_id = d.discount_id");
        joiner.add("left join inventory i on product.inventory_id = i.inventory_id");
        joiner.add("left join category c on product.category_id = c.category_id");
        joiner.add("where product_name like ?");
        joiner.add(filter(paginable, productFilter, sortable, true));
        return query(joiner.toString(), new ProductMapper(), pattern);
    }

    @Override
    public List<Product> findByDiscountId(String discountId) {
        StringJoiner joiner = new StringJoiner(" ");
        joiner.add("select * from product");
        joiner.add("left join discount d on product.discount_id = d.discount_id");
        joiner.add("left join inventory i on product.inventory_id = i.inventory_id");
        joiner.add("left join category c on product.category_id = c.category_id");
        joiner.add("where product.discount_id = ?");
        return query(joiner.toString(), new ProductMapper(), discountId);
    }


    @Override
    public List<Product> findByTopSale(int top, ProductFilter filter) {
        StringJoiner joiner = new StringJoiner(" ");
        joiner.add("select * from product");
        joiner.add("left join discount d on product.discount_id = d.discount_id");
        joiner.add("left join inventory i on product.inventory_id = i.inventory_id");
        joiner.add("left join category c on product.category_id = c.category_id");
        joiner.add("where discount_active = true");
        joiner.add("order by discount_percent desc");
        joiner.add("limit ?");
        return query(joiner.toString(), new ProductMapper(), top);

    }

    @Override
    public Product findOne(String productId) {
        StringJoiner joiner = new StringJoiner(" ");
        joiner.add("select * from product");
        joiner.add("left join discount d on product.discount_id = d.discount_id");
        joiner.add("left join inventory i on product.inventory_id = i.inventory_id");
        joiner.add("left join category c on product.category_id = c.category_id");
        joiner.add("where product_id = ?");
        List<Product> result = query(joiner.toString(), new ProductMapper(), productId);
        return result.isEmpty() ? null : result.get(0);
    }

    @Override
    public Product findBySlug(String productSlug) {
        StringJoiner joiner = new StringJoiner(" ");
        joiner.add("select * from product");
        joiner.add("left join discount d on product.discount_id = d.discount_id");
        joiner.add("left join inventory i on product.inventory_id = i.inventory_id");
        joiner.add("left join category c on product.category_id = c.category_id");
        joiner.add("where product_slug = ?");
        List<Product> result = query(joiner.toString(), new ProductMapper(), productSlug);
        return result.isEmpty() ? null : result.get(0);
    }

    @Override
    public Product insert(Product product) {
        String discountId = null;
        if (product.getDiscount() != null && product.getDiscount().getId() != null)
            discountId = product.getDiscount().getId();
        if (product.getSlug() == null || product.getSlug().isEmpty())
            product.setSlug(SlugGeneratorUtils.toSlug(product.getName()));
        StringJoiner joiner = new StringJoiner(" ");
        joiner.add("insert into product (product_id, product_name, product_desc, product_price, category_id, inventory_id, discount_id, product_sku, product_slug)");
        joiner.add("values(?, ?, ?, ?, ?, ?, ?, ?, ?)");
        insert(joiner.toString(), product.getId(), product.getName(),
                product.getDesc(), product.getPrice(), product.getCategory().getId(), product.getInventory().getId(), discountId,
                product.getSku(), product.getSlug());
        return findOne(product.getId());
    }

    @Override
    public void updateInventory(String productId, int quantity) {
        StringJoiner joiner = new StringJoiner(" ");
        joiner.add("update inventory set quantity = ?");
        joiner.add("where inventory.inventory_id in");
        joiner.add("(select product.inventory_id from product where product_id = ?)");
        update(joiner.toString(), quantity, productId);
    }

    @Override
    public void update(Product product) {
        String discount = null;
        if (product.getDiscount() != null && product.getDiscount().getId() != null)
            discount = product.getDiscount().getId();
        StringJoiner joiner = new StringJoiner(" ");
        joiner.add("update product");
        joiner.add("set product_name = ?");
        joiner.add(", product_desc = ?");
        joiner.add(", product_price = ?");
        joiner.add(", product_slug = ?");
        joiner.add(", product_sku = ?");
        joiner.add(", category_id = ?");
        joiner.add(", discount_id = ?");
        joiner.add("where product_id = ?");
        update(joiner.toString(), product.getName(), product.getDesc(), product.getPrice(), product.getSlug(),
                product.getSku(), product.getCategory().getId(), discount, product.getId());
    }

    @Override
    public void delete(String id) {
        StringJoiner joiner = new StringJoiner(" ");
        joiner.add("delete from product where product_id = ?");
        delete(joiner.toString(), id);
    }

    @Override
    public void deleteByCategoryId(String categoryId) {
        StringJoiner joiner = new StringJoiner(" ");
        joiner.add("delete from product where category_id = ?");
        delete(joiner.toString(), categoryId);
    }

    @Override
    public int count(ProductFilter productFilter) {
        StringJoiner joiner = new StringJoiner(" ");
        joiner.add("select count(*) from product");
        joiner.add("left join discount d on product.discount_id = d.discount_id");
        joiner.add("left join inventory i on product.inventory_id = i.inventory_id");
        joiner.add("left join category c on product.category_id = c.category_id");
        joiner.add(filter(null, productFilter, null, false));
        return count(joiner.toString());
    }

    @Override
    public int countByCategoryId(String id, ProductFilter productFilter) {
        StringJoiner joiner = new StringJoiner(" ");
        joiner.add("select count(*) from product");
        joiner.add("left join discount d on product.discount_id = d.discount_id");
        joiner.add("left join inventory i on product.inventory_id = i.inventory_id");
        joiner.add("left join category c on product.category_id = c.category_id");
        joiner.add("where product.category_id = ?");
        joiner.add(filter(null, productFilter, null, true));
        return count(joiner.toString(), id);
    }

    @Override
    public int countBySearchName(String name, ProductFilter productFilter) {
        StringJoiner joiner = new StringJoiner(" ");
        String pattern = "%" + name + "%";
        joiner.add("select count(*) from product");
        joiner.add("left join discount d on product.discount_id = d.discount_id");
        joiner.add("left join inventory i on product.inventory_id = i.inventory_id");
        joiner.add("left join category c on product.category_id = c.category_id");
        joiner.add("where product_name like ?");
        joiner.add(filter(null, productFilter, null, true));
        return count(joiner.toString(), pattern);
    }

    private String filter(Paginable paginable, ProductFilter productFilter, Sortable sortable, boolean hasCondition) {
        StringJoiner joiner = new StringJoiner(" ");
        if (productFilter != null && !productFilter.generateQuery().isEmpty())
            if (hasCondition) joiner.add(" and " + productFilter.generateQuery());
            else joiner.add(" where " + productFilter.generateQuery());
        if (sortable != null && !sortable.generateQuery().isEmpty())
            joiner.add(sortable.generateQuery());
        if (paginable != null)
            joiner.add("limit " + paginable.getOffset() + ", " + paginable.getLimit());
        return joiner.toString();
    }

}
