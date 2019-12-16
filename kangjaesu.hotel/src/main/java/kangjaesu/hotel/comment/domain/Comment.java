package kangjaesu.hotel.comment.domain;

import java.sql.Date;

public class Comment {
/*	-- 후기

-- 후기
CREATE TABLE "REVIEWS" (
	"REV_NUM"     NUMBER         NOT NULL, -- 후기번호
	"USER_NUM"    NUMBER         NULL,     -- 회원번호
	"REV_TITLE"   VARCHAR2(200)  NULL,     -- 후기제목
	"REV_CONTENT" VARCHAR2(4000) NULL,     -- 후기내용
	"ROOM_TYPE"   VARCHAR2(50)   NULL,     -- 방타입
	"RATE"        DATE           NULL,     -- 후기작성일
	"REV_DATE"    NUMBER         NULL,     -- 평점
	"REV_PIC"     VARCHAR2(255)  NULL,     -- 사진1
	"REV_PIC2"    VARCHAR2(255)  NULL,     -- 사진2
	"REV_PIC3"    VARCHAR2(255)  NULL      -- 사진3
	REV_NUM     NOT NULL NUMBER         
USER_NUM             NUMBER         
REV_TITLE            VARCHAR2(200)  
REV_CONTENT          VARCHAR2(4000) 
ROOM_TYPE            VARCHAR2(50)   
RATE                 NUMBER         
REV_DATE             DATE           
REV_PIC              VARCHAR2(255)  
REV_PIC2             VARCHAR2(255)  
REV_PIC3             VARCHAR2(255)  
);
	);*/
	
	private int revNum;
	private int userNum;
	private String revTitle;
	private String revContent;
	private String roomType;
	private Date revDate;
	private int rate;
	private String revPic;
	private String revPic2;
	private String revPic3;
	
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
	

	public Date getRevDate() {
		return revDate;
	}
	public void setRevDate(Date revDate) {
		this.revDate = revDate;
	}
	public int getRate() {
		return rate;
	}
	public void setRate(int rate) {
		this.rate = rate;
	}
	public String getRevPic() {
		return revPic;
	}
	public void setRevPic(String revPic) {
		this.revPic = revPic;
	}
	public String getRevPic2() {
		return revPic2;
	}
	public void setRevPic2(String revPic2) {
		this.revPic2 = revPic2;
	}
	public String getRevPic3() {
		return revPic3;
	}
	public void setRevPic3(String revPic3) {
		this.revPic3 = revPic3;
	}
	@Override
	public String toString() {
		return String.format("Comment [revNum=%s, uesrNum=%s, revTitle=%s, revContent=%s, roomType=%s, revDate=%s,rate=%s,revPic=%s,revPic2=%s,revPic3=%s ]", 
				revNum, userNum, revTitle,revContent , roomType, revDate,rate ,revPic,revPic2,revPic3 ); 
	
	}
	
	
}
