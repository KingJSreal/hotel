package kangjaesu.hotel.inquiry.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kangjaesu.hotel.inquiry.domain.Inquiry;
import kangjaesu.hotel.inquiry.dao.InquiryDao;

@Service
public class InquiryServiceImpl implements InquiryService{
	@Autowired private InquiryDao inquiryDao;
	
	@Transactional
	@Override
	public List<Inquiry> getInquirys() {
		return inquiryDao.getInquirys();
	}

	@Override
	public Inquiry getInquiry(Inquiry inquiry) {
		return inquiryDao.getInquiry(inquiry);
	}

	@Override
	public boolean writeInquiry(Inquiry inquiry) {
		return inquiryDao.addInquiry(inquiry) > 0;
	}

	@Override
	public boolean deleteInquiry(int inqNum) {
		return inquiryDao.delInquiry(inqNum) > 0;
	}

}
