package kangjaesu.hotel.user.service;

import java.util.List;

import kangjaesu.hotel.user.domain.User;

public interface UserService {
	List<User> listUsers();
	List<User> searchListUsers(User user);
	User getUser(User user);
	boolean join(User user);
	//boolean cerrectUser(User user);
	//boolean secede(int userNo);
}
