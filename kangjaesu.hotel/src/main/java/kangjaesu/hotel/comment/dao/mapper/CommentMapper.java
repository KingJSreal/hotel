package kangjaesu.hotel.comment.dao.mapper;

import java.util.List;

import kangjaesu.hotel.comment.domain.Comment;


public interface CommentMapper {
	int addComment(Comment comment);
	List<Comment> getComments();
}
