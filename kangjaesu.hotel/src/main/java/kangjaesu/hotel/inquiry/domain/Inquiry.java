package kangjaesu.hotel.inquiry.domain;

import java.sql.Date;

public class Inquiry {
/*	-- 문의
	CREATE TABLE "INQUIRYS" (
		"INQ_NUM"     NUMBER        NOT NULL, -- 문의번호
		"INQ_TITLE"   VARCHAR2(50)  NULL,     -- 문의제목
		"INQ_CONTENT" VARCHAR2(255) NULL,     -- 문의내용
		"INQ_DATE"    DATE          NULL,     -- 문의작성일
		"INQ_WRITER"  VARCHAR2(50)  NULL,     -- 문의작성자
		"INQ_EMAIL"   VARCHAR2(255) NULL,     -- 작성자이메일
		"INQ_PHONE"   VARCHAR2(12)  NULL,     -- 작성자연락처
		"STATUS"      NUMBER        NULL,     -- 처리상태
		"USER_NUM"    NUMBER        NULL      -- 회원번호
	);*/
	
	private int inqNum;
	private String inqTitle;
	private String inqContent;
	private Date inqDate;
	private String inqWriter;
	private String inqEmail;
	private String inqPhone;
	private int status;
	private String userNum;
	
	public int getInqNum() {
		return inqNum;
	}
	public void setInqNum(int inqNum) {
		this.inqNum = inqNum;
	}
	public String getInqTitle() {
		return inqTitle;
	}
	public void setInqTitle(String inqTitle) {
		this.inqTitle = inqTitle;
	}
	public String getInqContent() {
		return inqContent;
	}
	public void setInqContent(String inqContent) {
		this.inqContent = inqContent;
	}
	public Date getInqDate() {
		return inqDate;
	}
	public void setInqDate(Date inqDate) {
		this.inqDate = inqDate;
	}
	public String getInqWriter() {
		return inqWriter;
	}
	public void setInqWriter(String inqWriter) {
		this.inqWriter = inqWriter;
	}
	public String getInqEmail() {
		return inqEmail;
	}
	public void setInqEmail(String inqEmail) {
		this.inqEmail = inqEmail;
	}
	public String getInqPhone() {
		return inqPhone;
	}
	public void setInqPhone(String inqPhone) {
		this.inqPhone = inqPhone;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getUserNum() {
		return userNum;
	}
	public void setUserNum(String userNum) {
		this.userNum = userNum;
	}
	
	@Override
	public String toString() {
		return "Inquiry [inqNum=" + inqNum + ", inqTitle=" + inqTitle
				+ ", inqContent=" + inqContent + ", inqDate=" + inqDate
				+ ", inqWriter=" + inqWriter + ", inqEmail=" + inqEmail
				+ ", inqPhone=" + inqPhone + ", status=" + status
				+ ", userNum=" + userNum + "]";
	}
}
