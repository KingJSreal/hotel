package kangjaesu.hotel.room.domain;

import java.sql.Date;

public class Room {
	/*
	 * -- 객실정보
	CREATE TABLE "ROOMS" (
	"ROOM_NUM"      NUMBER        NOT NULL, -- 객실번호
	"ROOM_NAME"     VARCHAR2(50)  NULL,     -- 객실이름
	"GUESTS"        NUMBER        NULL,     -- 투숙인원
	"ROOM_REG_DATE" DATE          NULL,     -- 객실등록일
	"ROOM_CONTENT"  VARCHAR2(255) NULL,     -- 상세내용
	"ROOM_TYPE"     VARCHAR2(50)  NULL,     -- 객실타입
	"ROOM_PRICE"    NUMBER        NULL      -- 금액
);
	-- 옵션
	CREATE TABLE "OPTIONS" (
	"OPT_NO"   NUMBER       NOT NULL, -- 옵션번호
	"OPT_NAME" VARCHAR2(50) NOT NULL  -- 옵션내용
);
	-- 옵션포함
	CREATE TABLE "ROOMOPTIONS" (
	"ROOM_NUM" NUMBER NOT NULL, -- 객실번호
	"OPT_NO"   NUMBER NOT NULL  -- 옵션번호
);
*/
	private int roomNum;
	private String roomName;
	private int guests;
	private Date roomRegDate;
	private String roomContent;
	private String roomType;
	private int roomPrice;
	private String roomImage1;
	private String roomImage2;
	private String roomImage3;
	
	private int optNo;
	private String optName;
	
	public int getRoomNum() {
		return roomNum;
	}
	public void setRoomNum(int roomNum) {
		this.roomNum = roomNum;
	}
	public String getRoomName() {
		return roomName;
	}
	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}
	public int getGuests() {
		return guests;
	}
	public void setGuests(int guests) {
		this.guests = guests;
	}
	public Date getRoomRegDate() {
		return roomRegDate;
	}
	public void setRoomRegDate(Date roomRegDate) {
		this.roomRegDate = roomRegDate;
	}
	public String getRoomContent() {
		return roomContent;
	}
	public void setRoomContent(String roomContent) {
		this.roomContent = roomContent;
	}
	public String getRoomType() {
		return roomType;
	}
	public void setRoomType(String roomType) {
		this.roomType = roomType;
	}
	public int getRoomPrice() {
		return roomPrice;
	}
	public void setRoomPrice(int roomPrice) {
		this.roomPrice = roomPrice;
	}
	
	
	public String getRoomImage1() {
		return roomImage1;
	}
	public void setRoomImage1(String roomImage1) {
		this.roomImage1 = roomImage1;
	}
	public String getRoomImage2() {
		return roomImage2;
	}
	public void setRoomImage2(String roomImage2) {
		this.roomImage2 = roomImage2;
	}
	public String getRoomImage3() {
		return roomImage3;
	}
	public void setRoomImage3(String roomImage3) {
		this.roomImage3 = roomImage3;
	}
	public int getOptNo() {
		return optNo;
	}
	public void setOptNo(int optNo) {
		this.optNo = optNo;
	}
	public String getOptName() {
		return optName;
	}
	public void setOptName(String optName) {
		this.optName = optName;
	}
	@Override
	public String toString() {
		return String.format("Room [roomNum=%s, roomName=%s, guests=%s, roomRegDate=%s, roomContent=%s, roomType=%s, roomPrice=%s,roomImage1=%s,roomImage2=%s,roomImage3=%s, optNo=%s, optNmae=%s ]", 
				roomNum, roomName, guests, roomRegDate, roomContent, roomType, roomPrice,roomImage1,roomImage2,roomImage3, optNo, optName  ); 
	}
	
	
}
