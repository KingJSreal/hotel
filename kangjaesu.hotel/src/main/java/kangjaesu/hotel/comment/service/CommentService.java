package kangjaesu.hotel.comment.service;

import java.util.List;

import kangjaesu.hotel.comment.domain.Comment;



public interface CommentService {
	List<Comment> getComments();
	boolean join(Comment comment);
}
