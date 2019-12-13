package kangjaesu.hotel.comment.controller;

import kangjaesu.hotel.comment.domain.Comment;
import kangjaesu.hotel.comment.service.CommentService;

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
		System.out.println(revNum);
		System.out.println(revNum);
		System.out.println(revNum);
		System.out.println("dfdsfsdgdskfsdlhfasld");
		model.addAttribute("comment", commentService.getReview(revNum));

		 return "comment/view";
	}

}
