package com.electronic.service.implement;

import com.electronic.dao.IUserDao;
import com.electronic.dao.implement.UserDao;
import com.electronic.model.Order;
import com.electronic.model.User;
import com.electronic.service.IUserService;
import com.electronic.utils.Paginable;

import java.security.KeyPair;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.util.List;

public class UserService implements IUserService {
    private final IUserDao userDao = new UserDao();

    @Override
    public List<User> findAll(Paginable pagination) {
        return userDao.findAll(pagination);
    }

    @Override
    public List<User> findByRole(String roleId) {
        return userDao.findByRole(roleId);
    }


    @Override
    public User findOne(String id) {
        return userDao.findOne(id);
    }

    @Override
    public KeyPair findKey(String id) {
        return userDao.findKey(id);
    }

    @Override
    public User authentication(String username, String password) {
        return userDao.authentication(username, password);
    }

    @Override
    public boolean hasUsername(String username) {
        return userDao.hasUsername(username);
    }

    @Override
    public User insert(User user) {
        return userDao.insert(user);
    }

    @Override
    public void update(User user) {
        userDao.update(user);
    }

    @Override
    public void delete(String id) {
        userDao.delete(id);
    }

    @Override
    public int countByRole(String roleId) {
        return userDao.countByRole(roleId);
    }

    @Override
    public void updateKey(PublicKey publicKey, PrivateKey privateKey, String id) {
        userDao.updateKey(publicKey, privateKey, id);
    }
}
