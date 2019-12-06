package kangjaesu.hotel.inquiry.controller;

import kangjaesu.hotel.inquiry.domain.Inquiry;
import kangjaesu.hotel.inquiry.domain.InquiryComment;
import kangjaesu.hotel.inquiry.service.MailService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/inquiry")
public class InquiryMailController {
	@Autowired private MailService mailService;
	
	@RequestMapping(method=RequestMethod.GET)
	public void form(){}
	
	@RequestMapping("/inquiryMail")
	public String send(InquiryComment msg, Inquiry to){
		mailService.send(msg, to);
		return "inquiry/manage";
	}
	
}
