package kangjaesu.hotel.booking.service;

import java.sql.Date;
import java.util.List;

import kangjaesu.hotel.booking.domain.Account;
import kangjaesu.hotel.booking.domain.Booking;
import kangjaesu.hotel.booking.domain.Card;
import kangjaesu.hotel.booking.domain.NoneUser;
import kangjaesu.hotel.user.domain.User;

public interface BookingService {
	Booking getBooking(int bookingNum);
	int addBooking(Booking booking);
	List<Booking> BookingList();
	List<Booking> getMyBookings(int userNum);
	List<Booking> getNoneUserBookings(int bookingNum);
	List<User> getNames(int userNum);
	int delBooking(int bookingNum);
	int changeBooking(int bookingNum);
	int addNoneUser(NoneUser nuser);
	int addCard(Card card);
	int addAccount(Account account);
	long days(Date start, Date end);
	String getOption(Booking booking);

	int countBookingToday();
}
