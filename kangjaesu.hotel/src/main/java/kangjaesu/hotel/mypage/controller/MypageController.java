package kangjaesu.hotel.mypage.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
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
	public String myInquiry(Model model, HttpServletRequest request) throws Exception {
		int inqNum = Integer.parseInt(request.getParameter("inqNumber"));
		model.addAttribute("inq", myInqService.getInquiry(inqNum));
		return "mypage/myInq";
	}
	
	@RequestMapping("/modifyInquiry")
	public String modifyInquiry(Model model, HttpServletRequest request) throws Exception {
		int inqNum = Integer.parseInt(request.getParameter("inqNumber"));
		model.addAttribute("inq", myInqService.getInquiry(inqNum));
		return "mypage/modInq";
	}
	
	@ResponseBody
	@RequestMapping("/getAnswer")
	public InquiryComment getAnswer(Model model, Inquiry inquiry) {
		model.addAttribute("inquiry", myInqService.getInquiryAnswer(inquiry.getInqNum()));
		return myInqService.getInquiryAnswer(inquiry.getInqNum());
	}
	
	@ResponseBody
	@RequestMapping("/submitModInq")
	public Inquiry submitModInq(Model model, Inquiry inquiry) {
		myInqService.modInquiry(inquiry);
		return inquiry;
	}
	
	//답변 모달 불러오기
/*	@Transactional
	@RequestMapping("/myInqAns")
	public String myInqAns(Model model, Inquiry inquiry) throws Exception {
		model.addAttribute("inq", myInqService.getInquiryAnswer(inquiry.getInqNum()));
		return "mypage/myInqAns";
	}*/
}
