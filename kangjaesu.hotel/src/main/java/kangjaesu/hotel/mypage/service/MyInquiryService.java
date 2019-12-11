package kangjaesu.hotel.mypage.service;

import java.util.List;

import kangjaesu.hotel.inquiry.domain.Inquiry;
import kangjaesu.hotel.inquiry.domain.InquiryComment;

public interface MyInquiryService {
	List<Inquiry> getInquirys(int userNum);
	Inquiry getInquiry(int inqNum, int userNum);
	InquiryComment getInquiryAnswer(int inqNum);
	boolean modInquiry(Inquiry inquiry);
	Inquiry getCount(int userNum);
}
