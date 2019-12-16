package kangjaesu.hotel.booking.dao;

import java.util.List;

import kangjaesu.hotel.booking.domain.Account;
import kangjaesu.hotel.booking.domain.Booking;
import kangjaesu.hotel.booking.domain.Card;
import kangjaesu.hotel.booking.domain.NoneUser;
import kangjaesu.hotel.room.domain.Room;
import kangjaesu.hotel.user.domain.User;

public interface BookingDao {
	Booking getBooking(int bookingNum);
	int addBooking(Booking booking);
	List<Booking> getBookings();
	List<Booking> getMyBookings(int userNum);
	List<User> getNames(int userNum);
	Room getRoom(int roomNum);
	int delBooking(int bookingNum);
	int changeBooking(int bookingNum);
	int addNoneUser(NoneUser nuser);
	int addCard(Card card);
	int addAccount(Account account);
}
