package kangjaesu.hotel.booking.controller;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/booking")
public class BookingController {
	//예약정보 기입 페이지
	@Transactional
	@RequestMapping("/bookingForm")
	public String bookingForm(Model model) {
		return "booking/form";
	}
	
	//예약정보 저장
	@Transactional
	@ResponseBody
	@RequestMapping("/proceedBooking")
	public String proceedBooking(Model model) {
		return "Z";
	}
	
	//예약완료 페이지
	@Transactional
	@RequestMapping("/completeBooking")
	public String completeBooking(Model model) {
		return "booking/completion";
	}
	
	//예약조회 페이지
	@Transactional
	@RequestMapping("/myBooking")
	public String myBooking(Model model) {
		return "booking/myBooking";
	}
	
	//예약관리 페이지
	@Transactional
	@RequestMapping("/bookingManage")
	public String bookingManage(Model model) {
		return "booking/manage";
	}
	
	//예약관리 -> 예약정보 페이지
	@Transactional
	@RequestMapping("/bookingInformation")
	public String bookingInformation(Model model) {
		return "/booking/information";
	}
	
	//예약정보 페이지 -> 예약수정 페이지
	@Transactional
	@RequestMapping("/modBooking")
	public String modBooking(Model model) {
		return "/booking/modification";
	}
}
