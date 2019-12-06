package kangjaesu.hotel.inquiry.service;

import kangjaesu.hotel.inquiry.domain.Inquiry;
import kangjaesu.hotel.inquiry.domain.InquiryComment;

public interface MailService {
	void send(InquiryComment msg, Inquiry to);
}
