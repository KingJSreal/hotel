package kangjaesu.hotel.point.dao.mapper;

import java.util.List;

import kangjaesu.hotel.point.domain.Point;
import kangjaesu.hotel.user.domain.User;

public interface PointMapper {
	List<Point> getMyPointList(User user);
	int getMyPointSum(User user);
	int addPoint(Point point);
	int delPoint(User user);
}
