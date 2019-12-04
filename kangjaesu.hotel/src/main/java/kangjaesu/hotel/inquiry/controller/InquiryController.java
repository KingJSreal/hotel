package kangjaesu.hotel.inquiry.controller;

import kangjaesu.hotel.inquiry.domain.Inquiry;
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
   
   @Transactional
   @RequestMapping("/inquiryManage")
   public String inquiryManage(Model model) {
      model.addAttribute("inquiryList", inquiryService.getInquirys());
      return "inquiry/manage";
   }
   

   @Transactional
   @RequestMapping("/viewInquiry")
   public String viewInquiry(Model model, Inquiry inquiry) {
      //model.addAttribute("inq", inquiryService.getInquiry(inquiry));
      return "inquiry/view";
   }
   
   @Transactional
   @ResponseBody
   @RequestMapping("/getInquiry")
   public Inquiry getInquiry(Inquiry inquiry) {
      //model.addAttribute("inquiry", inquiryService.getInquiry(inquiry));
      return inquiryService.getInquiry(inquiry);
   }
   
   @Transactional
   @RequestMapping("/inquiryAnswer")
   public String inquiryAnswer(Inquiry inquiry, Model model) {
      //model.addAttribute("inquiry", inquiryService.getInquiry(inquiry));
      return "inquiry/answer";
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