package kangjaesu.hotel;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kangjaesu.hotel.user.domain.User;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Main{
	
	@RequestMapping("/")
	public String main(HttpSession session){
		User user = new User();
		user.setUserNum(0);
		session.setAttribute("user", user);
		return "main";
	}
	
	@RequestMapping("/switchMain")
	public String switchMain(HttpSession session){
		
		session.setAttribute("page", "main");
		return "main";
	}
	
	@RequestMapping("/switchAdmin")
	public String switchAdmin(HttpSession session){
		session.setAttribute("page", "admin");
		return "admin";
	}
}
