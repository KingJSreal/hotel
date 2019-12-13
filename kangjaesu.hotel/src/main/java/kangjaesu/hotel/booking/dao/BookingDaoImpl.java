package kangjaesu.hotel.booking.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kangjaesu.hotel.booking.dao.mapper.BookingMapper;
import kangjaesu.hotel.booking.domain.Booking;

@Repository
public class BookingDaoImpl implements BookingDao{
	@Autowired private BookingMapper mapper = null;

	@Override
	public Booking getBooking(int userNum, int bookingNum) {
		return mapper.getBooking(userNum, bookingNum);
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

}
