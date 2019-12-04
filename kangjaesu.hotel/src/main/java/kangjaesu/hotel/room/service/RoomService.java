package kangjaesu.hotel.room.service;

import java.util.List;

import kangjaesu.hotel.room.domain.Room;

public interface RoomService {
	List<Room> getRooms();
	boolean join(Room room);
	
}
