package com.electronic.dao.implement;

import com.electronic.dao.GenericDao;
import com.electronic.mapper.IRowMapper;

import java.math.BigDecimal;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public abstract class AbstractDao<T> implements GenericDao<T> {

    @Override
    public List<T> query(String sql, IRowMapper<T> rowMapper, Object... parameters) {
        List<T> results = new ArrayList<T>();
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try {
            connection = ConnectionProvider.getConnection();
            statement = connection.prepareStatement(sql);
            setParameters(statement, parameters);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                results.add(rowMapper.mapRow(resultSet));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (resultSet != null)
                    resultSet.close();
                if (statement != null)
                    statement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return results;
    }

    @Override
    public int count(String sql, Object... parameters) {
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        int count = 0;
        try {
            connection = ConnectionProvider.getConnection();
            statement = connection.prepareStatement(sql);
            setParameters(statement, parameters);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                count = resultSet.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (resultSet != null) resultSet.close();
                if (statement != null) statement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return count;
    }

    @Override
    public void useProcedure(String sql, Object... parameters) {
        Connection connection = null;
        CallableStatement statement = null;
        try {
            connection = ConnectionProvider.getConnection();
            connection.setAutoCommit(false);
            statement = connection.prepareCall(sql);
            setParameters(statement, parameters);
            statement.executeUpdate();
            connection.commit();
        } catch (Exception e) {
            e.printStackTrace();
            try {
                connection.rollback();
            } catch (SQLException e1) {
                e1.printStackTrace();
            }
        } finally {
            try {
                if (statement != null) statement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    public void update(String sql, Object... parameters) {
        Connection connection = null;
        PreparedStatement statement = null;
        try {
            connection = ConnectionProvider.getConnection();
            connection.setAutoCommit(false);
            statement = connection.prepareStatement(sql);
            setParameters(statement, parameters);
            statement.executeUpdate();
            connection.commit();
        } catch (Exception e) {
            System.out.println("Failed Update: " + e.getMessage());
            try {
                connection.rollback();
            } catch (SQLException e1) {
                System.out.println("Failed Rollback: " + e1.getMessage());
            }
        } finally {
            try {
                if (statement != null) statement.close();
            } catch (SQLException e) {
                System.out.println("Failed Closing: " + e.getMessage());
            }
        }

    }

    @Override
    public void insert(String sql, Object... parameters) {
        Connection connection = null;
        PreparedStatement statement = null;
        try {
            connection = ConnectionProvider.getConnection();
            connection.setAutoCommit(false);
            statement = connection.prepareStatement(sql);
            setParameters(statement, parameters);
            statement.executeUpdate();
            connection.commit();
        } catch (Exception e) {
            e.printStackTrace();
            try {
                connection.rollback();
            } catch (SQLException e1) {
                e1.printStackTrace();
            }
        } finally {
            try {
                if (statement != null) statement.close();
            } catch (SQLException e) {
                System.out.println("Batch insert close exception: " + e.getMessage());
            }
        }
    }

    @Override
    public void delete(String sql, Object... parameters) {
        Connection connection = null;
        PreparedStatement statement = null;
        try {
            connection = ConnectionProvider.getConnection();
            connection.setAutoCommit(false);
            statement = connection.prepareStatement(sql);
            setParameters(statement, parameters);
            statement.executeUpdate();
            connection.commit();
        } catch (Exception e) {
            e.printStackTrace();
            try {
                connection.rollback();
            } catch (SQLException e1) {
                e1.printStackTrace();
            }
        } finally {
            try {
                if (statement != null)
                    statement.close();
            } catch (SQLException e) {
                System.out.println("Batch delete close exception: " + e.getMessage());
            }
        }
    }

    private void setParameters(PreparedStatement statement, Object... parameters) throws SQLException {
        for (int i = 0; i < parameters.length; i++) {
            Object param = parameters[i];
            if (param instanceof String)
                statement.setString(i + 1, (String) param);
            else if (param instanceof Integer)
                statement.setInt(i + 1, (Integer) param);
            else if (param instanceof Double)
                statement.setDouble(i + 1, (Double) param);
            else if (param instanceof Float)
                statement.setFloat(i + 1, (Float) param);
            else if (param instanceof Long)
                statement.setLong(i + 1, (Long) param);
            else if (param instanceof Timestamp)
                statement.setTimestamp(i + 1, (Timestamp) param);
            else if (param instanceof Date)
                statement.setDate(i + 1, new Date(((Date) param).getTime()));
            else if (param instanceof BigDecimal)
                statement.setBigDecimal(i + 1, (BigDecimal) param);
            else
                statement.setNull(i + 1, Types.NULL);
        }
    }

}
