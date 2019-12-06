package kangjaesu.hotel.inquiry.domain;

public class InquiryComment {
/* -- 문의답변
	TABLE "INQUIRYS_CMT" (
		"INQ_NUM"         NUMBER         NOT NULL, -- 문의번호
		"INQ_CMT_CONTENT" VARCHAR2(1000) NULL,     -- 답변내용
		"INQ_CMT_DATE"    DATE           NULL      -- 답변일
	);*/
	
	private int inqNum;
	private String inqCmtContent;
	private String inqCmtDate;
	
	public int getInqNum() {
		return inqNum;
	}
	public void setInqNum(int inqNum) {
		this.inqNum = inqNum;
	}
	public String getInqCmtContent() {
		return inqCmtContent;
	}
	public void setInqCmtContent(String inqCmtContent) {
		this.inqCmtContent = inqCmtContent;
	}
	public String getInqCmtDate() {
		return inqCmtDate;
	}
	public void setInqCmtDate(String inqCmtDate) {
		this.inqCmtDate = inqCmtDate;
	}
	
	@Override
	public String toString() {
		return "InquiryComment [inqNum=" + inqNum + ", inqCmtContent="
				+ inqCmtContent + ", inqCmtDate=" + inqCmtDate + "]";
	}
}
