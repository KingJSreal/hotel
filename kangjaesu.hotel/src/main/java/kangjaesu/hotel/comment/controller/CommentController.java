package kangjaesu.hotel.comment.controller;

import kangjaesu.hotel.comment.domain.Comment;
import kangjaesu.hotel.comment.service.CommentService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/comment")
public class CommentController {
	@Autowired private CommentService commentService;
	
	
	@Transactional
	@RequestMapping("/commentAdd")
	public String commentAdd() {
		return "comment/add";
	}
	
	@Transactional
	@RequestMapping("/commentLookUp")
	public String commentLookUp(Model model) {
		model.addAttribute("commentList", commentService.getComments());
		return "comment/lookUp";
	}
	

	
	@Transactional
	@RequestMapping("/addC")
	public void join(Comment comment) {
		commentService.join(comment);
	}
}
