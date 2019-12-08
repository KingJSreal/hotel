package kangjaesu.hotel.mypage.dao;

import java.util.List;

import kangjaesu.hotel.inquiry.domain.Inquiry;
import kangjaesu.hotel.inquiry.domain.InquiryComment;



public interface MypageDao {
	List<Inquiry> getInquirys(int userNum);
	Inquiry getInquiry(int inqNum);
	InquiryComment getComment(int inqNum);
	boolean modInquiry(Inquiry inquiry);
	Inquiry getCount(int userNum);
}
