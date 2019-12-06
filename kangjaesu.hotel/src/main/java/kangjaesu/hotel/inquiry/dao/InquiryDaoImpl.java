package kangjaesu.hotel.inquiry.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kangjaesu.hotel.inquiry.dao.mapper.InquiryMapper;
import kangjaesu.hotel.inquiry.domain.Inquiry;
import kangjaesu.hotel.inquiry.domain.InquiryComment;

@Repository
public class InquiryDaoImpl implements InquiryDao{
	@Autowired private InquiryMapper mapper = null;
	
	@Override
	public Inquiry getInquiry(int inqNum) {
		return mapper.getInquiry(inqNum);
	}

	@Override
	public int addInquiry(Inquiry inquiry) {
		return mapper.addInquiry(inquiry);
	}

	@Override
	public List<Inquiry> getInquirys() {
		return mapper.getInquirys();
	}

	@Override
	public int delInquiry(int inqNum) {
		return mapper.delInquiry(inqNum);
	}

	@Override
	public int addComment(InquiryComment comment) {
		return mapper.addComment(comment);
	}
}
