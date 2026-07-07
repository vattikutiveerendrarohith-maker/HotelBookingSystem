package dao;

import model.Admin;

public interface AdminDAO {

    public Admin loginAdmin(String email, String password);

}