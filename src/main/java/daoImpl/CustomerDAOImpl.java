package daoImpl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.PreparedStatement;

import dao.CustomerDAO;
import model.Customer;
import util.DBConnection;

public class CustomerDAOImpl implements CustomerDAO {

    @Override
    public boolean registerCustomer(Customer customer) {

        boolean status = false;

        try {

            Connection con = DBConnection.getConnection();

            String sql = "INSERT INTO customers(name,email,password,phone) VALUES(?,?,?,?)";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, customer.getName());
            ps.setString(2, customer.getEmail());
            ps.setString(3, customer.getPassword());
            ps.setString(4, customer.getPhone());

            int rows = ps.executeUpdate();

            if(rows > 0){

                status = true;
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return status;
    }
    
    @Override
    public Customer loginCustomer(String email, String password) {

        Customer customer = null;

        try {

            Connection con = DBConnection.getConnection();

            String sql = "SELECT * FROM customers WHERE email=? AND password=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, email);

            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if(rs.next()) {

                customer = new Customer();

                customer.setId(rs.getInt("id"));

                customer.setName(rs.getString("name"));

                customer.setEmail(rs.getString("email"));

                customer.setPassword(rs.getString("password"));

                customer.setPhone(rs.getString("phone"));
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return customer;
    }
}