package kangjaesu.hotel.booking.dao.mapper;

import java.util.List;

import kangjaesu.hotel.booking.domain.Account;
import kangjaesu.hotel.booking.domain.Booking;
import kangjaesu.hotel.booking.domain.Card;
import kangjaesu.hotel.booking.domain.NoneUser;
import kangjaesu.hotel.room.domain.Room;
import kangjaesu.hotel.user.domain.User;

public interface BookingMapper {
	Booking getBooking(int bookingNum);
	int addBooking(Booking booking);
	List<Booking> getBookings();
	List<Booking> getMyBookings(int userNum);
	List<Booking> getNoneUserBookings(int bookingNum);
	List<User> getNames(int userNum);
	Room getRoom(int roomNum);
	int delBooking(int bookingNum);
	int changeBooking(Booking booking);
	int addNoneUser(NoneUser nuser);
	int addCard(Card card);
	int addAccount(Account account);

	int countBookingToday();
	
}
