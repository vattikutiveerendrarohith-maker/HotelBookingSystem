package controller;

import java.io.IOException;

import dao.CustomerDAO;
import daoImpl.CustomerDAOImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Customer;

@WebServlet("/registerCustomer")
public class RegisterCustomerController extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");

        String email = request.getParameter("email");

        String password = request.getParameter("password");

        String phone = request.getParameter("phone");

        Customer customer = new Customer();

        customer.setName(name);
        customer.setEmail(email);
        customer.setPassword(password);
        customer.setPhone(phone);

        CustomerDAO dao = new CustomerDAOImpl();

        boolean result = dao.registerCustomer(customer);

        if(result){

            response.sendRedirect("login.jsp");

        }else{

            response.getWriter().println("Registration Failed");
        }
    }
}