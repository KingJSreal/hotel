package kangjaesu.hotel.room.controller;

import java.io.Console;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;





import kangjaesu.hotel.promotion.domain.PromotionDetail;
import kangjaesu.hotel.room.domain.Option;
import kangjaesu.hotel.room.domain.Room;
import kangjaesu.hotel.room.service.RoomService;









import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/room")
public class RoomController {
	@Autowired private RoomService roomService;
	
	@Transactional
	@RequestMapping("/roomManager")
	public String roomManager(Model model) {
	  model.addAttribute("roomList", roomService.getRooms());   
		return "room/manager";
	}
	@Transactional
	@RequestMapping("/roomReservation")
	public String roomReservation(Model model) {
	  model.addAttribute("roomList", roomService.getRooms());   
		return "room/reservation";
	}
	
/*	@Transactional
	@RequestMapping("/roomData")
	public String roomData(Model model){
		model.addAttribute("roomdata", roomService.getRoom(roomNum));
	}
	*/
/*	@RequestMapping("/myInquiry")
	public String myInquiry(Model model, HttpServletRequest request) throws Exception {
		int inqNum = Integer.parseInt(request.getParameter("inqNumber"));
		model.addAttribute("inq", myInqService.getInquiry(inqNum));
		return "mypage/myInq";
	}*/

	@RequestMapping("/roomData")
	public String roomData(@RequestParam("roomNum") int roomNum , Model model) throws Exception{
		//int roomNum = Integer.parseInt(request.getParameter("roomNum"));
		model.addAttribute("room", roomService.getRoom(roomNum));
		
		 return "room/data";
	}
	//문의 보기
	@RequestMapping("/getData")
	@ResponseBody
	@Transactional
	public Room getData(Room room) {
		return	roomService.getRoom(room.getRoomNum());
		

	}
	

	
	@Transactional
	@RequestMapping("/roomAdd")
	public String roomAdd() {
		return "room/add";
	}
	
	@Transactional
	@ResponseBody
	@RequestMapping("/add")
	public boolean join(Room room , HttpServletRequest request) {
		String optNoReq =  request.getParameter("optNo");
		List<String> optNo = new ArrayList<String>();
		
		for(String option:optNoReq.split("&")){
			optNo.add(option.replace("option=", ""));
		}
		
		 List<Option> options = new ArrayList<Option>();
		 for(int i = 0; i< optNo.size(); i++){
		 Option option = new Option();
		 option.setOptNo(Integer.parseInt(optNo.get(i)));
		
		 options.add(option);}
		 
		return roomService.join(room,  options);
	}
	
	@Transactional
	@ResponseBody
	@RequestMapping("/delete")
	public  boolean delRoom(int roomNum) {
			roomService.delRoom(roomNum);
			return true;
		 
	}
	
	

}
