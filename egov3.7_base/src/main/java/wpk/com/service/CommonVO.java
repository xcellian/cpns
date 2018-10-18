package wpk.com.service;

import java.sql.Timestamp;

public class CommonVO{
	
	/** 사용유무 */
	private String useYn;
	
	/** 등록일 */
	private String regDt;
	
	/** 등록자ID */
	private String regId;
	
	/** 변경일 */
	private String updtDt;
	
	/** 변경자ID */
	private String updtId;
	
	/**
	 * @return the useYn
	 */
	public String getUseYn() {
		return useYn;
	}
	
	/**
	 * @param useYn the useYn to set
	 */
	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}
	
	/**
	 * @return the regDt
	 */
	public String getRegDt() {
		return regDt;
	}
	
	/**
	 * @param regDt the regDt to set
	 */
	public void setRegDt(String regDt) {
		this.regDt = regDt;
	}
	
	/**
	 * @return the regId
	 */
	public String getRegId() {
		return regId;
	}
	
	/**
	 * @param regId the regId to set
	 */
	public void setRegId(String regId) {
		this.regId = regId;
	}
	
	/**
	 * @return the updtDt
	 */
	public String getUpdtDt() {
		return updtDt;
	}
	
	/**
	 * @param updtDt the updtDt to set
	 */
	public void setUpdtDt(String updtDt) {
		this.updtDt = updtDt;
	}
	
	/**
	 * @return the updtId
	 */
	public String getUpdtId() {
		return updtId;
	}
	
	/**
	 * @param updtId the updtId to set
	 */
	public void setUpdtId(String updtId) {
		this.updtId = updtId;
	}
}