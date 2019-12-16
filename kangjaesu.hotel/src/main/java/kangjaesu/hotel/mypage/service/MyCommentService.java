package kangjaesu.hotel.mypage.service;

import java.util.List;

import kangjaesu.hotel.comment.domain.Comment;
import kangjaesu.hotel.user.domain.User;

public interface MyCommentService {
	List<Comment> getMyComments(Comment comment);
	int getMyCommentsCount(Comment comment);
	Comment getMyComment(Comment comment);

}
