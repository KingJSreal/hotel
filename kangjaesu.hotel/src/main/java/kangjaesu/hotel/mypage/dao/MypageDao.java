package kangjaesu.hotel.mypage.dao;

import java.util.List;

import kangjaesu.hotel.booking.domain.Booking;
import kangjaesu.hotel.comment.domain.Comment;
import kangjaesu.hotel.inquiry.domain.Inquiry;
import kangjaesu.hotel.inquiry.domain.InquiryComment;
import kangjaesu.hotel.user.domain.User;



public interface MypageDao {
	List<Inquiry> getInquirys(int userNum);
	Inquiry getInquiry(int inqNum, int userNum);
	InquiryComment getComment(int inqNum);
	boolean modInquiry(Inquiry inquiry);
	Inquiry getCount(int userNum);
	
	List<Comment> getMyComments(Comment comment);
	int getMyCommentsCount(Comment comment);

	List<Booking> getMyBookings(Booking booking);
	int getMyBookingsCount(Booking booking);
}
