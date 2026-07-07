package daoImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;

import dao.BookingDAO;
import model.Booking;
import util.DBConnection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class BookingDAOImpl implements BookingDAO {

    @Override
    public boolean addBooking(Booking booking) {

        boolean status = false;

        try {

            Connection con = DBConnection.getConnection();

            String sql = "INSERT INTO bookings(customer_id,room_id,check_in,check_out,status) VALUES(?,?,?,?,?)";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, booking.getCustomerId());

            ps.setInt(2, booking.getRoomId());

            ps.setString(3, booking.getCheckIn());

            ps.setString(4, booking.getCheckOut());

            ps.setString(5, booking.getStatus());

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
    public List<Booking> getBookingsByCustomerId(int customerId) {

        List<Booking> bookingList = new ArrayList<>();

        try {

            Connection con = DBConnection.getConnection();

            String sql = "SELECT b.*, r.room_number, r.room_type " +
                         "FROM bookings b " +
                         "JOIN rooms r ON b.room_id = r.id " +
                         "WHERE b.customer_id=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, customerId);

            ResultSet rs = ps.executeQuery();

            while(rs.next()) {

                Booking booking = new Booking();

                booking.setId(rs.getInt("id"));

                booking.setRoomId(rs.getInt("room_id"));

                booking.setCheckIn(rs.getString("check_in"));

                booking.setCheckOut(rs.getString("check_out"));

                booking.setStatus(rs.getString("status"));

                booking.setRoomNumber(rs.getString("room_number"));

                booking.setRoomType(rs.getString("room_type"));

                bookingList.add(booking);
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return bookingList;
    }
    
    @Override
    public List<Booking> getAllBookings() {

        List<Booking> bookingList = new ArrayList<>();

        try {

            Connection con = DBConnection.getConnection();

            String sql =
            "SELECT b.*, c.name, r.room_number, r.room_type " +
            "FROM bookings b " +
            "JOIN customers c ON b.customer_id = c.id " +
            "JOIN rooms r ON b.room_id = r.id";

            PreparedStatement ps = con.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while(rs.next()) {

                Booking booking = new Booking();

                booking.setId(rs.getInt("id"));

                booking.setCustomerName(rs.getString("name"));

                booking.setRoomNumber(rs.getString("room_number"));

                booking.setRoomType(rs.getString("room_type"));

                booking.setCheckIn(rs.getString("check_in"));

                booking.setCheckOut(rs.getString("check_out"));

                booking.setStatus(rs.getString("status"));

                bookingList.add(booking);
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return bookingList;
    }
    @Override
    public boolean updateBookingStatus(int bookingId, String status) {

        boolean result = false;

        try {

            Connection con = DBConnection.getConnection();

            String sql = "UPDATE bookings SET status=? WHERE id=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, status);
            ps.setInt(2, bookingId);

            int rows = ps.executeUpdate();

            if(rows > 0){

                result = true;
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return result;
    }
    
    @Override
    public boolean isRoomAvailable(int roomId, String checkIn, String checkOut) {

        boolean available = true;

        try {

            Connection con = DBConnection.getConnection();

            String sql = "SELECT * FROM bookings "
                       + "WHERE room_id=? "
                       + "AND status='Approved' "
                       + "AND (? < check_out AND ? > check_in)";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, roomId);
            ps.setString(2, checkIn);
            ps.setString(3, checkOut);

            ResultSet rs = ps.executeQuery();

            if(rs.next()) {

                available = false;

            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return available;
    }
}