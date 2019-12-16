package kangjaesu.hotel.comment.controller;

import kangjaesu.hotel.comment.domain.Comment;
import kangjaesu.hotel.comment.service.CommentService;
import kangjaesu.hotel.room.domain.Room;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	@ResponseBody
	@RequestMapping("/addC")
	public boolean join(Comment comment) {
		return commentService.join(comment);
	}
	
	@RequestMapping("/commentView")
	public String commentView(@RequestParam("revNum") int revNum , Model model) throws Exception{
		//int roomNum = Integer.parseInt(request.getParameter("roomNum"));
	
		model.addAttribute("comment", commentService.getReview(revNum));

		 return "comment/view";
		 
	}
	@RequestMapping("/commentView2")
	public String commentView2(@RequestParam("revNum") int revNum , Model model) throws Exception{
		//int roomNum = Integer.parseInt(request.getParameter("roomNum"));
	
		model.addAttribute("comment", commentService.getReview(revNum));

		 return "comment/viewUpdate";
		 
	}

	
	@Transactional
	@ResponseBody
	@RequestMapping("/delView")
	public boolean delView(int revNum){
	 return	commentService.delReview(revNum);
	}
	
	@Transactional
	@ResponseBody
	@RequestMapping("/updateView")
	public boolean updateReview(Comment comment){
	 return commentService.updateReview(comment);
	}
}
