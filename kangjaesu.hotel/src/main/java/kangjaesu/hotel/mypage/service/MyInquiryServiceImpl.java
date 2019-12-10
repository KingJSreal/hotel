package kangjaesu.hotel.mypage.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kangjaesu.hotel.inquiry.domain.Inquiry;
import kangjaesu.hotel.inquiry.domain.InquiryComment;
import kangjaesu.hotel.mypage.dao.MypageDao;

@Service
public class MyInquiryServiceImpl implements MyInquiryService{
	@Autowired private MypageDao inquiryDao;
	
	@Transactional
	@Override
	public List<Inquiry> getInquirys(int userNum) {
		return inquiryDao.getInquirys(userNum);
	}

	@Override
	public Inquiry getInquiry(int inqNum, int userNum) {
		return inquiryDao.getInquiry(inqNum, userNum);
	}

	@Override
	public InquiryComment getInquiryAnswer(int inqNum) {
		return inquiryDao.getComment(inqNum);
	}

	@Override
	public boolean modInquiry(Inquiry inquiry) {
		return inquiryDao.modInquiry(inquiry);
	}

	@Override
	public Inquiry getCount(int userNum) {
		return inquiryDao.getCount(userNum);
	}
}
