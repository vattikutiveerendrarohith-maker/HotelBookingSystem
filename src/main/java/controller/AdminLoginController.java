package controller;

import java.io.IOException;

import dao.AdminDAO;
import daoImpl.AdminDAOImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Admin;

@WebServlet("/adminLogin")
public class AdminLoginController extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");

        String password = request.getParameter("password");

        AdminDAO dao = new AdminDAOImpl();

        Admin admin = dao.loginAdmin(email, password);

        if(admin != null){

            HttpSession session = request.getSession();

            session.setAttribute("admin", admin);

            response.sendRedirect("adminDashboard.jsp");

        }else{

            response.getWriter().println("Invalid Admin Credentials");
        }
    }
}