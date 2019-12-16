package kangjaesu.hotel.mypage.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kangjaesu.hotel.comment.domain.Comment;
import kangjaesu.hotel.inquiry.domain.Inquiry;
import kangjaesu.hotel.inquiry.domain.InquiryComment;
import kangjaesu.hotel.mypage.dao.mapper.MypageMapper;
import kangjaesu.hotel.user.domain.User;

@Repository
public class MypageDaoImpl implements MypageDao{
	@Autowired private MypageMapper mapper = null;

	@Override
	public List<Inquiry> getInquirys(int userNum) {
		return mapper.getInquirys(userNum);
	}

	@Override
	public Inquiry getInquiry(int inqNum, int userNum) {
		return mapper.getInquiry(inqNum, userNum);
	}

	@Override
	public InquiryComment getComment(int inqNum) {
		return mapper.getComment(inqNum);
	}

	@Override
	public boolean modInquiry(Inquiry inquiry) {
		return mapper.modInquiry(inquiry);
	}

	@Override
	public Inquiry getCount(int userNum) {
		return mapper.getCount(userNum);
	}

	

	@Override
	public List<Comment> getMyComments(Comment comment) {
		return mapper.getMyComments(comment);
	}
	
	@Override
	public int getMyCommentsCount(Comment comment) {
		return mapper.getMyCommentsCount(comment);
	}

	@Override
	public Comment getMyComment(Comment comment) {
		return mapper.getMyComment(comment);
	}


}
