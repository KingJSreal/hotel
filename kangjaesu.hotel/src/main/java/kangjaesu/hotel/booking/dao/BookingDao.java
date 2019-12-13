package kangjaesu.hotel.booking.dao;

import java.util.List;

import kangjaesu.hotel.booking.domain.Booking;

public interface BookingDao {
	Booking getBooking(int userNum, int bookingNum);
	int addBooking(Booking booking);
	List<Booking> getBookings();
	int delBooking(int bookingNum);
	int changeBooking(int bookingNum);
}
