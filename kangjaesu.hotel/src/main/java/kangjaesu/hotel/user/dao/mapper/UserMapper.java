package kangjaesu.hotel.user.dao.mapper;

import java.util.List;

import kangjaesu.hotel.user.domain.User;

public interface UserMapper {
	User loginUser(User user);
	List<User> findId(User user);
	User findPw(User user);
	
	List<User> getUsers();
	List<User> searchUser(User user);
	User getUser(User user);
	int addUser(User user);
	//int updateUser(User user);
	//int delUser(int userNo);
}
