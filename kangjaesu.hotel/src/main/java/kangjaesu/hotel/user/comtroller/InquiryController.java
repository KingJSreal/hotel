package kangjaesu.hotel.user.comtroller;

import java.util.List;

import kangjaesu.hotel.user.domain.Inquiry;
import kangjaesu.hotel.user.service.InquiryService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/inquiry")
public class InquiryController {
	@Autowired private InquiryService inquiryService;
	
	@Transactional
	@RequestMapping("/inquiryManage")
	public String inquiryManage() {
		inquiryService.getInquirys();
		return "inquiry/manage";
	}
	
	@ResponseBody
	@Transactional
	@RequestMapping("/getInquiry")
	public Inquiry getInquiry(Inquiry inquiry) {
		return inquiryService.getInquiry(inquiry);
	}
	
	@Transactional
	@RequestMapping("/inquiryForm")
	public String customerInquiry() {
		return "inquiry/form";
	}
	
	@Transactional
	@ResponseBody
	@RequestMapping("/writeInquiry")
	public Boolean writeInquiry(Inquiry inquiry) {
		inquiryService.writeInquiry(inquiry);
		return true;
	}

}
