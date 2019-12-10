package kangjaesu.hotel.room.dao;

import java.util.List;

import kangjaesu.hotel.room.domain.Option;
import kangjaesu.hotel.room.domain.Room;


public interface RoomDao {
	List<Room> getRooms();
	Room getRoom(int roomNum);
	int addRoom(Room room);
	int addOption(Option option);
	int delRoom(int roomNum);
	
}
