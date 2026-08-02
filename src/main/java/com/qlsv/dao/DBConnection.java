package com.qlsv.dao;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Properties;

public class DBConnection {
    private static Properties props = new Properties();

    static {
        try (InputStream in = DBConnection.class.getClassLoader().getResourceAsStream("db.properties")) {
            if (in != null) {
                props.load(in);
                Class.forName(props.getProperty("db.driver"));
            } else {
                System.out.println("Could not find db.properties");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static Connection getConnection() {
        Connection conn = null;
        try {
            // Đọc từ biến môi trường (Render) trước, nếu không có thì đọc từ file properties (Local)
            String url = System.getenv("DB_URL");
            if (url == null || url.isEmpty()) url = props.getProperty("db.url");

            String user = System.getenv("DB_USER");
            if (user == null || user.isEmpty()) user = props.getProperty("db.user");

            String password = System.getenv("DB_PASSWORD");
            if (password == null || password.isEmpty()) password = props.getProperty("db.password");

            conn = DriverManager.getConnection(url, user, password);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return conn;
    }
}
