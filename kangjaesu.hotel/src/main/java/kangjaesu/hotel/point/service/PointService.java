package kangjaesu.hotel.point.service;

import java.util.List;

import kangjaesu.hotel.point.domain.Point;
import kangjaesu.hotel.user.domain.User;

public interface PointService {
	List<Point> getMyPoints(User user);
	int addPoint(User user);
	int secedePoint(User user);
}
