package dao;

import java.util.List;

import model.Booking;

public interface BookingDAO {

    public boolean addBooking(Booking booking);

    public List<Booking> getBookingsByCustomerId(int customerId);

    public List<Booking> getAllBookings();

    public boolean updateBookingStatus(int bookingId, String status);
    
    boolean isRoomAvailable(int roomId, String checkIn, String checkOut);
}