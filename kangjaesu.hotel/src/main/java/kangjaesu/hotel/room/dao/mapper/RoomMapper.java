package kangjaesu.hotel.room.dao.mapper;

import java.util.List;

import kangjaesu.hotel.room.domain.Room;

public interface RoomMapper {
	List<Room> getRooms();
	int addRoom(Room room);
}