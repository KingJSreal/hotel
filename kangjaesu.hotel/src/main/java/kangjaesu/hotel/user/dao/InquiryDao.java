package kangjaesu.hotel.user.dao;

import java.util.List;

import kangjaesu.hotel.user.domain.Inquiry;

public interface InquiryDao {
	Inquiry getInquiry(Inquiry inquiry);
	int addInquiry(Inquiry inquiry);
	List<Inquiry> getInquirys();
	int delInquiry(int inqNum);
}
