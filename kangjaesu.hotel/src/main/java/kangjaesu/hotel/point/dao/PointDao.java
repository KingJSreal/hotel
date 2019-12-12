package kangjaesu.hotel.point.dao;

import java.util.List;

import kangjaesu.hotel.point.domain.Point;
import kangjaesu.hotel.user.domain.User;

public interface PointDao {
	List<Point> getMyPoint(User user);
	int addPoint(User user);
	int updatePoint(User user);

}
