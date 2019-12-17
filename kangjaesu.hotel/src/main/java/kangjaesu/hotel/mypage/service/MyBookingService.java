package kangjaesu.hotel.mypage.service;

import java.util.List;

import kangjaesu.hotel.booking.domain.Booking;

public interface MyBookingService {

	List<Booking> getMyBookings(Booking booking);
	int getMyBookingsCount(Booking booking);
}
