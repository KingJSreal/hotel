package kangjaesu.hotel.user.comtroller;

import kangjaesu.hotel.user.domain.User;
import kangjaesu.hotel.user.service.UserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired private UserService userService;
	
	
	
	@Transactional
	@RequestMapping("/userTerms")
	public String userTerms() {
		return "user/terms";
	}
	@Transactional
	@RequestMapping("/userJoin")
	public String userJoin() {
		return "user/join";
	}
	@Transactional
	@RequestMapping("/userComplete")
	public String userComplete() {
		return "user/complete";
	}
	@Transactional
	@RequestMapping("/join")
	public void join(User user) {
		userService.join(user);
	}

	@Transactional
	@ResponseBody
	@RequestMapping("/checkEmail")
	public boolean checkDuplicationUserEmail(User user) {
		boolean result = false;
		if(userService.findUser(user) == null) result = true;
		return result;
	}
//	@RequestMapping("/listUsers")
//	@ResponseBody
//	@Transactional
//	public List<User> listUsers() {
//		return userService.listUsers();
//	}
//	
//	@RequestMapping("/find")
//	@ResponseBody
//	@Transactional
//	public User findUser(User user) {
//		return userService.findUser(user);
//	}
//	
//
//	@RequestMapping("/cerrect")
//	@ResponseBody
//	@Transactional
//	public boolean cerrectUser(User user) {
//		return userService.cerrectUser(user);
//	}
//
//	@RequestMapping("/secede")
//	@ResponseBody
//	@Transactional
//	public boolean secede(int userNo) {
//		return userService.secede(userNo);
//	}
}
