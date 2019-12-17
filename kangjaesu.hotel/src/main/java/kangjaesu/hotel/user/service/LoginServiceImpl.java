package kangjaesu.hotel.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kangjaesu.hotel.booking.domain.NoneUser;
import kangjaesu.hotel.user.dao.UserDao;
import kangjaesu.hotel.user.domain.User;

@Service
public class LoginServiceImpl implements LoginService{
	@Autowired private UserDao userDao;

	@Override
	@Transactional
	public User logInVaildate(User user) {
		return userDao.loginUser(user);
	}

	@Override
	public List<User> findId(User user) {
		return userDao.findId(user);
	}

	@Override
	public User findPw(User user) {
		return userDao.findPw(user);
	}

	@Override
	public boolean noneUserValidate(NoneUser noneUser) {
		return userDao.noneUserValidate(noneUser)>0;
	}

}
