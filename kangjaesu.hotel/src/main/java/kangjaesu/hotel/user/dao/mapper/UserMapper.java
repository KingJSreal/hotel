package kangjaesu.hotel.user.dao.mapper;

import java.util.List;

import kangjaesu.hotel.user.domain.User;

public interface UserMapper {
	User loginUser(User user);
	List<User> getUsers();
	User getUser(User user);
	int addUser(User user);
	//int updateUser(User user);
	//int delUser(int userNo);
}
