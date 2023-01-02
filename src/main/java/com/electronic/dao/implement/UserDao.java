package com.electronic.dao.implement;

import com.electronic.dao.ICategoryDao;
import com.electronic.dao.IUserDao;
import com.electronic.mapper.CategoryMapper;
import com.electronic.mapper.KeyPairMapper;
import com.electronic.mapper.ProductMapper;
import com.electronic.mapper.UserMapper;
import com.electronic.model.Category;
import com.electronic.model.Product;
import com.electronic.model.Role;
import com.electronic.model.User;
import com.electronic.utils.Paginable;
import com.electronic.utils.RoleUtils;

import java.security.KeyFactory;
import java.security.KeyPair;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.interfaces.DSAPublicKey;
import java.security.interfaces.RSAPublicKey;
import java.security.spec.PKCS8EncodedKeySpec;
import java.security.spec.X509EncodedKeySpec;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Base64;
import java.util.List;
import java.util.StringJoiner;


public class UserDao extends AbstractDao<User> implements IUserDao {

    @Override
    public List<User> findAll(Paginable paginable) {
        StringJoiner joiner = new StringJoiner(" ");
        joiner.add("select * from user ");
        joiner.add("left join user_role ur on user.role_id = ur.role_id");
        return query(joiner.toString(), new UserMapper());
    }

    @Override
    public List<User> findByRole(String roleId) {
        StringJoiner joiner = new StringJoiner(" ");
        joiner.add("select * from user ");
        joiner.add("left join user_role ur on user.role_id = ur.role_id");
        joiner.add("where user.role_id = ?");
        return query(joiner.toString(), new UserMapper(), roleId);
    }

    @Override
    public User findOne(String id) {
        StringJoiner joiner = new StringJoiner(" ");
        joiner.add("select * from user ");
        joiner.add("left join user_role ur on user.role_id = ur.role_id");
        joiner.add("where user_id = ?");
        List<User> result = query(joiner.toString(), new UserMapper(), id);
        return result.isEmpty() ? null : result.get(0);
    }

    @Override
    public User authentication(String username, String password) {
        StringJoiner joiner = new StringJoiner(" ");
        joiner.add("select * from user");
        joiner.add("left join user_role ur on user.role_id = ur.role_id");
        joiner.add("where user_username = ? and user_password = ?");
        List<User> result = query(joiner.toString(), new UserMapper(), username, password);
        return result.isEmpty() ? null : result.get(0);
    }

    @Override
    public boolean hasUsername(String username) {
        StringJoiner joiner = new StringJoiner(" ");
        joiner.add("select * from user");
        joiner.add("where user_username = ?");
        List<User> result = query(joiner.toString(), new UserMapper(), username);
        return result.size() > 0;
    }

    @Override
    public User insert(User user) {
        StringJoiner joiner = new StringJoiner(" ");
        joiner.add("INSERT INTO user (user_id, role_id, user_username, user_password, user_name, user_phone, user_email, user_address)");
        joiner.add("VALUES (?, ?, ?, ?, ?, ?, ?, ?)");
        insert(joiner.toString(), user.getId(), user.getRole().getId(), user.getUsername(), user.getPassword(), user.getName(), user.getPhone(), user.getEmail(), user.getAddress());
        return findOne(user.getId());
    }

    @Override
    public void update(User user) {
        StringJoiner joiner = new StringJoiner(" ");
        joiner.add("update user set role_id = ?, user_username= ? , user_password = ?, user_name = ?, user_phone = ?, user_email = ?, user_address = ?");
        joiner.add("where user_id = ?");
        update(joiner.toString(), user.getRole().getId(), user.getUsername(), user.getPassword(),
                user.getName(), user.getPhone(), user.getEmail(), user.getAddress(), user.getId());
    }

    @Override
    public void delete(String id) {
        String sql = "delete from user where user_id = ? ";
        delete(sql, id);
    }

    @Override
    public int countByRole(String roleId) {
        StringJoiner joiner = new StringJoiner(" ");
        joiner.add("select count(*) from user ");
        joiner.add("left join user_role ur on user.role_id = ur.role_id");
        joiner.add("where user.role_id = ?");
        return count(joiner.toString(), roleId);
    }

    @Override
    public void updateKey(PublicKey publicKey, PrivateKey privateKey, String id) {
        StringJoiner joiner = new StringJoiner(" ");
        joiner.add("update user set public_key = ?, private_key= ? ");
        joiner.add("where user_id = ?");
        byte[] publicKeyByte = publicKey.getEncoded();
        byte[] privateKeyByte = privateKey.getEncoded();
        update(joiner.toString(),publicKeyByte, privateKeyByte, id);
    }

    @Override
    public KeyPair findKey(String id) {
        StringJoiner joiner = new StringJoiner(" ");
        joiner.add("select public_key, private_key from user");
        joiner.add("where user_id = ?");
        List<User> result = query(joiner.toString(), new KeyPairMapper(), id);
        if (!result.isEmpty()) {
            try {
                KeyFactory kf = KeyFactory.getInstance("DSA");
                PKCS8EncodedKeySpec keySpecPKCS8 = new PKCS8EncodedKeySpec(result.get(0).getPrivateKey());
                PrivateKey privKey = kf.generatePrivate(keySpecPKCS8);

                X509EncodedKeySpec keySpecX509 = new X509EncodedKeySpec(result.get(0).getPublicKey());
                DSAPublicKey pubKey = (DSAPublicKey) kf.generatePublic(keySpecX509);

                return new KeyPair(pubKey, privKey);
            } catch (Exception e) {
                e.printStackTrace();
                return null;
            }
        }
        return null;
    }
}
