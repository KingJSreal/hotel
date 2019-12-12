package kangjaesu.hotel.mypage.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kangjaesu.hotel.inquiry.domain.Inquiry;
import kangjaesu.hotel.inquiry.domain.InquiryComment;
import kangjaesu.hotel.mypage.service.MyInquiryService;
import kangjaesu.hotel.user.domain.User;

@Controller
@RequestMapping("/mypage")
public class MypageController {
	@Autowired private MyInquiryService myInqService;
	
	@Transactional
	@RequestMapping("/boardInq")
	public String boardInq(Model model, HttpSession session) {
		User user = (User) session.getAttribute("user");
		int userNum = user.getUserNum();
		model.addAttribute("inqCount", myInqService.getCount(userNum));
		model.addAttribute("inqList", myInqService.getInquirys(userNum));
		return "mypage/boardInq";
	}
	
	@RequestMapping("/myInquiry")
	public String myInquiry(@RequestParam("inqNumber")int inqNum,
			Model model, HttpSession session) throws Exception {
		User user = (User) session.getAttribute("user");
		int userNum = user.getUserNum();
		model.addAttribute("inq", myInqService.getInquiry(inqNum, userNum));
		return "mypage/myInq";
	}
	
	@RequestMapping("/modifyInquiry")
	public String modifyInquiry(@RequestParam("inqNumber")int inqNum,
		Model model, HttpSession session) throws Exception {
		User user = (User) session.getAttribute("user");
		int userNum = user.getUserNum();
		model.addAttribute("inq", myInqService.getInquiry(inqNum, userNum));
		return "mypage/modInq";
	}
	
	@ResponseBody
	@RequestMapping("/submitModInq")
	public Inquiry submitModInq(Model model, Inquiry inquiry) {
		myInqService.modInquiry(inquiry);
		return inquiry;
	}
	
	//답변 보기 페이지
	@ResponseBody
	@RequestMapping("/getComment")
	public InquiryComment getComment(Model model, Inquiry inquiry, User user) {
		int userNum = user.getUserNum();
		model.addAttribute("inq", myInqService.getInquiry(inquiry.getInqNum(), userNum));
		myInqService.getInquiryAnswer(inquiry.getInqNum());
		return myInqService.getInquiryAnswer(inquiry.getInqNum());
	}
	
	//답변 모달 불러오기
/*	@Transactional
	@RequestMapping("/myInqAns")
	public String myInqAns(Model model, Inquiry inquiry) throws Exception {
		model.addAttribute("inq", myInqService.getInquiryAnswer(inquiry.getInqNum()));
		return "mypage/myInqAns";
	}*/
}
