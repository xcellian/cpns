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
public class CustVO extends CommonVO{
	
	private static final long serialVersionUID = 3640820362821490939L;
	
	/** rownumber */
	private String rowNum;
	
	/** 주차장 코드 */
	private String parkCd;
	
	/** 주차장 명 */
	private String parkNm;
	
	/** 입주사 일련번호 */
	private String custSeq;
	
	/** 입주사 ID */
	private String custId;
	
	/** 비밀번호 */
	private String custPwd;
	
	/** 입주사명 */
	private String custNm;
	
	/** 사업자등록번호 */
	private String bizrno;
	
	/** 대표자명 */
	private String ownerNm;
	
	/** 담당자명 */
	private String chargeNm;
	
	/** 담당자 E-Mail */
	private String eMailAddr;
	
	/** 동 */
	private String dong;
	
	/** 호 */
	private String ho;
	
	/** 전화번호 */
	private String telNo;
	
	/** 휴대폰번호 */
	private String mobile;
	
	/** 팩스번호 */
	private String faxNo;
	
	/** 메모 */
	private String remark;
	
	/** 입주사 쿠폰 */
	private CustCouponVO[] custCpnList;
	
	/** 로그인 인증제한 */
	private String lockAt;
	
	/** 비밀번호 초기화 여부 */
	private String isReset = "false";
	
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
	 * @return the custId
	 */
	public String getCustId() {
		return custId;
	}
	
	/**
	 * @param custId the custId to set
	 */
	public void setCustId(String custId) {
		this.custId = custId;
	}
	
	/**
	 * @return the custPwd
	 */
	public String getCustPwd() {
		return custPwd;
	}
	
	/**
	 * @param custPwd the custPwd to set
	 */
	public void setCustPwd(String custPwd) {
		this.custPwd = custPwd;
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
	 * @return the bizrno
	 */
	public String getBizrno() {
		return bizrno;
	}
	
	/**
	 * @param bizrno the bizrno to set
	 */
	public void setBizrno(String bizrno) {
		this.bizrno = bizrno;
	}
	
	/**
	 * @return the ownerNm
	 */
	public String getOwnerNm() {
		return ownerNm;
	}
	
	/**
	 * @param ownerNm the ownerNm to set
	 */
	public void setOwnerNm(String ownerNm) {
		this.ownerNm = ownerNm;
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
	 * @return the eMailAddr
	 */
	public String geteMailAddr() {
		return eMailAddr;
	}
	
	/**
	 * @param eMailAddr the eMailAddr to set
	 */
	public void seteMailAddr(String eMailAddr) {
		this.eMailAddr = eMailAddr;
	}
	
	/**
	 * @return the dong
	 */
	public String getDong() {
		return dong;
	}
	
	/**
	 * @param dong the dong to set
	 */
	public void setDong(String dong) {
		this.dong = dong;
	}
	
	/**
	 * @return the ho
	 */
	public String getHo() {
		return ho;
	}
	
	/**
	 * @param ho the ho to set
	 */
	public void setHo(String ho) {
		this.ho = ho;
	}
	
	/**
	 * @return the telNo
	 */
	public String getTelNo() {
		return telNo;
	}
	
	/**
	 * @param telNo the telNo to set
	 */
	public void setTelNo(String telNo) {
		this.telNo = telNo;
	}
	
	/**
	 * @return the mobile
	 */
	public String getMobile() {
		return mobile;
	}
	
	/**
	 * @param mobile the mobile to set
	 */
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	
	/**
	 * @return the faxNo
	 */
	public String getFaxNo() {
		return faxNo;
	}
	
	/**
	 * @param faxNo the faxNo to set
	 */
	public void setFaxNo(String faxNo) {
		this.faxNo = faxNo;
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
	 * @return the custCpnList
	 */
	public CustCouponVO[] getCustCpnList() {
		return custCpnList;
	}
	
	/**
	 * @param custCpnList the custCpnList to set
	 */
	public void setCustCpnList(CustCouponVO[] custCpnList) {
		this.custCpnList = custCpnList;
	}
	
	/**
	 * @return the lockAt
	 */
	public String getLockAt() {
		return lockAt;
	}
	
	/**
	 * @param lockAt the lockAt to set
	 */
	public void setLockAt(String lockAt) {
		this.lockAt = lockAt;
	}
	
	/**
	 * @return the isReset
	 */
	public String getIsReset() {
		return isReset;
	}
	
	/**
	 * @param isReset the isReset to set
	 */
	public void setIsReset(String isReset) {
		this.isReset = isReset;
	}
}