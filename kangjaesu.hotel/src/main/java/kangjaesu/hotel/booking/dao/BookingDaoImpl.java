package kangjaesu.hotel.booking.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kangjaesu.hotel.booking.dao.mapper.BookingMapper;
import kangjaesu.hotel.booking.domain.Account;
import kangjaesu.hotel.booking.domain.Booking;
import kangjaesu.hotel.booking.domain.Card;
import kangjaesu.hotel.booking.domain.NoneUser;
import kangjaesu.hotel.room.domain.Room;
import kangjaesu.hotel.user.domain.User;

@Repository
public class BookingDaoImpl implements BookingDao{
	@Autowired private BookingMapper mapper = null;

	@Override
	public Booking getBooking(int bookingNum) {
		return mapper.getBooking(bookingNum);
	}

	@Override
	public int delBooking(int bookingNum) {
		return mapper.delBooking(bookingNum);
	}

	@Override
	public int changeBooking(int bookingNum) {
		return mapper.changeBooking(bookingNum);
	}
	
	@Override
	public int addBooking(Booking booking) {
		return mapper.addBooking(booking);
	}
	
	@Override
	public List<Booking> getBookings() {
		return mapper.getBookings();
	}

	@Override
	public int addNoneUser(NoneUser nuser) {
		return mapper.addNoneUser(nuser);
	}

	@Override
	public int addCard(Card card) {
		return mapper.addCard(card);
	}

	@Override
	public int addAccount(Account account) {
		return mapper.addAccount(account);
	}

	@Override
	public Room getRoom(int roomNum) {
		return mapper.getRoom(roomNum);
	}

	@Override
	public List<User> getNames(int userNum) {
		return mapper.getNames(userNum);
	}

	@Override
	public List<Booking> getMyBookings(int userNum) {
		return mapper.getMyBookings(userNum);
	}

}
