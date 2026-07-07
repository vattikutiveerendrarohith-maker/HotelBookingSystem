package controller;

import java.io.IOException;

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

@WebServlet("/bookRoom")
public class BookRoomController extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        Customer customer = (Customer) session.getAttribute("customer");

        int customerId = customer.getId();

        int roomId = Integer.parseInt(request.getParameter("roomId"));

        String checkIn = request.getParameter("checkIn");

        String checkOut = request.getParameter("checkOut");

        Booking booking = new Booking();

        booking.setCustomerId(customerId);

        booking.setRoomId(roomId);

        booking.setCheckIn(checkIn);

        booking.setCheckOut(checkOut);

        booking.setStatus("Pending");

        BookingDAO dao = new BookingDAOImpl();

        boolean available = dao.isRoomAvailable(
                booking.getRoomId(),
                booking.getCheckIn(),
                booking.getCheckOut()
        );

        if(available){

            boolean result = dao.addBooking(booking);

            if(result){

                response.sendRedirect("myBookings");

            }else{

                response.getWriter().println("Booking Failed");
            }

        }else{

        	request.setAttribute("error", "Sorry! This room is already booked for the selected dates.");

        	request.getRequestDispatcher("bookRoom.jsp?roomId=" + booking.getRoomId())
        	       .forward(request, response);
        }
}
}