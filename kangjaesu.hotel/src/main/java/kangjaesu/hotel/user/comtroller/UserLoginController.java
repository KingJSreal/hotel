package kangjaesu.hotel.user.comtroller;

import java.util.List;

import javax.servlet.http.HttpSession;

import kangjaesu.hotel.user.domain.User;
import kangjaesu.hotel.user.service.LoginService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class UserLoginController {
	@Autowired private LoginService loginService;

	@RequestMapping("/loginUser")
	public String userLogin() {
		return "user/loginUser";
	}
	
	@RequestMapping("/admin")
	public String admin(){
		return "admin";
	}
	
	@RequestMapping("/searchIdNPw")
	public String userSearchIdPw() {
		return "user/searchIdNPw";
	}
	
	@RequestMapping("user/login")
	@ResponseBody
	@Transactional
	public Boolean login(User user, HttpSession session) {
		Boolean result = false;
		User memUser = loginService.logInVaildate(user);
		if(memUser != null) {
			result = true;
			session.setAttribute("user", memUser);
			}
		return result;
	}
	
	@RequestMapping("user/adminLogin")
	@ResponseBody
	@Transactional
	public Boolean adminLogin(User user, HttpSession session) { // && user.getUserLevel() > 3
		Boolean result = false;
		User adminUser = loginService.logInVaildate(user);
		if(adminUser != null && adminUser.getUserGrade() >= 3) {
			result = true;
			session.setAttribute("user", adminUser);
			}
		return result;
	}
	
	@RequestMapping("user/findId")
	@ResponseBody
	@Transactional
	public List<User> findId(User user) {
		return loginService.findId(user);
	}	
	
	@RequestMapping("user/findPw")
	@ResponseBody
	@Transactional
	public User findPw(User user) {
		return loginService.findPw(user);
	}		
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "main";
	}

}
