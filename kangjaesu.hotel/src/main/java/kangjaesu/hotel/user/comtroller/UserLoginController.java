package kangjaesu.hotel.user.comtroller;

import javax.servlet.http.HttpSession;

import kangjaesu.hotel.user.domain.User;
import kangjaesu.hotel.user.service.LoginService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/user")
public class UserLoginController {
	@Autowired private LoginService loginService;

	@RequestMapping("/loginForm")
	public String userLogin() {
		return "user/login";
	}
	
	@RequestMapping("/login")
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
	
	@RequestMapping("/adminLogin")
	@ResponseBody
	@Transactional
	public Boolean adminLogin(User user, HttpSession session) { // && user.getUserLevel() > 3
		Boolean result = false;
		User adminUser = loginService.logInVaildate(user);
		if(adminUser != null && adminUser.getUserLevel() >= 3) {
			result = true;
			session.setAttribute("user", adminUser);
			}
		return result;
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "main";
	}

}
