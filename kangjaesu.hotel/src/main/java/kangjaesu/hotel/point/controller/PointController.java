package kangjaesu.hotel.point.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kangjaesu.hotel.point.domain.Point;
import kangjaesu.hotel.point.service.PointService;
import kangjaesu.hotel.user.domain.User;


@Controller
@RequestMapping("/point")
public class PointController {
	@Autowired private PointService pointService;

	@RequestMapping("/getMyPointList")
	@ResponseBody
	@Transactional
	public List<Point> getMyPointList(User user) {
		return pointService.getMyPointList(user);
	}
	
	@RequestMapping("/getMyPointSum")
	@ResponseBody
	@Transactional
	public int getMyPointSum(User user) {
		return pointService.getMyPointSum(user);
	}
	
	@RequestMapping("/addPoint")
	@ResponseBody
	@Transactional
	public boolean addPoint(Point point) {
		return pointService.addPoint(point);
	}

	@RequestMapping("/resetPoint")
	@ResponseBody
	@Transactional
	public boolean resetPoint(User user) {
		return pointService.resetPoint(user);
	}
}
