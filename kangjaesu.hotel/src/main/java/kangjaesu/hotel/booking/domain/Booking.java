package kangjaesu.hotel.booking.domain;

import java.sql.Date;
public class Booking {
	private int bookingNum;
	private int userNum;
	private int roomNum;
	private Date checkIn;
	private Date checkOut;
	private String paytype;
	private int payment;
	private int adult;
	private int kid;
	
	public int getBookingNum() {
		return bookingNum;
	}
	public void setBookingNum(int bookingNum) {
		this.bookingNum = bookingNum;
	}
	public int getUserNum() {
		return userNum;
	}
	public void setUserNum(int userNum) {
		this.userNum = userNum;
	}
	public int getRoomNum() {
		return roomNum;
	}
	public void setRoomNum(int roomNum) {
		this.roomNum = roomNum;
	}
	public Date getCheckIn() {
		return checkIn;
	}
	public void setCheckIn(Date checkIn) {
		this.checkIn = checkIn;
	}
	public Date getCheckOut() {
		return checkOut;
	}
	public void setCheckOut(Date checkOut) {
		this.checkOut = checkOut;
	}
	public String getPaytype() {
		return paytype;
	}
	public void setPaytype(String paytype) {
		this.paytype = paytype;
	}
	public int getPayment() {
		return payment;
	}
	public void setPayment(int payment) {
		this.payment = payment;
	}
	public int getAdult() {
		return adult;
	}
	public void setAdult(int adult) {
		this.adult = adult;
	}
	public int getKid() {
		return kid;
	}
	public void setKid(int kid) {
		this.kid = kid;
	}
	
	@Override
	public String toString() {
		return "Inquiry [bookingNum=" + bookingNum + ", userNum=" + userNum
				+ ", roomNum=" + roomNum + ", checkIn=" + checkIn
				+ ", checkOut=" + checkOut + ", paytype=" + paytype
				+ ", payment=" + payment + ", adult=" + adult + ", kid=" + kid
				+ "]";
	}
}
