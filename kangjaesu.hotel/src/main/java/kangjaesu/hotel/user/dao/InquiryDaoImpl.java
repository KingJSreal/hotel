package kangjaesu.hotel.user.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kangjaesu.hotel.user.dao.mapper.InquiryMapper;
import kangjaesu.hotel.user.domain.Inquiry;

@Repository
public class InquiryDaoImpl implements InquiryDao{
	@Autowired private InquiryMapper mapper = null;
	
	@Override
	public Inquiry getInquiry(Inquiry inquiry) {
		return mapper.getInquiry(inquiry);
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
}
