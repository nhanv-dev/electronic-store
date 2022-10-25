package com.electronic.dao;

import com.electronic.mapper.IRowMapper;

import java.util.List;

public interface GenericDao<T> {
    List<T> query(String sql, IRowMapper<T> rowMapper, Object... parameters);

    int count(String sql, Object... parameters);

    void useProcedure(String sql, Object... parameters);

    void insert(String sql, Object... parameters);

    void update(String sql, Object... parameters);

    void delete(String sql, Object... parameters);
}
