package com.electronic.dao.implement;

import com.electronic.dao.ICartDao;
import com.electronic.dao.IDiscountDao;
import com.electronic.dao.IProductDao;
import com.electronic.mapper.CartMapper;
import com.electronic.mapper.DiscountMapper;
import com.electronic.model.Cart;
import com.electronic.model.Discount;

import java.util.List;
import java.util.StringJoiner;

public class DiscountDao extends AbstractDao<Discount> implements IDiscountDao {

    @Override
    public Discount findOne(String id) {
        String sql = "select * from discount where discount_id = ?";
        List<Discount> result = query(sql, new DiscountMapper(), id);
        return result.isEmpty() ? null : result.get(0);
    }

    @Override
    public List<Discount> findAll() {
        String sql = "select * from discount";
        return query(sql, new DiscountMapper());
    }

    @Override
    public List<Discount> findByActive(boolean active) {
        String sql = "select * from discount where discount_active = ?";
        return query(sql, new DiscountMapper(), active);
    }

    @Override
    public Discount insert(Discount discount) {
        StringJoiner joiner = new StringJoiner(" ");
        int i = 1;
        if (!discount.isActive()) i = 0;

        joiner.add("insert into discount(discount_id, discount_desc, discount_percent, discount_active, discount_name)");
        joiner.add("values(?, ?, ?, ?, ?)");
        insert(joiner.toString(), discount.getId(), discount.getDesc(),
                discount.getPercent(), i, discount.getName());
        return findOne(discount.getId());
    }

    @Override

    public void update(Discount discount) {
        StringJoiner joiner = new StringJoiner("");
        int i = 1;
        if (!discount.isActive()) i = 0;
        joiner.add("update discount set discount_name = ? ,discount_desc = ?,discount_percent = ?,discount_active = ? where discount_id = ?");
        update(joiner.toString(), discount.getName(), discount.getDesc(), discount.getPercent(), i, discount.getId());
    }

    @Override
    public void delete(String id) {
        StringJoiner joiner = new StringJoiner("");
        joiner.add("delete from discount where discount_id = ?");
        delete(joiner.toString(), id);
    }
}
