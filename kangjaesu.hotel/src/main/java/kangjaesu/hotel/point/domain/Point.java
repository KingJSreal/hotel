package kangjaesu.hotel.point.domain;

import java.sql.Date;

public class Point {
	private int userNum;
	private Date pointDate;
	private int pointContent;
	
	public int getUserNum() {
		return userNum;
	}
	public void setUserNum(int userNum) {
		this.userNum = userNum;
	}
	public Date getPointDate() {
		return pointDate;
	}
	public void setPointDate(Date pointDate) {
		this.pointDate = pointDate;
	}
	public int getPointContents() {
		return pointContent;
	}
	public void setPointContents(int pointContent) {
		this.pointContent = pointContent;
	}
	
	@Override
	public String toString() {
		return String.format(
				"Point [userNum=%s, pointDate=%s, pointContent=%s]", userNum,
				pointDate, pointContent);
	}
}
