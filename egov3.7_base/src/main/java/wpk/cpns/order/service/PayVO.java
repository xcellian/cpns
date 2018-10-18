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
public class PayVO extends OrderVO{
	
	private static final long serialVersionUID = 3640820362821490939L;
	
	/** index */
	private String idx = "";

	/** 결과코드 */
	private String res_cd = "";

	/** 결과메세지 */
	private String res_msg = "";

	/** PG거래번호 */
	private String cno = "";

	/** 총결제금액 */
	private String amount = "";

	/** 주문번호 */
	private String order_no = "";

	/** 승인번호 */
	private String auth_no = "";

	/** 승인일시 */
	private String tran_date = "";

	/** 에스크로 사용유무 */
	private String escrow_yn = "";

	/** 복합결제 유무 */
	private String complex_yn = "";

	/** 상태코드 */
	private String stat_cd = "";

	/** 상태 메세지 */
	private String stat_msg = "";

	/** 결제수단 */
	private String pay_type = "";

	/** 결제방법명 */
	private String pay_type_nm = "";

	/** 가맹점 ID */
	private String mall_id = "";

	/** 카드번호 */
	private String card_no = "";

	/** 발급사코드 */
	private String issuer_cd = "";

	/** 발급사명 */
	private String issuer_nm = "";

	/** 매입사코드 */
	private String acquirer_cd = "";

	/** 매입사명 */
	private String acquirer_nm = "";

	/** 할부개월 */
	private String install_period = "";

	/** 무이자여부 */
	private String noint = "";

	/** 부분취소 가능여부 */
	private String part_cancel_yn = "";

	/** 신용카드 종류 */
	private String card_gubun = "";

	/** 신용카드 구분 */
	private String card_biz_gubun = "";

	/** 쿠폰사용유무 */
	private String cpon_flag = "";

	/** 은행코드 */
	private String bank_cd = "";

	/** 은행명 */
	private String bank_nm = "";

	/** 계좌번호 */
	private String account_no = "";

	/** 입금자명 */
	private String deposit_nm = "";

	/** 계좌사용만료일 */
	private String expire_date = "";

	/** 현금영수증 결과코드 */
	private String cash_res_cd = "";

	/** 현금영수증 결과메세지 */
	private String cash_res_msg = "";

	/** 현금영수증 승인번호 */
	private String cash_auth_no = "";

	/** 현금영수증 승인일시 */
	private String cash_tran_date = "";

	/** 현금영수증 발행용도 */
	private String cash_issue_type = "";

	/** 인증구분 */
	private String cash_auth_type = "";

	/** 인증번호 */
	private String cash_auth_value = "";

	/** 포인트사/쿠폰사 */
	private String cp_cd = "";

	/** 쿠폰승인번호 */
	private String cpon_auth_no = "";

	/** 쿠폰승인일시 */
	private String cpon_tran_date = "";

	/** 쿠폰번호 */
	private String cpon_no = "";

	/** 쿠폰잔액 */
	private String remain_cpon = "";

	/** 쿠폰 사용금액 */
	private String used_cpon = "";

	/** 잔액 */
	private String rem_amt = "";

	/** 장바구니 결제여부 */
	private String bk_pay_yn = "";

	/** 매입취소일시 */
	private String canc_acq_date = "";

	/** 취소일시 */
	private String canc_date = "";

	/** 환불예정일시 */
	private String refund_date = "";

	/**
	 * @return the res_cd
	 */
	public String getRes_cd() {
		return res_cd;
	}

	/**
	 * @param res_cd the res_cd to set
	 */
	public void setRes_cd(String res_cd) {
		this.res_cd = res_cd;
	}

	/**
	 * @return the res_msg
	 */
	public String getRes_msg() {
		return res_msg;
	}

	/**
	 * @param res_msg the res_msg to set
	 */
	public void setRes_msg(String res_msg) {
		this.res_msg = res_msg;
	}

	/**
	 * @return the cno
	 */
	public String getCno() {
		return cno;
	}

