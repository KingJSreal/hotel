package kangjaesu.hotel.point.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kangjaesu.hotel.point.dao.mapper.PointMapper;
import kangjaesu.hotel.point.domain.Point;
import kangjaesu.hotel.user.domain.User;

@Repository
public class PointDaoImpl implements PointDao{
	@Autowired private PointMapper mapper = null;
	
	@Override
	public List<Point> getMyPointList(User user) {
		return mapper.getMyPointList(user);
	}

	@Override
	public int getMyPointSum(User user) {
		return mapper.getMyPointSum(user);
	}
	
	@Override
	public int addPoint(Point point) {
		return mapper.addPoint(point);
	}

	@Override
	public int delPoint(User user) {
		return mapper.delPoint(user);
	}

}
