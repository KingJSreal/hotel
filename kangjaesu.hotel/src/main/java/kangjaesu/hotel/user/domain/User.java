package kangjaesu.hotel.user.domain;

import java.sql.Date;

public class User {
	/*

	1"USER_NUM"       NUMBER        NOT NULL, -- 회원번호
	1"USER_EMAIL"     VARCHAR2(255) NULL,     -- 이메일
	1"USER_PWD"       VARCHAR2(50)  NULL,     -- 비밀번호
	1"USER_KORNAME"   VARCHAR2(50)  NULL,     -- 한글이름
	1"USER_LASTNAME"  VARCHAR2(50)  NULL,     -- 영문성
	1"USER_FIRSTNAME" VARCHAR2(50)  NULL,     -- 영문이름
	1"USER_BIRTH"     DATE          NULL,     -- 생년월일
	1"USER_PHONE"     NUMBER        NULL,     -- 핸드폰번호
	1"TEL"            VARCHAR2(12)  NULL,     -- 자택전화번호
	"ZIP"            NUMBER        NULL,     -- 우편번호
	"ADD"            VARCHAR2(255) NULL,     -- 주소
	"ADD_DETAIL"     VARCHAR2(255) NULL,     -- 상세주소
	1"USER_REG_DATE"  DATE          NULL,     -- 회원등록일
	1"GRADE"          NUMBER        NULL      -- 등급
	*/
	
	private int userNum;
	private String userEmail;
	private String userPassword;
	private String userName;
	private String userEngFirstName;
	private String userEngLastName;
	private Date userBirth;
	private String userPhone;
	private String userTel;
	private String userZip;
	private String userAdd;
	private String userAddDetail;
	private Date userRegDate;
	private int userGrade;
	
	public int getUserNum() {
		return userNum;
	}
	public void setUserNum(int userNum) {
		this.userNum = userNum;
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
	public int getUserGrade() {
		return userGrade;
	}
	public void setUserGrade(int userGrade) {
		this.userGrade = userGrade;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
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
	public Date getUserBirth() {
		return userBirth;
	}
	public void setUserBirth(Date userBirth) {
		this.userBirth = userBirth;
	}
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	public String getUserTel() {
		return userTel;
	}
	public void setUserTel(String userTel) {
		this.userTel = userTel;
	}
	public String getUserZip() {
		return userZip;
	}
	public void setUserZip(String userZip) {
		this.userZip = userZip;
	}
	public String getUserAdd() {
		return userAdd;
	}
	public void setUserAdd(String userAdd) {
		this.userAdd = userAdd;
	}
	public String getUserAddDetail() {
		return userAddDetail;
	}
	public void setUserAddDetail(String userAddDetail) {
		this.userAddDetail = userAddDetail;
	}
	
	@Override
	public String toString() {
		return String
				.format("User [userNum=%s, userRegDate=%s, userEmail=%s, userGrade=%s, userPassword=%s, userName=%s, userEngFirstName=%s, userEngLastName=%s, userBirth=%s, userPhone=%s, userTel=%s, userZip=%s, userAdd=%s, userAddDetail=%s]",
						userNum, userRegDate, userEmail, userGrade,
						userPassword, userName, userEngFirstName,
						userEngLastName, userBirth, userPhone, userTel,
						userZip, userAdd, userAddDetail);
	}
}
