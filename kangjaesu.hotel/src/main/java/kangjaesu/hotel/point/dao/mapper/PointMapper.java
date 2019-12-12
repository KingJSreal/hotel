package kangjaesu.hotel.point.dao.mapper;

import java.util.List;

import kangjaesu.hotel.point.domain.Point;
import kangjaesu.hotel.user.domain.User;

public interface PointMapper {
	List<Point> getMyPoint(User user);
	int addPoint(User user);
	int updatePoint(User user);
}
