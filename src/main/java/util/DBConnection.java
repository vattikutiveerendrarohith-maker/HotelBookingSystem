package util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

    private static Connection con = null;

    public static Connection getConnection() {

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");

            con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/hotel_booking",
                    "root",
                    "root"
            );

            System.out.println("Database Connected");

        } catch (Exception e) {

            System.out.println(e);

            System.out.println("Connection Failed");
        }

        return con;
    }
}