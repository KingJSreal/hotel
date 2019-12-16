package kangjaesu.hotel.user.dao.mapper;

import java.util.List;

import kangjaesu.hotel.user.domain.User;
import kangjaesu.hotel.common.domain.Page;

public interface UserMapper {
	User loginUser(User user);
	List<User> findId(User user);
	User findPw(User user);
	
	List<User> getUsers(Page page);
	int countUser();
	List<User> searchUser(User user);
	User getEmail(User user);
	User getUser(User user);
	int addUser(User user);
	int updateUser(User user);
	int delUser(User user);
}
