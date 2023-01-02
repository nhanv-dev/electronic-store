package com.electronic.mapper;

import com.electronic.model.Role;
import com.electronic.model.User;

import java.sql.ResultSet;
import java.sql.SQLException;

public class KeyPairMapper implements IRowMapper<User> {

    @Override
    public User mapRow(ResultSet rs) {
        User user = new User();
        try {
            user.setPublicKey(rs.getBytes("public_key"));
            user.setPrivateKey(rs.getBytes("private_key"));
        } catch (SQLException exception) {
            return null;
        }
        return user;
    }
}
