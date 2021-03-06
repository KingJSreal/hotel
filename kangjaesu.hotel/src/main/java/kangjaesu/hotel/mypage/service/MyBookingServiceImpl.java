package kangjaesu.hotel.mypage.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kangjaesu.hotel.booking.domain.Booking;
import kangjaesu.hotel.mypage.dao.MypageDao;

@Service
public class MyBookingServiceImpl implements MyBookingService{
	@Autowired private MypageDao mypageDao;

	@Override
	public List<Booking> getMyBookings(Booking booking) {
		return mypageDao.getMyBookings(booking);
	}

	@Override
	public int getMyBookingsCount(Booking booking) {
		return mypageDao.getMyBookingsCount(booking);
	}
}
