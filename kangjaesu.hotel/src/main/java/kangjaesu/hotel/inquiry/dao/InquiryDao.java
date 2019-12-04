package kangjaesu.hotel.inquiry.dao;

import java.util.List;

import kangjaesu.hotel.inquiry.domain.Inquiry;

public interface InquiryDao {
	Inquiry getInquiry(Inquiry inquiry);
	int addInquiry(Inquiry inquiry);
	List<Inquiry> getInquirys();
	int delInquiry(int inqNum);
}
