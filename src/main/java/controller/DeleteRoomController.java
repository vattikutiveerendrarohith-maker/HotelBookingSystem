package controller;

import java.io.IOException;

import dao.RoomDAO;
import daoImpl.RoomDAOImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/deleteRoom")
public class DeleteRoomController extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        RoomDAO dao = new RoomDAOImpl();

        boolean result = dao.deleteRoom(id);

        if(result){

            response.sendRedirect("rooms");

        }else{

            response.getWriter().println("Room Not Deleted");

        }
    }
}