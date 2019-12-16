package kangjaesu.hotel.comment.service;

import java.util.List;

import kangjaesu.hotel.comment.domain.Comment;



public interface CommentService {
	List<Comment> getComments();
	boolean join(Comment comment);
	Comment getReview(int revNum);
	boolean delReview(int revNum);
	boolean updateReview(Comment comment);
}
