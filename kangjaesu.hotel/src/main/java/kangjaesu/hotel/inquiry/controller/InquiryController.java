package kangjaesu.hotel.inquiry.controller;

import kangjaesu.hotel.inquiry.domain.Inquiry;
import kangjaesu.hotel.inquiry.domain.InquiryComment;
import kangjaesu.hotel.inquiry.service.InquiryService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/inquiry")
public class InquiryController {
	@Autowired private InquiryService inquiryService;
	
	
	//문의관리 페이지
	@Transactional
	@RequestMapping("/inquiryManage")
	public String inquiryManage(Model model) {
		model.addAttribute("inquiryList", inquiryService.getInquirys());
		model.addAttribute("inquiryCount", inquiryService.getCount());
		return "inquiry/manage";
	}

	//문의보기 모달 페이지
	@Transactional
	@RequestMapping("/viewInquiry")
	public String viewInquiry(Model model, Inquiry inquiry) {
		return "inquiry/view";
	}
	
	//문의 보기
	@RequestMapping("/getInquiry")
	@ResponseBody
	@Transactional
	public Inquiry getInquiry(Inquiry inquiry) {
		return inquiryService.getInquiry(inquiry.getInqNum());
	}
	
	//문의답변 모달 페이지
	@Transactional
	@RequestMapping("/inquiryAnswer")
	public String inquiryAnswer(Inquiry inquiry) {
		return "inquiry/answer";
	}
	
	//답변 등록
	@Transactional
	@ResponseBody
	@RequestMapping("/writeComment")
	public boolean writeComment(Inquiry inquiry, InquiryComment comment) {
		inquiryService.writeComment(comment);
		return true;
	}

	//문의등록 페이지
	@Transactional
	@RequestMapping("/inquiryForm")
	public String customerInquiry() {
		return "inquiry/form";
	}
	
	//문의 등록
	@Transactional
	@ResponseBody
	@RequestMapping("/writeInquiry")
	public boolean writeInquiry(Inquiry inquiry) {
		inquiryService.writeInquiry(inquiry);
		return true;
	}
	
	//문의 삭제
	@Transactional
	@ResponseBody
	@RequestMapping("/deleteInquiry")
	public boolean deleteInquiry(Inquiry inquiry) {
		inquiryService.deleteInquiry(inquiry.getInqNum());
		return true;
	}

}
