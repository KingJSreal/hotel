package kangjaesu.hotel.point.service;

import java.util.List;

import kangjaesu.hotel.common.domain.Page;
import kangjaesu.hotel.point.dao.PointDao;
import kangjaesu.hotel.point.dao.mapper.PointMapper;
import kangjaesu.hotel.point.domain.Point;
import kangjaesu.hotel.user.domain.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PointServiceImpl implements PointService{
	@Autowired private PointDao pointDao;
	
	@Override
	public List<Point> getMyPointList(Page page) {
		return pointDao.getMyPointList(page);
	}

	@Override
	public int getMyPointSum(User user) {
		return pointDao.getMyPointSum(user);
	}
	@Override
	public boolean addPoint(Point point) {
		return pointDao.addPoint(point)>0;
	}

	@Override
	public boolean resetPoint(Point point) {
		return pointDao.delPoint(point)>0;
	}

	@Override
	public int countPoints(Point point) {
		return pointDao.getMyPointCount(point);
	}
	
	

}
