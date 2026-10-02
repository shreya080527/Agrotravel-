package com.agrotravel;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

    static Connection con;

    public static Connection getConnection() {

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection connection = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/agrotravel_db",
                    "root",
                    "WJ28@krhps");
            con = connection;
            return connection;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return con;
    }

}