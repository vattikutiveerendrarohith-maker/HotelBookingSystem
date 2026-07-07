package controller;

import java.io.IOException;

import dao.BookingDAO;
import daoImpl.BookingDAOImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/updateBookingStatus")
public class UpdateBookingStatusController extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int bookingId = Integer.parseInt(request.getParameter("id"));

        String status = request.getParameter("status");

        BookingDAO dao = new BookingDAOImpl();

        dao.updateBookingStatus(bookingId, status);

        response.sendRedirect("viewBookings");
    }
}