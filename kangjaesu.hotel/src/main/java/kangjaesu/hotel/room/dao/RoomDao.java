package kangjaesu.hotel.room.dao;

import java.util.List;

import kangjaesu.hotel.room.domain.Room;


public interface RoomDao {
	List<Room> getRooms();
	int addRoom(Room room);
}