	/**
	 * @param cno the cno to set
	 */
	public void setCno(String cno) {
		this.cno = cno;
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

	/**
	 * @return the order_no
	 */
	public String getOrder_no() {
		return order_no;
	}

	/**
	 * @param order_no the order_no to set
	 */
	public void setOrder_no(String order_no) {
		this.order_no = order_no;
	}

	/**
	 * @return the auth_no
	 */
	public String getAuth_no() {
		return auth_no;
	}

	/**
	 * @param auth_no the auth_no to set
	 */
	public void setAuth_no(String auth_no) {
		this.auth_no = auth_no;
	}

	/**
	 * @return the tran_date
	 */
	public String getTran_date() {
		return tran_date;
	}

	/**
	 * @param tran_date the tran_date to set
	 */
	public void setTran_date(String tran_date) {
		this.tran_date = tran_date;
	}

	/**
	 * @return the escrow_yn
	 */
	public String getEscrow_yn() {
		return escrow_yn;
	}

	/**
	 * @param escrow_yn the escrow_yn to set
	 */
	public void setEscrow_yn(String escrow_yn) {
		this.escrow_yn = escrow_yn;
	}

	/**
	 * @return the complex_yn
	 */
	public String getComplex_yn() {
		return complex_yn;
	}

	/**
	 * @param complex_yn the complex_yn to set
	 */
	public void setComplex_yn(String complex_yn) {
		this.complex_yn = complex_yn;
	}

	/**
	 * @return the stat_cd
	 */
	public String getStat_cd() {
		return stat_cd;
	}

	/**
	 * @param stat_cd the stat_cd to set
	 */
	public void setStat_cd(String stat_cd) {
		this.stat_cd = stat_cd;
	}

	/**
	 * @return the stat_msg
	 */
	public String getStat_msg() {
		return stat_msg;
	}

	/**
	 * @param stat_msg the stat_msg to set
	 */
	public void setStat_msg(String stat_msg) {
		this.stat_msg = stat_msg;
	}

	/**
	 * @return the pay_type
	 */
	public String getPay_type() {
		return pay_type;
	}

	/**
	 * @param pay_type the pay_type to set
	 */
	public void setPay_type(String pay_type) {
		this.pay_type = pay_type;
	}

	/**
	 * @return the pay_type_nm
	 */
	public String getPay_type_nm() {
		return pay_type_nm;
	}

	/**
	 * @param pay_type_nm the pay_type_nm to set
	 */
	public void setPay_type_nm(String pay_type_nm) {
		this.pay_type_nm = pay_type_nm;
	}

	/**
	 * @return the mall_id
	 */
	public String getMall_id() {
		return mall_id;
	}

	/**
	 * @param mall_id the mall_id to set
	 */
	public void setMall_id(String mall_id) {
		this.mall_id = mall_id;
	}

	/**
	 * @return the card_no
	 */
	public String getCard_no() {
		return card_no;
	}

	/**
	 * @param card_no the card_no to set
	 */
	public void setCard_no(String card_no) {
		this.card_no = card_no;
	}

	/**
	 * @return the issuer_cd
	 */
	public String getIssuer_cd() {
		return issuer_cd;
	}

	/**
	 * @param issuer_cd the issuer_cd to set
	 */
	public void setIssuer_cd(String issuer_cd) {
		this.issuer_cd = issuer_cd;
	}

	/**
	 * @return the issuer_nm
	 */
	public String getIssuer_nm() {
		return issuer_nm;
	}

	/**
	 * @param issuer_nm the issuer_nm to set
	 */
	public void setIssuer_nm(String issuer_nm) {
		this.issuer_nm = issuer_nm;
	}

	/**
	 * @return the acquirer_cd
	 */
	public String getAcquirer_cd() {
		return acquirer_cd;
	}

	/**
	 * @param acquirer_cd the acquirer_cd to set
	 */
	public void setAcquirer_cd(String acquirer_cd) {
		this.acquirer_cd = acquirer_cd;
	}

	/**
	 * @return the acquirer_nm
	 */
	public String getAcquirer_nm() {
		return acquirer_nm;
	}

	/**
	 * @param acquirer_nm the acquirer_nm to set
	 */
	public void setAcquirer_nm(String acquirer_nm) {
		this.acquirer_nm = acquirer_nm;
	}

	/**
	 * @return the install_period
	 */
	public String getInstall_period() {
		return install_period;
	}

	/**
	 * @param install_period the install_period to set
	 */
	public void setInstall_period(String install_period) {
		this.install_period = install_period;
	}

	/**
	 * @return the noint
	 */
	public String getNoint() {
		return noint;
	}

	/**
	 * @param noint the noint to set
	 */
	public void setNoint(String noint) {
		this.noint = noint;
	}

	/**
	 * @return the part_cancel_yn
	 */
	public String getPart_cancel_yn() {
		return part_cancel_yn;
	}

	/**
	 * @param part_cancel_yn the part_cancel_yn to set
	 */
	public void setPart_cancel_yn(String part_cancel_yn) {
		this.part_cancel_yn = part_cancel_yn;
	}

	/**
	 * @return the card_gubun
	 */
	public String getCard_gubun() {
		return card_gubun;
	}

	/**
	 * @param card_gubun the card_gubun to set
	 */
	public void setCard_gubun(String card_gubun) {
		this.card_gubun = card_gubun;
	}

	/**
	 * @return the card_biz_gubun
	 */
	public String getCard_biz_gubun() {
		return card_biz_gubun;
	}

	/**
	 * @param card_biz_gubun the card_biz_gubun to set
	 */
	public void setCard_biz_gubun(String card_biz_gubun) {
		this.card_biz_gubun = card_biz_gubun;
	}

	/**
	 * @return the cpon_flag
	 */
	public String getCpon_flag() {
		return cpon_flag;
	}

	/**
	 * @param cpon_flag the cpon_flag to set
	 */
	public void setCpon_flag(String cpon_flag) {
		this.cpon_flag = cpon_flag;
	}

	/**
	 * @return the bank_cd
	 */
	public String getBank_cd() {
		return bank_cd;
	}

	/**
	 * @param bank_cd the bank_cd to set
	 */
	public void setBank_cd(String bank_cd) {
		this.bank_cd = bank_cd;
	}

	/**
	 * @return the bank_nm
	 */
	public String getBank_nm() {
		return bank_nm;
	}

	/**
	 * @param bank_nm the bank_nm to set
	 */
	public void setBank_nm(String bank_nm) {
		this.bank_nm = bank_nm;
	}

	/**
	 * @return the account_no
	 */
	public String getAccount_no() {
		return account_no;
	}

	/**
	 * @param account_no the account_no to set
	 */
	public void setAccount_no(String account_no) {
		this.account_no = account_no;
	}

	/**
	 * @return the deposit_nm
	 */
	public String getDeposit_nm() {
		return deposit_nm;
	}

	/**
	 * @param deposit_nm the deposit_nm to set
	 */
	public void setDeposit_nm(String deposit_nm) {
		this.deposit_nm = deposit_nm;
	}

	/**
	 * @return the expire_date
	 */
	public String getExpire_date() {
		return expire_date;
	}

	/**
	 * @param expire_date the expire_date to set
	 */
	public void setExpire_date(String expire_date) {
		this.expire_date = expire_date;
	}

	/**
	 * @return the cash_res_cd
	 */
	public String getCash_res_cd() {
		return cash_res_cd;
	}

	/**
	 * @param cash_res_cd the cash_res_cd to set
	 */
	public void setCash_res_cd(String cash_res_cd) {
		this.cash_res_cd = cash_res_cd;
	}

	/**
	 * @return the cash_res_msg
	 */
	public String getCash_res_msg() {
		return cash_res_msg;
	}

	/**
	 * @param cash_res_msg the cash_res_msg to set
	 */
	public void setCash_res_msg(String cash_res_msg) {
		this.cash_res_msg = cash_res_msg;
	}

	/**
	 * @return the cash_auth_no
	 */
	public String getCash_auth_no() {
		return cash_auth_no;
	}

	/**
	 * @param cash_auth_no the cash_auth_no to set
	 */
	public void setCash_auth_no(String cash_auth_no) {
		this.cash_auth_no = cash_auth_no;
	}

	/**
	 * @return the cash_tran_date
	 */
	public String getCash_tran_date() {
		return cash_tran_date;
	}

	/**
	 * @param cash_tran_date the cash_tran_date to set
	 */
	public void setCash_tran_date(String cash_tran_date) {
		this.cash_tran_date = cash_tran_date;
	}

	/**
	 * @return the cash_issue_type
	 */
	public String getCash_issue_type() {
		return cash_issue_type;
	}

	/**
	 * @param cash_issue_type the cash_issue_type to set
	 */
	public void setCash_issue_type(String cash_issue_type) {
		this.cash_issue_type = cash_issue_type;
	}

	/**
	 * @return the cash_auth_type
	 */
	public String getCash_auth_type() {
		return cash_auth_type;
	}

	/**
	 * @param cash_auth_type the cash_auth_type to set
	 */
	public void setCash_auth_type(String cash_auth_type) {
		this.cash_auth_type = cash_auth_type;
	}

	/**
	 * @return the cash_auth_value
	 */
	public String getCash_auth_value() {
		return cash_auth_value;
	}

	/**
	 * @param cash_auth_value the cash_auth_value to set
	 */
	public void setCash_auth_value(String cash_auth_value) {
		this.cash_auth_value = cash_auth_value;
	}

	/**
	 * @return the cp_cd
	 */
	public String getCp_cd() {
		return cp_cd;
	}

	/**
	 * @param cp_cd the cp_cd to set
	 */
	public void setCp_cd(String cp_cd) {
		this.cp_cd = cp_cd;
	}

	/**
	 * @return the cpon_auth_no
	 */
	public String getCpon_auth_no() {
		return cpon_auth_no;
	}

	/**
	 * @param cpon_auth_no the cpon_auth_no to set
	 */
	public void setCpon_auth_no(String cpon_auth_no) {
		this.cpon_auth_no = cpon_auth_no;
	}

	/**
	 * @return the cpon_tran_date
	 */
	public String getCpon_tran_date() {
		return cpon_tran_date;
	}

	/**
	 * @param cpon_tran_date the cpon_tran_date to set
	 */
	public void setCpon_tran_date(String cpon_tran_date) {
		this.cpon_tran_date = cpon_tran_date;
	}

	/**
	 * @return the cpon_no
	 */
	public String getCpon_no() {
		return cpon_no;
	}

	/**
	 * @param cpon_no the cpon_no to set
	 */
	public void setCpon_no(String cpon_no) {
		this.cpon_no = cpon_no;
	}

	/**
	 * @return the remain_cpon
	 */
	public String getRemain_cpon() {
		return remain_cpon;
	}

	/**
	 * @param remain_cpon the remain_cpon to set
	 */
	public void setRemain_cpon(String remain_cpon) {
		this.remain_cpon = remain_cpon;
	}

	/**
	 * @return the used_cpon
	 */
	public String getUsed_cpon() {
		return used_cpon;
	}

	/**
	 * @param used_cpon the used_cpon to set
	 */
	public void setUsed_cpon(String used_cpon) {
		this.used_cpon = used_cpon;
	}

	/**
	 * @return the rem_amt
	 */
	public String getRem_amt() {
		return rem_amt;
	}

	/**
	 * @param rem_amt the rem_amt to set
	 */
	public void setRem_amt(String rem_amt) {
		this.rem_amt = rem_amt;
	}

	/**
	 * @return the bk_pay_yn
	 */
	public String getBk_pay_yn() {
		return bk_pay_yn;
	}

	/**
	 * @param bk_pay_yn the bk_pay_yn to set
	 */
	public void setBk_pay_yn(String bk_pay_yn) {
		this.bk_pay_yn = bk_pay_yn;
	}

	/**
	 * @return the canc_acq_date
	 */
	public String getCanc_acq_date() {
		return canc_acq_date;
	}

	/**
	 * @param canc_acq_date the canc_acq_date to set
	 */
	public void setCanc_acq_date(String canc_acq_date) {
		this.canc_acq_date = canc_acq_date;
	}

	/**
	 * @return the canc_date
	 */
	public String getCanc_date() {
		return canc_date;
	}

	/**
	 * @param canc_date the canc_date to set
	 */
	public void setCanc_date(String canc_date) {
		this.canc_date = canc_date;
	}

	/**
	 * @return the refund_date
	 */
	public String getRefund_date() {
		return refund_date;
	}

	/**
	 * @param refund_date the refund_date to set
	 */
	public void setRefund_date(String refund_date) {
		this.refund_date = refund_date;
	}

}