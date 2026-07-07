package controller;

import java.io.IOException;
import java.util.List;

import dao.BookingDAO;
import daoImpl.BookingDAOImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Booking;
import model.Customer;

@WebServlet("/myBookings")
public class MyBookingsController extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        Customer customer = (Customer) session.getAttribute("customer");

        if(customer == null){

            response.sendRedirect("customerLogin.jsp");

            return;
        }

        BookingDAO dao = new BookingDAOImpl();

        List<Booking> bookings =
                dao.getBookingsByCustomerId(customer.getId());

        request.setAttribute("bookings", bookings);

        request.getRequestDispatcher("myBookings.jsp")
               .forward(request, response);
    }
}