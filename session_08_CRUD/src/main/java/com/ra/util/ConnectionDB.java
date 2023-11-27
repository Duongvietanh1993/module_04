package com.ra.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionDB {
    private static final String URL = "jdbc:mysql://localhost:3306/category";
    private static final String USER = "root";
    private static final String PASSWORD = "tv14061993";

    //tạo phương thức kết nối
    public static Connection openConnection() {
        Connection connection = null;
        try {
            //đăng kí driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            // lấy kết nối
            connection = DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return connection;
    }

    //Phương thức mở
    // public static void main(String[] args) {
    // System.out.println(ConnectionDB.openConnection());
    // }

    //phương thức đóng kết nối
    public static void closeConnection(Connection connection) {
        if (connection == null) {

            try {
                connection.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
    }

}
