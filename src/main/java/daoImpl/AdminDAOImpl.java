package daoImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import dao.AdminDAO;
import model.Admin;
import util.DBConnection;

public class AdminDAOImpl implements AdminDAO {

    @Override
    public Admin loginAdmin(String email, String password) {

        Admin admin = null;

        try {

            Connection con = DBConnection.getConnection();

            String sql =
            "SELECT * FROM admin WHERE email=? AND password=?";

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ps.setString(1, email);

            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if(rs.next()) {

                admin = new Admin();

                admin.setId(rs.getInt("id"));

                admin.setEmail(rs.getString("email"));

                admin.setPassword(rs.getString("password"));
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return admin;
    }
}