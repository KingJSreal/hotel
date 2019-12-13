package kangjaesu.hotel.point.domain;

import java.sql.Date;

public class Point {
	private int pointNum;
	private Date pointDate;
	private int pointContent;
	private int userNum;
	
	
	public int getPointNum() {
		return pointNum;
	}
	public void setPointNum(int pointNum) {
		this.pointNum = pointNum;
	}
	public Date getPointDate() {
		return pointDate;
	}
	public void setPointDate(Date pointDate) {
		this.pointDate = pointDate;
	}
	public int getPointContent() {
		return pointContent;
	}
	public void setPointContent(int pointContent) {
		this.pointContent = pointContent;
	}
	public int getUserNum() {
		return userNum;
	}
	public void setUserNum(int userNum) {
		this.userNum = userNum;
	}
	
	@Override
	public String toString() {
		return String
				.format("Point [pointNum=%s, pointDate=%s, pointContent=%s, userNum=%s]",
						pointNum, pointDate, pointContent, userNum);
	}
}
