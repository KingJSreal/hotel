package kangjaesu.hotel.inquiry.dao.mapper;

import java.util.List;

import kangjaesu.hotel.inquiry.domain.Inquiry;

public interface InquiryMapper {
	Inquiry getInquiry(Inquiry inquiry);
	int addInquiry(Inquiry inquiry);
	List<Inquiry> getInquirys();
	int delInquiry(int inqNum);
}
