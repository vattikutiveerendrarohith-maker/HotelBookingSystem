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

@WebServlet("/updateRoom")
public class UpdateRoomController extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        String roomNumber = request.getParameter("roomNumber");
        String roomType = request.getParameter("roomType");
        double price = Double.parseDouble(request.getParameter("price"));
        String status = request.getParameter("status");

        Room room = new Room();

        room.setId(id);
        room.setRoomNumber(roomNumber);
        room.setRoomType(roomType);
        room.setPrice(price);
        room.setStatus(status);

        RoomDAO dao = new RoomDAOImpl();

        boolean result = dao.updateRoom(room);

        if(result){

            response.sendRedirect("rooms");

        }else{

            response.getWriter().println("Room Not Updated");

        }
    }
}