package kangjaesu.hotel.room.domain;

public class Option {
	/*
	-- 옵션
	CREATE TABLE "OPTIONS" (
	"OPT_NO"   NUMBER       NOT NULL, -- 옵션번호
	"OPT_NAME" VARCHAR2(50) NOT NULL  -- 옵션내용
	
*/
	private int optNo;
	private String optName;
	
	public int getOptNo() {
		return optNo;
	}
	public void setOptNo(int optNo) {
		this.optNo = optNo;
	}
	public String getOptName() {
		return optName;
	}
	public void setOptName(String optName) {
		this.optName = optName;
	}
	@Override
	public String toString() {
		return String.format("option [optNo=%s, optName=%s]", optNo, optName);

	}
	
	


}
