package dao;

import model.Customer;

public interface CustomerDAO {

    public boolean registerCustomer(Customer customer);

    public Customer loginCustomer(String email, String password);

}