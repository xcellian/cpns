package wpk.cpns.cpn.service;

import wpk.com.service.CommonVO;

/**
 * 업무사용자VO클래스로서 업무사용자관리 비지니스로직 처리용 항목을 구성한다.
 * @author 공통서비스 개발팀 조재영
 * @since 2009.04.10
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2009.04.10  조재영          최초 생성
 *   2017.07.21  장동한 			로그인인증제한 작업
 *
 * </pre>
 */
public class CouponVO extends CommonVO{
	
	private static final long serialVersionUID = 3640820362821490939L;
	
	/** rownumber */
	private String rowNum;
	
	/** 주차장 코드 */
	private String parkCd;
	
	/** 주차장 명 */
	private String parkNm;
	
	/** 쿠폰/할인키 일련번호 */
	private String cpnSeq;
	
	/** 쿠폰/할인키 코드 */
	private String cpnCd;
	
	/** 쿠폰/할인키 명 */
	private String cpnNm;
	
	/** 단가 */
	private int price;
	
	/** 쿠폰/할인키 구분 */
	private String cpnType;
	
	/** 메모 */
	private String remark;
	
	/** 선택가능여부 */
	private String isUsed;
	
	/**
	 * @return the rowNum
	 */
	public String getRowNum() {
		return rowNum;
	}
	
	/**
	 * @param rowNum the rowNum to set
	 */
	public void setRowNum(String rowNum) {
		this.rowNum = rowNum;
	}
	
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
	 * @return the cpnSeq
	 */
	public String getCpnSeq() {
		return cpnSeq;
	}
	
	/**
	 * @param cpnSeq the cpnSeq to set
	 */
	public void setCpnSeq(String cpnSeq) {
		this.cpnSeq = cpnSeq;
	}
	
	/**
	 * @return the cpnCd
	 */
	public String getCpnCd() {
		return cpnCd;
	}
	
	/**
	 * @param cpnCd the cpnCd to set
	 */
	public void setCpnCd(String cpnCd) {
		this.cpnCd = cpnCd;
	}
	
	/**
	 * @return the cpnNm
	 */
	public String getCpnNm() {
		return cpnNm;
	}
	
	/**
	 * @param cpnNm the cpnNm to set
	 */
	public void setCpnNm(String cpnNm) {
		this.cpnNm = cpnNm;
	}
	
	/**
	 * @return the price
	 */
	public int getPrice() {
		return price;
	}
	
	/**
	 * @param price the price to set
	 */
	public void setPrice(int price) {
		this.price = price;
	}
	
	/**
	 * @return the cpnType
	 */
	public String getCpnType() {
		return cpnType;
	}
	
	/**
	 * @param cpnType the cpnType to set
	 */
	public void setCpnType(String cpnType) {
		this.cpnType = cpnType;
	}
	
	/**
	 * @return the remark
	 */
	public String getRemark() {
		return remark;
	}
	
	/**
	 * @param remark the remark to set
	 */
	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	/**
	 * @return the isUsed
	 */
	public String getIsUsed() {
		return isUsed;
	}
	
	/**
	 * @param isUsed the isUsed to set
	 */
	public void setIsUsed(String isUsed) {
		this.isUsed = isUsed;
	}
}