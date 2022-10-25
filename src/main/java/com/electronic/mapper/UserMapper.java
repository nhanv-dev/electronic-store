package com.electronic.mapper;

import com.electronic.model.Role;
import com.electronic.model.User;

import java.sql.ResultSet;
import java.sql.SQLException;

public class UserMapper implements IRowMapper<User> {

    @Override
    public User mapRow(ResultSet rs) {
        User user = new User();
        Role role = new Role();
        try {
            user.setId(rs.getString("user_id"));
            user.setUsername(rs.getString("user_userName"));
            user.setPassword(rs.getString("user_password"));
            user.setName(rs.getString("user_name"));
            user.setPhone(rs.getString("user_phone"));
            user.setEmail(rs.getString("user_email"));
            user.setAddress(rs.getString("user_address"));
            user.setCreatedAt(rs.getTimestamp("createdAt"));
            user.setModifiedAt(rs.getTimestamp("modifiedAt"));
            user.setDeletedAt(rs.getTimestamp("deletedAt"));
            role.setId(rs.getString("ur.role_id"));
            role.setName(rs.getString("ur.role_name"));
            user.setRole(role);
        } catch (SQLException exception) {
            return null;
        }
        return user;
    }
}
