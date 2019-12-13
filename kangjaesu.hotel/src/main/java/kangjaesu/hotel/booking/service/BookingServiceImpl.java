package kangjaesu.hotel.booking.service;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kangjaesu.hotel.booking.dao.BookingDao;
import kangjaesu.hotel.booking.domain.Booking;

@Service
public class BookingServiceImpl implements BookingService{
	@Autowired private BookingDao bookingDao;
	
	@Override
	public Booking getBooking(int userNum, int bookingNum) {
		return bookingDao.getBooking(userNum, bookingNum);
	}

	@Override
	public List<Booking> BookingList() {
		return bookingDao.getBookings();
	}

	@Override
	public int delBooking(int bookingNum) {
		return bookingDao.delBooking(bookingNum);
	}

	@Override
	public int changeBooking(int bookingNum) {
		return bookingDao.changeBooking(bookingNum);
	}
	@Override
	public int addBooking(Booking booking) {
		return bookingDao.addBooking(booking);
	}
	
	public long days(Date start, Date end){
	    // 시간차이를 시간,분,초를 곱한 값으로 나누면 하루 단위가 나옴
		long diff = end.getTime() - start.getTime();
		long diffDays = diff / (24 * 60 * 60 * 1000);
 
		return diffDays;
	}
}
