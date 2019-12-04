package kangjaesu.hotel.room.controller;

import java.util.List;

import kangjaesu.hotel.room.domain.Room;
import kangjaesu.hotel.room.service.RoomService;




import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
	@RequestMapping("/roomAdd")
	public String roomAdd() {
		return "room/add";
	}
	
	@Transactional
	@RequestMapping("/add")
	public void join(Room room) {
		roomService.join(room);
	}
	

}
