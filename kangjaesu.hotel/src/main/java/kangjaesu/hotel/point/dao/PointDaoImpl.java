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
	public List<Point> getMyPoint(User user) {
		return mapper.getMyPoint(user);
	}

	@Override
	public int addPoint(User user) {
		return mapper.addPoint(user);
	}

	@Override
	public int updatePoint(User user) {
		return mapper.updatePoint(user);
	}

}
