package kangjaesu.hotel.point.service;

import java.util.List;

import kangjaesu.hotel.point.dao.PointDao;
import kangjaesu.hotel.point.domain.Point;
import kangjaesu.hotel.user.domain.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PointServiceImpl implements PointService{
	@Autowired private PointDao pointDao;

	@Override
	public List<Point> getMyPoints(User user) {
		return pointDao.getMyPoint(user);
	}

	@Override
	public int addPoint(User user) {
		return pointDao.addPoint(user);
	}

	@Override
	public int secedePoint(User user) {
		return pointDao.updatePoint(user);
	}
	
	

}
