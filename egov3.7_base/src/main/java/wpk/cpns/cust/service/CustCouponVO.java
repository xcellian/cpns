package wpk.cpns.cust.service;

import wpk.com.service.ComDefaultVO;
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
public class CustCouponVO extends CommonVO{
	
	private static final long serialVersionUID = 3640820362821490939L;
	
	/** 주차장 코드 */
	private String parkCd;
	
	/** 입주사 일련번호 */
	private String custSeq;
	
	/** 쿠폰/할인키 구분 */
	private String cpnType;
	
	/** 쿠폰 일련번호 */
	private String cpnSeq;
	
	/** 쿠폰명 */
	private String cpnCd;
	
	/** 쿠폰명 */
	private String cpnNm;
	
	/** 쿠폰 최소구매수량 */
	private int qtyMin;
	
	/** 쿠폰 최대구매수량 */
	private int qtyMax;
	
	/** 판매가격 */
	private int price;
	
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
	 * @return the custSeq
	 */
	public String getCustSeq() {
		return custSeq;
	}
	
	/**
	 * @param custSeq the custSeq to set
	 */
	public void setCustSeq(String custSeq) {
		this.custSeq = custSeq;
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
	 * @return the qtyMin
	 */
	public int getQtyMin() {
		return qtyMin;
	}
	
	/**
	 * @param qtyMin the qtyMin to set
	 */
	public void setQtyMin(int qtyMin) {
		this.qtyMin = qtyMin;
	}
	
	/**
	 * @return the qtyMax
	 */
	public int getQtyMax() {
		return qtyMax;
	}
	
	/**
	 * @param qtyMax the qtyMax to set
	 */
	public void setQtyMax(int qtyMax) {
		this.qtyMax = qtyMax;
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
}