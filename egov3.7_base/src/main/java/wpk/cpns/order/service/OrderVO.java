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
public class OrderVO extends CommonVO{
	
	private static final long serialVersionUID = 3640820362821490939L;
	
	/** 주문 일련번호 */
	private String orderSeq = "";

	/** 주문명 */
	private String productNm = "";

	/** 주차장코드 */
	private String parkCd = "";

	/** 주차장명 */
	private String parkNm = "";

	/** 입주사 일련번호 */
	private String custSeq = "";

	/** 입주사명 */
	private String custNm = "";

	/** 쿠폰구분 */
	private String cpnType = "";

	/** 주문금액 */
	private String orderAmount = "";

	/** 주문상태 */
	private String orderState = "";

	/** 주문상태명 */
	private String orderStateNm = "";

	/** 결제방법 */
	private String payType = "";

	/** 결제방법명 */
	private String payTypeNm = "";

	/** 주문일 */
	private String orderDt = "";

	/** 접수자ID */
	private String chargeId = "";

	/** 접수자명 */
	private String chargeNm = "";

	/** 배송지 주소 */
	private String shippingAddr = "";

	/** 수령인명 */
	private String receiverNm = "";

	/** 수령인 연락처 */
	private String receiverTelNo = "";

	/** 취소여부 */
	private String cancelYn = "";

	/** 취소일 */
	private String cancelDt = "";

	/** 메모 */
	private String remark = "";

	/** 주문상세 */
	private List<OrderDetailVO> orderDetail;

	/** 주문처리결과 */
	private String bDBProc = "";

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
	 * @return the productNm
	 */
	public String getProductNm() {
		return productNm;
	}

	/**
	 * @param productNm the productNm to set
	 */
	public void setProductNm(String productNm) {
		this.productNm = productNm;
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
	 * @return the custNm
	 */
	public String getCustNm() {
		return custNm;
	}

	/**
	 * @param custNm the custNm to set
	 */
	public void setCustNm(String custNm) {
		this.custNm = custNm;
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
	 * @return the orderAmount
	 */
	public String getOrderAmount() {
		return orderAmount;
	}

	/**
	 * @param orderAmount the orderAmount to set
	 */
	public void setOrderAmount(String orderAmount) {
		this.orderAmount = orderAmount;
	}

	/**
	 * @return the orderState
	 */
	public String getOrderState() {
		return orderState;
	}

	/**
	 * @param orderState the orderState to set
	 */
	public void setOrderState(String orderState) {
		this.orderState = orderState;
	}

	/**
	 * @return the orderStateNm
	 */
	public String getOrderStateNm() {
		return orderStateNm;
	}

	/**
	 * @param orderStateNm the orderStateNm to set
	 */
	public void setOrderStateNm(String orderStateNm) {
		this.orderStateNm = orderStateNm;
	}

	/**
	 * @return the payType
	 */
	public String getPayType() {
		return payType;
	}

	/**
	 * @param payType the payType to set
	 */
	public void setPayType(String payType) {
		this.payType = payType;
	}

	/**
	 * @return the payTypeNm
	 */
	public String getPayTypeNm() {
		return payTypeNm;
	}

	/**
	 * @param payTypeNm the payTypeNm to set
	 */
	public void setPayTypeNm(String payTypeNm) {
		this.payTypeNm = payTypeNm;
	}

	/**
	 * @return the orderDt
	 */
	public String getOrderDt() {
		return orderDt;
	}

	/**
	 * @param orderDt the orderDt to set
	 */
	public void setOrderDt(String orderDt) {
		this.orderDt = orderDt;
	}

	/**
	 * @return the chargeId
	 */
	public String getChargeId() {
		return chargeId;
	}

	/**
	 * @param chargeId the chargeId to set
	 */
	public void setChargeId(String chargeId) {
		this.chargeId = chargeId;
	}

	/**
	 * @return the chargeNm
	 */
	public String getChargeNm() {
		return chargeNm;
	}

	/**
	 * @param chargeNm the chargeNm to set
	 */
	public void setChargeNm(String chargeNm) {
		this.chargeNm = chargeNm;
	}

	/**
	 * @return the shippingAddr
	 */
	public String getShippingAddr() {
		return shippingAddr;
	}

	/**
	 * @param shippingAddr the shippingAddr to set
	 */
	public void setShippingAddr(String shippingAddr) {
		this.shippingAddr = shippingAddr;
	}

	/**
	 * @return the receiverNm
	 */
	public String getReceiverNm() {
		return receiverNm;
	}

	/**
	 * @param receiverNm the receiverNm to set
	 */
	public void setReceiverNm(String receiverNm) {
		this.receiverNm = receiverNm;
	}

	/**
	 * @return the receiverTelNo
	 */
	public String getReceiverTelNo() {
		return receiverTelNo;
	}

	/**
	 * @param receiverTelNo the receiverTelNo to set
	 */
	public void setReceiverTelNo(String receiverTelNo) {
		this.receiverTelNo = receiverTelNo;
	}

	/**
	 * @return the cancelYn
	 */
	public String getCancelYn() {
		return cancelYn;
	}

	/**
	 * @param cancelYn the cancelYn to set
	 */
	public void setCancelYn(String cancelYn) {
		this.cancelYn = cancelYn;
	}

	/**
	 * @return the cancelDt
	 */
	public String getCancelDt() {
		return cancelDt;
	}

	/**
	 * @param cancelDt the cancelDt to set
	 */
	public void setCancelDt(String cancelDt) {
		this.cancelDt = cancelDt;
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
	 * @return the orderDetail
	 */
	public List<OrderDetailVO> getOrderDetail() {
		return orderDetail;
	}

	/**
	 * @param orderDetail the orderDetail to set
	 */
	public void setOrderDetail(List<OrderDetailVO> orderDetail) {
		this.orderDetail = orderDetail;
	}

	/**
	 * @return the bDBProc
	 */
	public String getbDBProc() {
		return bDBProc;
	}

	/**
	 * @param bDBProc the bDBProc to set
	 */
	public void setbDBProc(String bDBProc) {
		this.bDBProc = bDBProc;
	}

}