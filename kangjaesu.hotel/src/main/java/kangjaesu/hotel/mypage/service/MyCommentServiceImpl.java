package kangjaesu.hotel.mypage.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kangjaesu.hotel.comment.domain.Comment;
import kangjaesu.hotel.mypage.dao.MypageDao;
import kangjaesu.hotel.user.domain.User;

@Service
public class MyCommentServiceImpl implements MyCommentService{
	@Autowired private MypageDao mypageDao;


	@Override
	public List<Comment> getMyComments(Comment comment) {
		return mypageDao.getMyComments(comment);
	}
	
	@Override
	public int getMyCommentsCount(Comment comment) {
		return mypageDao.getMyCommentsCount(comment);
	}

	@Override
	public Comment getMyComment(Comment comment) {
		return mypageDao.getMyComment(comment);
	}

	

}
