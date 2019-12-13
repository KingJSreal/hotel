package kangjaesu.hotel.point.service;

import java.util.List;

import kangjaesu.hotel.point.domain.Point;
import kangjaesu.hotel.user.domain.User;

public interface PointService {
	List<Point> getMyPointList(User user);
	int getMyPointSum(User user);
	boolean addPoint(Point point);
	boolean resetPoint(User user);
}
