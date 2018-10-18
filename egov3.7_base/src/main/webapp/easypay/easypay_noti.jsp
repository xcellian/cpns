<%@ page contentType="text/html; charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%!
    /**
     * 파라미터 체크 메소드
     */
    public String getNullToSpace(String param) {
        return (param == null) ? "" : param.trim();
    }
%>
<%
    final char DELI_US = 0x1f;
    final String RESULT_SUCCESS = "0000";
    final String RESULT_FAIL 	= "5001";

    /* -------------------------------------------------------------------------- */
    /* ::: 노티수신 - 일반                                                        */
    /* -------------------------------------------------------------------------- */
    String result_msg = "";

    String r_res_cd         = getNullToSpace(request.getParameter( "res_cd"         ));  // 응답코드
    String r_res_msg        = getNullToSpace(request.getParameter( "res_msg"        ));  // 응답 메시지
    String r_cno            = getNullToSpace(request.getParameter( "cno"            ));  // PG거래번호
    String r_memb_id        = getNullToSpace(request.getParameter( "memb_id"        ));  // 가맹점 ID
    String r_amount         = getNullToSpace(request.getParameter( "amount"         ));  // 총 결제금액
    String r_order_no       = getNullToSpace(request.getParameter( "order_no"       ));  // 주문번호
    String r_noti_type      = getNullToSpace(request.getParameter( "noti_type"      ));  // 노티구분 변경(20), 입금(30), 에스크로 변경(40)
    String r_auth_no        = getNullToSpace(request.getParameter( "auth_no"        ));  // 승인번호
    String r_tran_date      = getNullToSpace(request.getParameter( "tran_date"      ));  // 승인일시
    String r_card_no        = getNullToSpace(request.getParameter( "card_no"        ));  // 카드번호
    String r_issuer_cd      = getNullToSpace(request.getParameter( "issuer_cd"      ));  // 발급사코드
    String r_issuer_nm      = getNullToSpace(request.getParameter( "issuer_nm"      ));  // 발급사명
    String r_acquirer_cd    = getNullToSpace(request.getParameter( "acquirer_cd"    ));  // 매입사코드
    String r_acquirer_nm    = getNullToSpace(request.getParameter( "acquirer_nm"    ));  // 매입사명
    String r_install_period = getNullToSpace(request.getParameter( "install_period" ));  // 할부개월
    String r_noint          = getNullToSpace(request.getParameter( "noint"          ));  // 무이자여부
    String r_bank_cd        = getNullToSpace(request.getParameter( "bank_cd"        ));  // 은행코드
    String r_bank_nm        = getNullToSpace(request.getParameter( "bank_nm"        ));  // 은행명
    String r_account_no     = getNullToSpace(request.getParameter( "account_no"     ));  // 계좌번호
    String r_deposit_nm     = getNullToSpace(request.getParameter( "deposit_nm"     ));  // 입금자명
    String r_expire_date    = getNullToSpace(request.getParameter( "expire_date"    ));  // 계좌사용만료일
    String r_cash_res_cd    = getNullToSpace(request.getParameter( "cash_res_cd"    ));  // 현금영수증 결과코드
    String r_cash_res_msg   = getNullToSpace(request.getParameter( "cash_res_msg"   ));  // 현금영수증 결과메시지
    String r_cash_auth_no   = getNullToSpace(request.getParameter( "cash_auth_no"   ));  // 현금영수증 승인번호
    String r_cash_tran_date = getNullToSpace(request.getParameter( "cash_tran_date" ));  // 현금영수증 승인일시
    String r_cp_cd          = getNullToSpace(request.getParameter( "cp_cd"          ));  // 포인트사
    String r_used_pnt       = getNullToSpace(request.getParameter( "used_pnt"       ));  // 사용포인트
    String r_remain_pnt     = getNullToSpace(request.getParameter( "remain_pnt"     ));  // 잔여한도
    String r_pay_pnt        = getNullToSpace(request.getParameter( "pay_pnt"        ));  // 할인/발생포인트
    String r_accrue_pnt     = getNullToSpace(request.getParameter( "accrue_pnt"     ));  // 누적포인트
    String r_escrow_yn      = getNullToSpace(request.getParameter( "escrow_yn"      ));  // 에스크로 사용유무
    String r_canc_date      = getNullToSpace(request.getParameter( "canc_date"      ));  // 취소일시
    String r_canc_acq_date  = getNullToSpace(request.getParameter( "canc_acq_date"  ));  // 매입취소일시
    String r_refund_date    = getNullToSpace(request.getParameter( "refund_date"    ));  // 환불예정일시
    String r_pay_type       = getNullToSpace(request.getParameter( "pay_type"       ));  // 결제수단
    String r_auth_cno       = getNullToSpace(request.getParameter( "auth_cno"       ));  // 인증거래번호
    String r_tlf_sno        = getNullToSpace(request.getParameter( "tlf_sno"        ));  // 채번거래번호
    String r_account_type   = getNullToSpace(request.getParameter( "account_type"   ));  // 채번계좌 타입 US AN 1 (V-일반형, F-고정형)

    /* -------------------------------------------------------------------------- */
    /* ::: 노티수신 - 에스크로 상태변경                                           */
    /* -------------------------------------------------------------------------- */
    String r_escrow_yn      = getNullToSpace(request.getParameter( "escrow_yn"      ));  // 에스크로유무
    String r_stat_cd        = getNullToSpace(request.getParameter( "stat_cd"        ));  // 변경에스크로상태코드
    String r_stat_msg       = getNullToSpace(request.getParameter( "stat_msg"       ));  // 변경에스크로상태메세지


    if ( r_res_cd.equals("0000") )
    {
	    /* ---------------------------------------------------------------------- */
	    /* ::: 가맹점 DB 처리                                                     */
	    /* ---------------------------------------------------------------------- */
	    /* DB처리 성공 시 : res_cd=0000, 실패 시 : res_cd=5001                    */
	    /* ---------------------------------------------------------------------- */
		if	// DB처리 성공 시
		{
			result_msg = "res_cd=" + RESULT_SUCCESS + DELI_US + "res_msg=SUCCESS";
		}
		else // DB처리 실패 시
		{
    		result_msg = "res_cd=" + RESULT_FAIL + DELI_US + "res_msg=FAIL";
		}
    }

    /* -------------------------------------------------------------------------- */
    /* ::: 노티 처리결과 처리                                                     */
    /* -------------------------------------------------------------------------- */
    out.println( result_msg );

%>