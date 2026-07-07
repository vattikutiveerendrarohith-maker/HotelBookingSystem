package dao;

import java.util.List;

import model.Room;

public interface RoomDAO {

    public List<Room> getAllRooms();

    public boolean addRoom(Room room);

    public boolean deleteRoom(int id);

    public Room getRoomById(int id);

    public boolean updateRoom(Room room);

}