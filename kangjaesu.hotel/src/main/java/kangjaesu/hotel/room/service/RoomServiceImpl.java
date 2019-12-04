package kangjaesu.hotel.room.service;

import java.util.List;

import kangjaesu.hotel.room.dao.RoomDao;
import kangjaesu.hotel.room.domain.Room;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class RoomServiceImpl implements RoomService{
	@Autowired private RoomDao roomDao;
	
	@Transactional
	public boolean join(Room room) {
		return roomDao.addRoom(room)>0;
	}

	@Transactional
	public List<Room> getRooms() {
		return roomDao.getRooms();
	}

}
