package controller;

import java.io.IOException;

import dao.CustomerDAO;
import daoImpl.CustomerDAOImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Customer;

@WebServlet("/customerLogin")
public class CustomerLoginController extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");

        String password = request.getParameter("password");

        CustomerDAO dao = new CustomerDAOImpl();

        Customer customer = dao.loginCustomer(email, password);

        if(customer != null) {

            HttpSession session = request.getSession();

            session.setAttribute("customer", customer);

            response.sendRedirect("index.jsp");

        } else {

            response.getWriter().println("Invalid Email or Password");
        }
    }
}