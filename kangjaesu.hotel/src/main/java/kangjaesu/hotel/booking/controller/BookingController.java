package kangjaesu.hotel.booking.controller;

import kangjaesu.hotel.booking.domain.Account;
import kangjaesu.hotel.booking.domain.Booking;
import kangjaesu.hotel.booking.domain.Card;
import kangjaesu.hotel.booking.service.BookingService;
import kangjaesu.hotel.point.service.PointService;
import kangjaesu.hotel.room.domain.Option;
import kangjaesu.hotel.room.domain.Room;
import kangjaesu.hotel.room.service.RoomService;
import kangjaesu.hotel.user.domain.User;
import kangjaesu.hotel.user.service.UserService;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/booking")
public class BookingController {
	@Autowired private BookingService bookingService;
	@Autowired private RoomService roomService;
	@Autowired private PointService pointService;
	@Autowired private UserService userService;
	
	//예약정보 기입 페이지
	@Transactional
	@RequestMapping("/bookingForm")
	public String bookingForm(Booking booking, Room room, HttpSession session, Model model) {
		//User user = (User) session.getAttribute("user");

		//model.addAttribute("point", pointService.getMyPointSum(user));
		model.addAttribute("booking", booking);
		model.addAttribute("room", room);
		model.addAttribute("optionList", roomService.getRoom(booking.getRoomNum()).getOptions());
		model.addAttribute("days", bookingService.days(booking.getCheckIn(), booking.getCheckOut()));
		
		return "booking/form";
	}
	
	//예약정보 저장
	@Transactional
	@ResponseBody
	@RequestMapping("/proceedBooking")
	public Booking proceedBooking(Model model, Booking booking, Card card,
						Account account, String paytype, String cardExp) throws ParseException {
		booking.setPaytype(paytype);
		bookingService.addBooking(booking);
		
		if(paytype.equals("card")) {
			card.setCardExp(cardExp);
			card.setBookingNum(booking.getBookingNum());
			bookingService.addCard(card);
		}
		else if(paytype.equals("account")) {
			account.setBookingNum(booking.getBookingNum());
			bookingService.addAccount(account);
		}
		return booking;
	}
	
	//예약완료 페이지
	@Transactional
	@RequestMapping("/completeBooking")
	public String completeBooking(Model model, Room room, int bookingNum) {
		Booking booking = bookingService.getBooking(bookingNum);
		booking.setRoomType(roomService.getRoom(booking.getRoomNum()).getRoomType());
		model.addAttribute("optionList", roomService.getRoom(booking.getRoomNum()).getOptions());
		model.addAttribute("booking", booking);
		model.addAttribute("days", bookingService.days(booking.getCheckIn(), booking.getCheckOut()));
		return "booking/completion";
	}
	
	//예약조회 페이지
	@Transactional
	@RequestMapping("/myBooking")
	public String myBooking(Model model, HttpSession session) {
		User user = (User) session.getAttribute("user");
		int userNum = user.getUserNum();
		model.addAttribute("myBookingList", bookingService.getMyBookings(userNum));
		return "booking/myBooking";
	}
	
	//예약관리 페이지
	@Transactional
	@RequestMapping("/bookingManage")
	public String bookingManage(Model model) {
		model.addAttribute("bookingList", bookingService.BookingList());
		return "booking/manage";
	}
	
	//예약관리 -> 예약정보 페이지
	@Transactional
	@RequestMapping("/bookingInformation")
	public String bookingInformation(Model model, int bookingNum, String roomType, String name) {
		Booking booking = bookingService.getBooking(bookingNum);
		String optionList = bookingService.getOption(booking);
		long days = bookingService.days(booking.getCheckIn(), booking.getCheckOut());
		model.addAttribute("optionList", optionList);
		model.addAttribute("booking", booking);
		model.addAttribute("name", name);
		model.addAttribute("roomType", roomType);
		model.addAttribute("days", days);
		
		return "/booking/information";
	}
	
	//예약정보 페이지 -> 예약수정 페이지
	@Transactional
	@RequestMapping("/modBooking")
	public String modBooking(Model model, int bookingNum, String roomType, String name) {
		Booking booking = bookingService.getBooking(bookingNum);
		String optionList = bookingService.getOption(booking);
		long days = bookingService.days(booking.getCheckIn(), booking.getCheckOut());
		model.addAttribute("optionList", optionList);
		model.addAttribute("booking", booking);
		model.addAttribute("name", name);
		model.addAttribute("roomType", roomType);
		model.addAttribute("days", days);
		
		return "/booking/modification";
	}
	
	//예약정보 페이지 -> 예약삭제
	@Transactional
	@ResponseBody
	@RequestMapping("/delBooking")
	public String delBooking(Model model, int bookingNum) {
		bookingService.delBooking(bookingNum);
		return "del";
	}
}
