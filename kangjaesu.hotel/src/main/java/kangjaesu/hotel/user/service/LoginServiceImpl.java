package kangjaesu.hotel.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
}
