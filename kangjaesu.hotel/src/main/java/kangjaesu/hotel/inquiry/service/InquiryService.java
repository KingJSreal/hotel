package kangjaesu.hotel.inquiry.service;

import java.util.List;

import kangjaesu.hotel.inquiry.domain.Inquiry;
import kangjaesu.hotel.inquiry.domain.InquiryComment;

public interface InquiryService {
	List<Inquiry> getInquirys();
	Inquiry getInquiry(int inqNum);
	boolean writeInquiry(Inquiry inquiry);
	boolean deleteInquiry(int inqNum);
	boolean writeComment(InquiryComment comment);
	Inquiry getCount();
	boolean changeStatus(int inqNum);
}
