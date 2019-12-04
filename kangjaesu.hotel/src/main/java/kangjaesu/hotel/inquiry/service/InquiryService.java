package kangjaesu.hotel.inquiry.service;

import java.util.List;

import kangjaesu.hotel.inquiry.domain.Inquiry;

public interface InquiryService {
	List<Inquiry> getInquirys();
	Inquiry getInquiry(Inquiry inquiry);
	boolean writeInquiry(Inquiry inquiry);
	boolean deleteInquiry(int inqNum);
}
