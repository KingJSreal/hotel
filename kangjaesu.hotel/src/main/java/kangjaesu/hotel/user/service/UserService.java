package kangjaesu.hotel.user.service;

import java.util.List;

import kangjaesu.hotel.common.domain.Page;
import kangjaesu.hotel.user.domain.User;

public interface UserService {
	List<User> listUsers(Page page);
	List<User> searchListUsers(User user);
	int countUsers();
	User getUser(User user);
	boolean join(User user);
	boolean cerrectUser(User user);
	boolean secede(User user);
}
