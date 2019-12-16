package kangjaesu.hotel.mypage.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kangjaesu.hotel.comment.domain.Comment;
import kangjaesu.hotel.inquiry.domain.Inquiry;
import kangjaesu.hotel.inquiry.domain.InquiryComment;
import kangjaesu.hotel.mypage.dao.MypageDao;
import kangjaesu.hotel.user.domain.User;

@Service
public class MyInquiryServiceImpl implements MyInquiryService{
	@Autowired private MypageDao mypageDao;
	
	@Transactional
	@Override
	public List<Inquiry> getInquirys(int userNum) {
		return mypageDao.getInquirys(userNum);
	}

	@Override
	public Inquiry getInquiry(int inqNum, int userNum) {
		return mypageDao.getInquiry(inqNum, userNum);
	}

	@Override
	public InquiryComment getInquiryAnswer(int inqNum) {
		return mypageDao.getComment(inqNum);
	}

	@Override
	public boolean modInquiry(Inquiry inquiry) {
		return mypageDao.modInquiry(inquiry);
	}

	@Override
	public Inquiry getCount(int userNum) {
		return mypageDao.getCount(userNum);
	}
}
