package kangjaesu.hotel.user.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kangjaesu.hotel.user.dao.mapper.UserMapper;
import kangjaesu.hotel.user.domain.User;

@Repository
public class UserDaoImpl implements UserDao{
	@Autowired private UserMapper mapper = null;
	
	@Override
	public User loginUser(User user) {
		return mapper.loginUser(user);
	}

	@Override
	public List<User> findId(User user) {
		return mapper.findId(user);
	}

	@Override
	public User findPw(User user) {
		return mapper.findPw(user);
	}
	
	@Override
	public List<User> getUsers() {
		return mapper.getUsers();
	}

	@Override
	public User getUser(User user){
		return mapper.getUser(user);
	}
	
	@Override
	public int addUser(User user) {
		return mapper.addUser(user);
	}

	
//
//	@Override
//	public int updateUser(User user) {
//		return mapper.updateUser(user);
//	}
//
//	@Override
//	public int delUser(int userNo) {
//		return mapper.delUser(userNo);
//	}

	
}
