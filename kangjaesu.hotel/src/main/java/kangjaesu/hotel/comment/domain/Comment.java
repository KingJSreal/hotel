package kangjaesu.hotel.comment.domain;

import java.sql.Date;

public class Comment {
/*	-- 후기
	CREATE TABLE "REVIEWS" (
		"REV_NUM"     NUMBER         NOT NULL, -- 후기번호
		"USER_NUM"    NUMBER         NULL,     -- 회원번호
		"REV_TITLE"   VARCHAR2(50)   NULL,     -- 후기제목
		"REV_CONTENT" VARCHAR2(1000) NULL,     -- 후기내용
		"ROOM_TYPE"   VARCHAR2(50)   NULL,     -- 방타입
		"RATE"        NUMBER         NULL,     -- 후기작성일
		"REV_DATE"    DATE           NULL,     -- 평점
		"REV_PIC"     VARCHAR2(255)  NULL      -- 사진
	);*/
	
	private int revNum;
	private int userNum;
	private String revTitle;
	private String revContent;
	private String roomType;
	private int rate;
	private Date revDate;
	
	public int getRevNum() {
		return revNum;
	}
	public void setRevNum(int revNum) {
		this.revNum = revNum;
	}
	public int getUserNum() {
		return userNum;
	}
	public void setUserNum(int userNum) {
		this.userNum = userNum;
	}
	public String getRevTitle() {
		return revTitle;
	}
	public void setRevTitle(String revTitle) {
		this.revTitle = revTitle;
	}
	public String getRevContent() {
		return revContent;
	}
	public void setRevContent(String revContent) {
		this.revContent = revContent;
	}
	public String getRoomType() {
		return roomType;
	}
	public void setRoomType(String roomType) {
		this.roomType = roomType;
	}
	public int getRate() {
		return rate;
	}
	public void setRate(int rate) {
		this.rate = rate;
	}
	public Date getRevDate() {
		return revDate;
	}
	public void setRevDate(Date revDate) {
		this.revDate = revDate;
	}
	@Override
	public String toString() {
		return String.format("Comment [revNum=%s, uesrNum=%s, revTitle=%s, revContent=%s, roomType=%s,rate=%s, revDate=%s ]", 
				revNum, userNum, revTitle,revContent , roomType, rate ,revDate ); 
	
	}
	
	
}
