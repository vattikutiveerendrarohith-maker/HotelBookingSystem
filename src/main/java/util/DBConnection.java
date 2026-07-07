package util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

    private static Connection con = null;

    public static Connection getConnection() {

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");

            con = DriverManager.getConnection(
                "jdbc:mysql://hotel-booking-vattikutiveerendrarohith-d64f.j.aivencloud.com:28523/hotel_booking?sslMode=REQUIRED",
                "avnadmin",
                "AVNS_l9wgFGCnTGUZ0wnnLL-"
            );

            System.out.println("Cloud Database Connected");

        } catch (Exception e) {

            e.printStackTrace();
        }

        return con;
    }
}
