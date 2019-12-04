package kangjaesu.hotel.room.dao;

import java.util.List;

import kangjaesu.hotel.room.dao.mapper.RoomMapper;
import kangjaesu.hotel.room.domain.Room;




import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class RoomDaoImpl implements RoomDao{
	@Autowired private RoomMapper mapper = null;
	
	@Override
	public int addRoom(Room room) {
		
		return mapper.addRoom(room);
	}

	@Override
	public List<Room> getRooms() {
		return mapper.getRooms();
	}

	

	
}
