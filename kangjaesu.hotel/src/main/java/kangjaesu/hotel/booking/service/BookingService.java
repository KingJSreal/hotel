package kangjaesu.hotel.booking.service;

import java.sql.Date;
import java.util.List;

import kangjaesu.hotel.booking.domain.Booking;

public interface BookingService {
	Booking getBooking(int userNum, int bookingNum);
	int addBooking(Booking booking);
	List<Booking> BookingList();
	int delBooking(int bookingNum);
	int changeBooking(int bookingNum);
	long days(Date start, Date end);
}
