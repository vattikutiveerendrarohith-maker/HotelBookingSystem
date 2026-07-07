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
import model.Booking;

@WebServlet("/viewBookings")
public class ViewBookingsController extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        BookingDAO dao = new BookingDAOImpl();

        List<Booking> bookings = dao.getAllBookings();

        request.setAttribute("bookings", bookings);

        request.getRequestDispatcher("viewBookings.jsp")
               .forward(request, response);
    }
}