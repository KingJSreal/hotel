package kangjaesu.hotel;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Main{
	@RequestMapping("/")
	public String main(){
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
