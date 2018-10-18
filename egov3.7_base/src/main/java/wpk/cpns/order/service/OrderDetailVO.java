package wpk.cpns.order.service;

import java.util.List;

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
public class OrderDetailVO extends CommonVO{
	
	private static final long serialVersionUID = 3640820362821490939L;
	
	/** 주문 일련번호 */
	private String orderSeq = "";
	
	/** 입주사 일련번호 */
	private String custSeq = "";
	
	/** 쿠폰 일련번호 */
	private String cpnSeq = "";
	
	/** 쿠폰 코드 */
	private String cpnCd = "";
	
	/** 쿠폰명 */
	private String cpnNm = "";
	
	/** 구매수량 */
	private String qty = "";
	
	/** 단가 */
	private String price = "";
	
	/** 구매금액 */
	private String amount = "";

	/**
	 * @return the orderSeq
	 */
	public String getOrderSeq() {
		return orderSeq;
	}

	/**
	 * @param orderSeq the orderSeq to set
	 */
	public void setOrderSeq(String orderSeq) {
		this.orderSeq = orderSeq;
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
	 * @return the qty
	 */
	public String getQty() {
		return qty;
	}

	/**
	 * @param qty the qty to set
	 */
	public void setQty(String qty) {
		this.qty = qty;
	}

	/**
	 * @return the price
	 */
	public String getPrice() {
		return price;
	}

	/**
	 * @param price the price to set
	 */
	public void setPrice(String price) {
		this.price = price;
	}

	/**
	 * @return the amount
	 */
	public String getAmount() {
		return amount;
	}

	/**
	 * @param amount the amount to set
	 */
	public void setAmount(String amount) {
		this.amount = amount;
	}
	
}