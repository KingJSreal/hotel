package kangjaesu.hotel.inquiry.dao;

import java.util.List;

import kangjaesu.hotel.inquiry.domain.Inquiry;
import kangjaesu.hotel.inquiry.domain.InquiryComment;

public interface InquiryDao {
	Inquiry getInquiry(int inqNum);
	int addInquiry(Inquiry inquiry);
	List<Inquiry> getInquirys();
	int delInquiry(int inqNum);
	int addComment(InquiryComment comment);
}
