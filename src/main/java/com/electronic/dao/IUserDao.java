package com.electronic.dao;

import com.electronic.model.User;
import com.electronic.utils.Paginable;

import java.util.List;

public interface IUserDao extends GenericDao<User> {
    List<User> findAll(Paginable paginable);

    List<User> findByRole(String roleId);


    User findOne(String id);

    User authentication(String username, String password);

    boolean hasUsername(String username);

    User insert(User user);

    void update(User user);

    void delete(String id);

    int countByRole(String roleId);
}
