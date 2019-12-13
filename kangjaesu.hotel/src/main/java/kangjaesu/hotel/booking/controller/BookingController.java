package kangjaesu.hotel.booking.controller;

import kangjaesu.hotel.booking.domain.Booking;
import kangjaesu.hotel.booking.service.BookingService;
import kangjaesu.hotel.room.domain.Option;
import kangjaesu.hotel.room.domain.Room;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/booking")
public class BookingController {
	@Autowired private BookingService bookingService;
	
	//예약정보 기입 페이지
	@Transactional
	@RequestMapping("/bookingForm")
	public String bookingForm(Booking booking, Room room, Option option, Model model) {
		model.addAttribute("roomNum", booking.getRoomNum());
		model.addAttribute("checkIn", booking.getCheckIn());
		model.addAttribute("checkOut", booking.getCheckOut());
		model.addAttribute("adult", booking.getAdult());
		model.addAttribute("kid", booking.getKid());
		model.addAttribute("roomType", room.getRoomType());
		model.addAttribute("roomType", option.getOptName());
		model.addAttribute("days", bookingService.days(booking.getCheckIn(), booking.getCheckOut()));
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
