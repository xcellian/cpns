package wpk.com.service;

public class ParkMasterVO extends CommonVO{
	
	/** 주차장 코드 */
	private String parkCd;
	
	/** 주차명장 */
	private String parkNm;
	
	/** ACS 타입 */
	private String acsType;
	
	/** 메모 */
	private String reamark;
	
	/**
	 * @return the parkCd
	 */
	public String getParkCd() {
		return parkCd;
	}
	
	/**
	 * @param parkCd the parkCd to set
	 */
	public void setParkCd(String parkCd) {
		this.parkCd = parkCd;
	}
	
	/**
	 * @return the parkNm
	 */
	public String getParkNm() {
		return parkNm;
	}
	
	/**
	 * @param parkNm the parkNm to set
	 */
	public void setParkNm(String parkNm) {
		this.parkNm = parkNm;
	}
	
	/**
	 * @return the acsType
	 */
	public String getAcsType() {
		return acsType;
	}
	
	/**
	 * @param acsType the acsType to set
	 */
	public void setAcsType(String acsType) {
		this.acsType = acsType;
	}
	
	/**
	 * @return the reamark
	 */
	public String getReamark() {
		return reamark;
	}
	
	/**
	 * @param reamark the reamark to set
	 */
	public void setReamark(String reamark) {
		this.reamark = reamark;
	}
}