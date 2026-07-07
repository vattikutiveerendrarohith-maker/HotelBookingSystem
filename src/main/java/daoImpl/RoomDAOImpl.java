package daoImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import dao.RoomDAO;
import model.Room;
import util.DBConnection;

public class RoomDAOImpl implements RoomDAO {

    @Override
    public List<Room> getAllRooms() {

        List<Room> roomList = new ArrayList<>();

        try {

        	Connection con = DBConnection.getConnection();

            String sql = "SELECT * FROM rooms";

            PreparedStatement ps = con.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while(rs.next()) {

                Room room = new Room();

                room.setId(rs.getInt("id"));
                room.setRoomNumber(rs.getString("room_number"));
                room.setRoomType(rs.getString("room_type"));
                room.setPrice(rs.getDouble("price"));
                room.setStatus(rs.getString("status"));

                roomList.add(room);
            }

            System.out.println("Total Rooms : " + roomList.size());

        } catch (Exception e) {

            e.printStackTrace();
        }

        return roomList;
    }
    
    @Override
    public boolean addRoom(Room room) {

        boolean status = false;

        try {

            Connection con = DBConnection.getConnection();

            String sql = "INSERT INTO rooms(room_number, room_type, price, status) VALUES(?,?,?,?)";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, room.getRoomNumber());
            ps.setString(2, room.getRoomType());
            ps.setDouble(3, room.getPrice());
            ps.setString(4, room.getStatus());

            int rows = ps.executeUpdate();

            if(rows > 0){
                status = true;
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return status;
    }
    
    @Override
    public boolean deleteRoom(int id) {

        boolean status = false;

        try {

            Connection con = DBConnection.getConnection();

            String sql = "DELETE FROM rooms WHERE id=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, id);

            int rows = ps.executeUpdate();

            if(rows > 0){

                status = true;
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return status;
    }
    
    @Override
    public Room getRoomById(int id) {

        Room room = null;

        try {

            Connection con = DBConnection.getConnection();

            String sql = "SELECT * FROM rooms WHERE id=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            if(rs.next()) {

                room = new Room();

                room.setId(rs.getInt("id"));
                room.setRoomNumber(rs.getString("room_number"));
                room.setRoomType(rs.getString("room_type"));
                room.setPrice(rs.getDouble("price"));
                room.setStatus(rs.getString("status"));
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return room;
    }
    
    @Override
    public boolean updateRoom(Room room) {

        boolean status = false;

        try {

            Connection con = DBConnection.getConnection();

            String sql = "UPDATE rooms SET room_number=?, room_type=?, price=?, status=? WHERE id=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, room.getRoomNumber());
            ps.setString(2, room.getRoomType());
            ps.setDouble(3, room.getPrice());
            ps.setString(4, room.getStatus());
            ps.setInt(5, room.getId());

            int rows = ps.executeUpdate();

            if(rows > 0){

                status = true;
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return status;
    }
}