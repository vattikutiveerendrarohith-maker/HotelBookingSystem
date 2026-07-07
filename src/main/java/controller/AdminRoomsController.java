package controller;

import java.io.IOException;
import java.util.List;

import dao.RoomDAO;
import daoImpl.RoomDAOImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Admin;
import model.Room;

@WebServlet("/adminRooms")
public class AdminRoomsController extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Check admin login
        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("admin") == null) {
            response.sendRedirect("adminLogin.jsp");
            return;
        }

        RoomDAO dao = new RoomDAOImpl();

        List<Room> rooms = dao.getAllRooms();
        
        System.out.println("Admin Rooms Size = " + rooms.size());

        request.setAttribute("rooms", rooms);

        request.getRequestDispatcher("adminRooms.jsp").forward(request, response);
    }
}