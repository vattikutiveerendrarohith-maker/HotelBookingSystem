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
import model.Room;

@WebServlet("/rooms")
public class RoomController extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        System.out.println("RoomController Called");

        RoomDAO dao = new RoomDAOImpl();

        List<Room> roomList = dao.getAllRooms();
        System.out.println(roomList);

        System.out.println("Rooms Size : " + roomList.size());

        request.setAttribute("rooms", roomList);

        request.getRequestDispatcher("/rooms.jsp")
               .forward(request, response);
    }
}