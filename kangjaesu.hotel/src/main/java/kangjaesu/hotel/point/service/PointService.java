package kangjaesu.hotel.point.service;

import java.util.List;

import kangjaesu.hotel.common.domain.Page;
import kangjaesu.hotel.point.domain.Point;
import kangjaesu.hotel.user.domain.User;

public interface PointService {
	List<Point> getMyPointList(Page page);
	int getMyPointSum(int userNum);
	boolean addPoint(Point point);
	boolean resetPoint(Point point);
	int countPoints(Point point);
}
