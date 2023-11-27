package com.ra.model.dao.category;

import com.ra.model.entity.Category;
import com.ra.util.ConnectionDB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CategoryDAOimpl implements CategoryDao {
    @Override
    public List<Category> findAll() {
        Connection connection = null;
        List<Category> categories = new ArrayList<>();
        try {
            connection = ConnectionDB.openConnection();
            PreparedStatement pstm = connection.prepareStatement("SELECT * FROM category");
            ResultSet resultSet = pstm.executeQuery();
            while (resultSet.next()) {
                Category category = new Category();
                category.setCategoryId(resultSet.getInt("id"));
                category.setCategoryName(resultSet.getString("name"));
                category.setCategoryStatus(resultSet.getBoolean("status"));
                categories.add(category);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            ConnectionDB.closeConnection(connection);
        }
        return categories;
    }

    @Override
    public boolean saveOrUpdate(Category category) {
        Connection connection = null;
        try {
            connection = ConnectionDB.openConnection();
            String sql = "INSERT INTO category(name,status) values (?,?)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, category.getCategoryName());
            statement.setBoolean(2, category.isCategoryStatus());

            int check = statement.executeUpdate();
            if (check > 0)
                return true;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }finally {
            ConnectionDB.closeConnection(connection);
        }
        return false;
    }

    @Override
    public Category findById(Integer integer) {
        Connection connection = null;
        Category category = new Category();
        try {
            connection = ConnectionDB.openConnection();
            PreparedStatement pstm = connection.prepareStatement("SELECT * FROM category WHERE id = ?");
            pstm.setInt(1, integer);
            ResultSet resultSet = pstm.executeQuery();
            while (resultSet.next()) {
                category.setCategoryId(resultSet.getInt("id"));
                category.setCategoryName(resultSet.getString("name"));
                category.setCategoryStatus(resultSet.getBoolean("status"));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            ConnectionDB.closeConnection(connection);
        }
        return category;
    }

    @Override
    public void delete(Integer integer) {

    }
}
