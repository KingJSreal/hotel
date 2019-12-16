package kangjaesu.hotel.room.service;

import java.util.List;

import kangjaesu.hotel.room.dao.RoomDao;
import kangjaesu.hotel.room.domain.Option;
import kangjaesu.hotel.room.domain.Room;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class RoomServiceImpl implements RoomService{
	@Autowired private RoomDao roomDao;
	
/*	@Transactional
	public boolean join(Room room) {
		return roomDao.addRoom(room)>0;
	}*/

	@Transactional
	public List<Room> getRooms() {
		return roomDao.getRooms();
	}

	@Override
	public boolean delRoom(int roomNum) {
		return roomDao.delRoom(roomNum)>0;
	}

	@Override
	public Room getRoom(int roomNum) {
		return roomDao.getRoom(roomNum);
	}

	@Override
	public boolean join(Room room, List<Option> options) {
		int length = 1 + options.size();
		int a =  roomDao.addRoom(room);
		int cnt = 0;
		for(Option option:options){
			cnt += roomDao.addOption(option);
	
		}
		return (a + cnt) > (length -1 );
	
	}

	@Override
	public boolean updateRoom(Room room) {
		return roomDao.updateRoom(room)>0;
	}



}
