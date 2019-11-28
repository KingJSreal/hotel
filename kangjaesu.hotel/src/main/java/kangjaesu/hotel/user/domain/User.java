package kangjaesu.hotel.user.domain;

import java.sql.Date;

public class User {
	/*
	  user_no         number(5)   NOT NULL,
	  user_regdate    date        DEFAULT SYSDATE,
	  user_email      varchar(50) UNIQUE NOT NULL,
	  user_level      number(1)   DEFAULT 1,
	  user_password   varchar(30) NOT NULL,
	  user_birthDay   Date        NOT NULL;
	  user_point      number(5)   DEFAULT 0,
	  user_name       varchar(20) NOT NULL,
	  user_name_en_f  varchar(20) NOT NULL,
	  user_name_en_l  varchar(10) NOT NULL,
	  user_phone      varchar(13) NOT NULL,
	  user_call       varchar(14),
	  user_add_code   varchar(10),
	  user_add        varchar(100),
	*/
	
	private int userNo;
	private Date userRegDate;
	private String userEmail;
	private int userLevel;
	private String userPassword;
	private int userPoint;
	private String userName;
	private String userEngFirstName;
	private String userEngLastName;
	private Date userBirthDay;
	private String userPhone;
	private String userCall;
	private String userAddressCode;
	private String userAddress;
	
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public Date getUserRegDate() {
		return userRegDate;
	}
	public void setUserRegDate(Date userRegDate) {
		this.userRegDate = userRegDate;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public int getUserLevel() {
		return userLevel;
	}
	public void setUserLevel(int userLevel) {
		this.userLevel = userLevel;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public int getUserPoint() {
		return userPoint;
	}
	public void setUserPoint(int userPoint) {
		this.userPoint = userPoint;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserEngFirstName() {
		return userEngFirstName;
	}
	public void setUserEngFirstName(String userEngFirstName) {
		this.userEngFirstName = userEngFirstName;
	}
	public String getUserEngLastName() {
		return userEngLastName;
	}
	public void setUserEngLastName(String userEngLastName) {
		this.userEngLastName = userEngLastName;
	}
	public Date getUserBirthDay() {
		return userBirthDay;
	}
	public void setUserBirthDay(Date userBirthDay) {
		this.userBirthDay = userBirthDay;
	}
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	public String getUserCall() {
		return userCall;
	}
	public void setUserCall(String userCall) {
		this.userCall = userCall;
	}
	public String getUserAddressCode() {
		return userAddressCode;
	}
	public void setUserAddressCode(String userAddressCode) {
		this.userAddressCode = userAddressCode;
	}
	public String getUserAddress() {
		return userAddress;
	}
	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}
	
	@Override
	public String toString() {
		return String
				.format("User [userNo=%s, userRegDate=%s, userEmail=%s, userLevel=%s, userPassword=%s, userPoint=%s, userName=%s, userEngFirstName=%s, userEngLastName=%s, userbirthDay=%s, userPhone=%s, userCall=%s, userAddressCode=%s, userAddress=%s]",
						userNo, userRegDate, userEmail, userLevel,
						userPassword, userPoint, userName, userEngFirstName,
						userEngLastName, userBirthDay, userPhone, userCall,
						userAddressCode, userAddress);
	}
}
