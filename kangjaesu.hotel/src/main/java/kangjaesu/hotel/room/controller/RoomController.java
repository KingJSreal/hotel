package kangjaesu.hotel.room.controller;

import java.io.Console;
import java.util.List;

import kangjaesu.hotel.room.domain.Room;
import kangjaesu.hotel.room.service.RoomService;







import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
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
	
/*	@Transactional
	@RequestMapping("/roomData")
	public String roomData(Model model){
		model.addAttribute("roomdata", roomService.getRoom(roomNum));
	}
	*/
	@Transactional
	@ResponseBody
	@RequestMapping("/roomData")
	public String roomData(int roomNum, Model model) {
		model.addAttribute("room", roomService.getRoom(roomNum));
		System.out.println(model);
		 return "model";
	}
	
	@Transactional

	@RequestMapping("/roomde")
	public String roomde() {
			
		return "room/data";
	}
	
	
	@Transactional
	@RequestMapping("/roomAdd")
	public String roomAdd() {
		return "room/add";
	}
	
	@Transactional
	@RequestMapping("/add")
	public void join(Room room) {
		roomService.join(room);
	}
	
	@Transactional
	@ResponseBody
	@RequestMapping("/delete")
	public  boolean delRoom(int roomNum) {
			roomService.delRoom(roomNum);
			return true;
		 
	}
	
	

}
