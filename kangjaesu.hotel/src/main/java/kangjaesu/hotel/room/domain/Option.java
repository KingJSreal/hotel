package kangjaesu.hotel.room.domain;

public class Option {
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
