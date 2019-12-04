package kangjaesu.hotel.user.dao;

import java.util.List;

import kangjaesu.hotel.user.domain.User;

public interface UserDao {
	User loginUser(User user);
	List<User> findId(User user);
	User findPw(User user);
	
	List<User> getUsers();
	User getUser(User user);
	int addUser(User user);
	//int updateUser(User user);
	//int delUser(int userNo);
}
