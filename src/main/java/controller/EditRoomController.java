package controller;

import java.io.IOException;

import dao.RoomDAO;
import daoImpl.RoomDAOImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Room;

@WebServlet("/editRoom")
public class EditRoomController extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        RoomDAO dao = new RoomDAOImpl();

        Room room = dao.getRoomById(id);

        request.setAttribute("room", room);

        request.getRequestDispatcher("/editRoom.jsp")
               .forward(request, response);
    }
}