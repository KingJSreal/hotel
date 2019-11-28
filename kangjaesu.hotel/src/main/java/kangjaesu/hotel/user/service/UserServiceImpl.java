package kangjaesu.hotel.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kangjaesu.hotel.user.dao.UserDao;
import kangjaesu.hotel.user.domain.User;

@Service
public class UserServiceImpl implements UserService{
	@Autowired private UserDao userDao;

	@Override
	@Transactional
	public List<User> listUsers() {
		return userDao.getUsers();
	}

	@Override
	@Transactional
	public User findUser(User user) {
		return userDao.getUser(user);
	}

	@Override
	@Transactional
	public boolean join(User user) {
		return userDao.addUser(user)>0;
	}
//
//	@Override
//	@Transactional
//	public boolean cerrectUser(User user) {
//		return userDao.updateUser(user)>0;
//	}
//
//	@Override
//	@Transactional
//	public boolean secede(int userNo) {
//		return userDao.delUser(userNo)>0;
//	}
}
