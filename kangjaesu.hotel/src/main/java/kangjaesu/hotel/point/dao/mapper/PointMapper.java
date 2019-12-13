package kangjaesu.hotel.point.dao.mapper;

import java.util.List;

import kangjaesu.hotel.common.domain.Page;
import kangjaesu.hotel.point.domain.Point;
import kangjaesu.hotel.user.domain.User;

public interface PointMapper {
	List<Point> getMyPointList(Page page);
	int getMyPointSum(User user);
	int addPoint(Point point);
	int delPoint(Point point);
	int getMyPointCount(Point point);
}
