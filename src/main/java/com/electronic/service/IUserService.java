package com.electronic.service;

import com.electronic.model.User;
import com.electronic.service.implement.UserService;
import com.electronic.utils.Paginable;
import com.electronic.utils.digital_signature.KeyPairUtils;

import java.security.KeyPair;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.util.List;

public interface IUserService {
    List<User> findAll(Paginable paginable);

    List<User> findByRole(String roleId);

    User findOne(String id);

    User authentication(String username, String password);

    boolean hasUsername(String username);

    User insert(User user);

    void update(User user);

    void delete(String id);

    int countByRole(String roleId);

    void updateKey(PublicKey publicKey, PrivateKey privateKey, String id);

    KeyPair findKey(String id);

}
