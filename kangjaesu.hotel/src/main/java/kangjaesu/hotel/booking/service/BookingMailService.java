package kangjaesu.hotel.booking.service;

import kangjaesu.hotel.booking.domain.Booking;
import kangjaesu.hotel.inquiry.domain.Inquiry;
import kangjaesu.hotel.inquiry.domain.InquiryComment;
import kangjaesu.hotel.user.domain.User;

public interface BookingMailService {
	void send(Booking booking, String userEmail, String bookingName);
}
