package kangjaesu.hotel.user.dao;

import java.util.List;

import kangjaesu.hotel.user.domain.User;
import kangjaesu.hotel.common.domain.Page;

public interface UserDao {
	User loginUser(User user);
	List<User> findId(User user);
	User findPw(User user);
	
	List<User> getUsers(Page page);
	List<User> searchUser(User user);
	int countUser();
	User getEmail(User user);
	User getUser(User user);
	int addUser(User user);
	int updateUser(User user);
	int delUser(User user);
}
