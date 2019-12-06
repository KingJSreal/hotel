package kangjaesu.hotel.promotion.domain;

import java.sql.Date;

public class Promotion {
	private int proNum;
	private String proTitle;
	private String proContent;
	private Date proStartDate;
	private Date proEndDate;
	private String proDetail;
	private Date proRegDate;
	
	public int getProNum() {
		return proNum;
	}
	public void setProNum(int proNum) {
		this.proNum = proNum;
	}
	public String getProTitle() {
		return proTitle;
	}
	public void setProTitle(String proTitle) {
		this.proTitle = proTitle;
	}
	public String getProContent() {
		return proContent;
	}
	public void setProContent(String proContent) {
		this.proContent = proContent;
	}
	public Date getProStartDate() {
		return proStartDate;
	}
	public void setProStartDate(Date proStartDate) {
		this.proStartDate = proStartDate;
	}
	public Date getProEndDate() {
		return proEndDate;
	}
	public void setProEndDate(Date proEndDate) {
		this.proEndDate = proEndDate;
	}
	public String getProDetail() {
		return proDetail;
	}
	public void setProDetail(String proDetail) {
		this.proDetail = proDetail;
	}
	public Date getProRegDate() {
		return proRegDate;
	}
	public void setProRegDate(Date proRegDate) {
		this.proRegDate = proRegDate;
	}

	@Override
	public String toString() {
		return "Promotion [proNum=" + proNum + ", proTitle=" + proTitle
				+ ", proContent=" + proContent + ", proStartDate="
				+ proStartDate + ", proEndDate=" + proEndDate + ", proDetail="
				+ proDetail + ", proRegDate=" + proRegDate + "]";
	}
	
}
