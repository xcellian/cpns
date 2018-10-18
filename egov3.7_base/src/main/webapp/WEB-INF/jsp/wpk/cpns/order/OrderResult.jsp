<%
 /**
  * @Class Name : EgovAuthorGroupManage.java
  * @Description : EgovAuthorGroupManage List 화면
  * @Modification Information
  * @
  * @  수정일                     수정자                    수정내용
  * @ -------       --------    ---------------------------
  * @ 2009.03.23    Lee.m.j       최초 생성
  *   2016.06.13    장동한          표준프레임워크 v3.6 개선
  *
  *  @author Lee.m.j
  *  @since 2009.03.23
  *  @version 1.0
  *  @see
  *
  */
%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="com.kicc.*" %>
<%@ page import="wpk.cpns.order.service.PayVO" %>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn"     uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt"    uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
/* -------------------------------------------------------------------------- */
/* ::: 처리구분 설정                                                          */
/* -------------------------------------------------------------------------- */
final String TRAN_CD_NOR_PAYMENT    = "00101000";   // 승인(일반, 에스크로)
final String TRAN_CD_NOR_MGR        = "00201000";   // 변경(일반, 에스크로)
/* -------------------------------------------------------------------------- */
/* ::: 지불정보 설정                                                          */
/* -------------------------------------------------------------------------- */
final String GW_URL                 = "testgw.easypay.co.kr";  // Gateway URL ( test )
//final String GW_URL               = "gw.easypay.co.kr";      // Gateway URL ( real )
final String GW_PORT                = "80";                    // 포트번호(변경불가)

/* -------------------------------------------------------------------------- */
/* ::: 지불 데이터 셋업 (업체에 맞게 수정)                                    */
/* -------------------------------------------------------------------------- */
/* ※ 주의 ※                                                                   */
/* cert_file 변수 설정                                                        */
/* - pg_cert.pem 파일이 있는 디렉토리의  절대 경로 설정                       */
/* log_dir 변수 설정                                                          */
/* - log 디렉토리 설정                                                        */
/* log_level 변수 설정                                                        */
/* - log 레벨 설정 (1 to 99(높을수록 상세))                                   */
/* -------------------------------------------------------------------------- */
final String CERT_FILE              = "C:/dev/easypay/cert";
final String LOG_DIR                = "C:/dev/easypay/log";
final int LOG_LEVEL                 = 50;
/* -------------------------------------------------------------------------- */
/* ::: EasyPayClient 인스턴스 생성 [변경불가 !!].                             */
/* -------------------------------------------------------------------------- */
EasyPayClient easyPayClient = new EasyPayClient();
easyPayClient.easypay_setenv_init( GW_URL, GW_PORT, CERT_FILE, LOG_DIR, LOG_LEVEL );
/* -------------------------------------------------------------------------- */
/* ::: 가맹점 DB 처리                                                         */
/* -------------------------------------------------------------------------- */
/* 응답코드(res_cd)가 "0000" 이면 정상승인 입니다.                            */
/* r_amount가 주문DB의 금액과 다를 시 반드시 취소 요청을 하시기 바랍니다.     */
/* DB 처리 실패 시 취소 처리를 해주시기 바랍니다.                             */
/* -------------------------------------------------------------------------- */
String res_cd = "";
String res_msg = "";
String r_cno = "";
String r_canc_date = "";
 
String mall_id = (String) request.getAttribute("EP_mall_id_dev");
//String mall_id = (String) request.getAttribute("EP_mall_id_prod");

PayVO payVO = (PayVO) request.getAttribute("payVO");
String order_no = payVO.getOrder_no();
r_cno = payVO.getCno();

if ( "0000".equals(payVO.getRes_cd()) ) {
	if ( "false".equals(payVO.getbDBProc()) ) {
		// 승인요청이 실패 시 아래 실행
		int easypay_mgr_data_item;
		
		easyPayClient.easypay_reqdata_init();
		
		easypay_mgr_data_item = easyPayClient.easypay_item( "mgr_data" );
		if ( !"Y".equals(payVO.getEscrow_yn()) ) {
			easyPayClient.easypay_deli_us( easypay_mgr_data_item, "mgr_txtype", "40"    );
		}
		else {
			easyPayClient.easypay_deli_us( easypay_mgr_data_item, "mgr_txtype",  "61"   );
			easyPayClient.easypay_deli_us( easypay_mgr_data_item, "mgr_subtype", "ES02" );
		}
		easyPayClient.easypay_deli_us( easypay_mgr_data_item, "org_cno",  r_cno     );
		easyPayClient.easypay_deli_us( easypay_mgr_data_item, "order_no", order_no  );
		easyPayClient.easypay_deli_us( easypay_mgr_data_item, "req_ip",   request.getRemoteAddr());
		easyPayClient.easypay_deli_us( easypay_mgr_data_item, "req_id",   "MALL_R_TRANS" );
		easyPayClient.easypay_deli_us( easypay_mgr_data_item, "mgr_msg",  "DB 처리 실패로 망취소"  );
		
		easyPayClient.easypay_run( mall_id, TRAN_CD_NOR_MGR, order_no );
		
		res_cd = easyPayClient.res_cd;
		res_msg = easyPayClient.res_msg;
		r_cno = easyPayClient.easypay_get_res( "cno"              );    // PG거래번호
		r_canc_date = easyPayClient.easypay_get_res( "canc_date"  );    //취소일시
	}
}
%>
<c:set var="pageTitle"><spring:message code="comCopSecRgm.title"/></c:set>


<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="<c:url value='/css/font-awesome.css?v=20180601003' />" />
	<link rel="stylesheet" href="<c:url value='/css/font-awesome-ie7.css?v=20180601003' />" />
	<link rel="stylesheet" href="<c:url value='/js/kui/styles/kendo.common-material.min.css?v=20180601001' />" />
	<link rel="stylesheet" href="<c:url value='/js/kui/styles/kendo.material.min.css?v=20180601001' />" />
	<link rel="stylesheet" href="<c:url value='/js/kui/styles/kendo.material.mobile.min.css?v=20180601001' />" />
	<link rel="stylesheet" href="<c:url value='/css/common.css?v=20180601047' />" />
	
	<script src="<c:url value='/js/jquery/jquery-3.3.1.js?v=20180601001' />" ></script>
	<script src="<c:url value='/js/common.js?v=20180601015' />" ></script>
	<script src="<c:url value='/js/kui/js/kendo.ui.core.min.js?v=20180601001' />"></script>
	<script src="<c:url value='/js/kui/js/cultures/kendo.culture.ko-KR.min.js?v=20180601001' />"></script>
	<script src="<c:url value='/js/kui/js/kendo.dialog.min.js?v=20180601001' />"></script>
	<script src="<c:url value='/js/kui/js/kendo.validator.min.js?v=20180601001' />"></script>
	<script src="<c:url value='/js/easypay/default.js' />" ></script>
	
</head>
<body>
<div id="main">
	<div id="contentWrap">
		<div id="contentBox">
			<div class="main-section k-content pd-3">
<%
if ("true".equals(payVO.getbDBProc())) {
	if ("0000".equals(payVO.getRes_cd()) && ("TS01".equals(payVO.getStat_cd()) || "TS03".equals(payVO.getStat_cd()) || "TS07".equals(payVO.getStat_cd()))) {
%>
				<span style="font-size: 1rem; display: inline-block; position: relative;"><strong>주문내역 확인</strong></span>
				<h1 style="margin-top: .5rem; width: 100%; border-bottom: 1px solid #2762ce;"></h1>
				<ul id="orderResultList" style="display:inline-block; width:100%; ">
					<c:forEach var="order" items="${payVO.orderDetail}" varStatus="index">
					<li>
						<span class="cpnNm" style="width:50%;">${order.cpnNm}</span>
						<span class="qty text-r" style="width:20%;"><strong>X ${order.qty} 매</strong></span>
						<span class="price text-r" style="width:20%;"><strong><fmt:formatNumber value="${order.amount}"/> 원</strong></span>
					</li>
					</c:forEach>
<!-- 					<li>
						<span class="cpnNm" style="width:50%;">쿠폰 123456789233df;gl;dlfjkgld;kfg;ldkfg33333</span>
						<span class="qty text-r" style="width:20%;"><strong>X 30매</strong></span>
						<span class="price text-r" style="width:20%;"><strong>5,000원</strong></span>
					</li>
					<li>
						<span class="cpnNm" style="width:50%;">쿠폰 123456789233df;gl;dlfjkgld;kfg;ldkfg33333</span>
						<span class="qty text-r" style="width:20%;"><strong>X 30매</strong></span>
						<span class="price text-r" style="width:20%;"><strong>5,000원</strong></span>
					</li> -->
				</ul>
				<!-- 공통 -->
				<span style="font-size: 1rem; display: inline-block; position: relative; padding-top: 3rem;"><strong>결제정보</strong></span>
<%
		if ("11".equals(payVO.getPay_type()) || "21".equals(payVO.getPay_type())) {
%>
				<button id="btn-receipt" class="k-button slim chocolate float-r" style="position: relative; display: inline-block; top: 45px;">
					<span class="k-icon k-icon-13 k-i-print" style="top: -1px;"></span> 영수증출력
				</button>
<%
		}
%>
				<h1 style="margin-top: .5rem; width: 100%; border-bottom: 1px solid #2762ce;"></h1>
				<ul class="payResult">
					<li class="float-l li-title text-c">
						<label><strong>주문결과</strong></label>
					</li>
					<li style="width: 33%;" class="float-l li-content">
						<span style="padding-left: 1rem; color: #d40000;"><strong>${payVO.orderStateNm}</strong></span>
					</li>
					<li class="float-l li-title text-c">
						<label><strong>주 문 일</strong></label>
					</li>
					<li style="width: 35%;" class="float-l li-content">
						<span style="padding-left: 1rem;">
							<fmt:parseDate value="${payVO.orderDt}" var="order_date" pattern="yyyyMMdd"/>
							<fmt:formatDate value="${order_date}" pattern="yyyy-MM-dd" />
						</span>
					</li>
					<li class="float-l li-title text-c">
						<label><strong>주문번호</strong></label>
					</li>
					<li style="width: 33%;" class="float-l li-content">
						<span style="padding-left: 1rem;">${payVO.order_no}</span>
					</li>
					<li class="float-l li-title text-c">
						<label><strong>주문금액</strong></label>
					</li>
					<li style="width: 35%;" class="float-l li-content">
						<span style="padding-left: 1rem;"><strong><fmt:formatNumber value="${payVO.orderAmount}"/> 원</strong></span>
					</li>
					<li class="float-l li-title text-c">
						<label><strong>결제방법</strong></label>
					</li>
					<li style="width: 83%;" class="float-l li-content">
						<span style="padding-left: 1rem;">${payVO.pay_type_nm}</span>
					</li>
				</ul>
<%
		if ("11".equals(payVO.getPay_type())) {
%>
				<!-- 신용카드 -->
				<ul class="payResult" style="position: relative; top: -3px;">
					<li class="float-l li-title text-c">
						<label><strong>승인번호</strong></label>
					</li>
					<li style="width: 33%;" class="float-l li-content">
						<span style="padding-left: 1rem;">${payVO.auth_no}</span>
					</li>
					<li class="float-l li-title text-c">
						<label><strong>승인일시</strong></label>
					</li>
					<li style="width: 35%;" class="float-l li-content">
						<span style="padding-left: 1rem;">
							<fmt:parseDate value="${payVO.tran_date}" var="tran_date" pattern="yyyyMMddHHmmss"/>
							<fmt:formatDate value="${tran_date}" pattern="yyyy-MM-dd HH:mm:ss" />
						</span>
					</li>
					<li class="float-l li-title text-c">
						<label><strong>카 드 사</strong></label>
					</li>
					<li style="width: 33%;" class="float-l li-content">
						<span style="padding-left: 1rem;">${payVO.acquirer_nm}</span>
					</li>
					<li class="float-l li-title text-c">
						<label><strong>결제금액</strong></label>
					</li>
					<li style="width: 35%;" class="float-l li-content">
						<span style="padding-left: 1rem; color: #d40000;""><strong><fmt:formatNumber value="${payVO.amount}"/> 원</strong></span>
					</li>
				</ul>
<%
		}
		else if ("21".equals(payVO.getPay_type())) {
%>
				<!-- 계좌이체 -->
				<ul class="payResult" style="position: relative; top: -3px;">
					<li class="float-l li-title text-c">
						<label><strong>은 행 명</strong></label>
					</li>
					<li style="width: 33%;" class="float-l li-content">
						<span style="padding-left: 1rem;">${payVO.bank_nm}</span>
					</li>
					<%-- <li class="float-l li-title text-c">
						<label><strong>계좌번호</strong></label>
					</li>
					<li style="width: 35%;" class="float-l li-content">
						<span style="padding-left: 1rem;">${payVO.account_no}</span>
					</li> --%>
					<%-- <li class="float-l li-title text-c">
						<label><strong>입금자명</strong></label>
					</li>
					<li style="width: 33%;" class="float-l li-content">
						<span style="padding-left: 1rem;">${payVO.deposit_nm}</span>
					</li> --%>
					<li class="float-l li-title text-c">
						<label><strong>결제금액</strong></label>
					</li>
					<li style="width: 35%;" class="float-l li-content">
						<span style="padding-left: 1rem; color: #d40000;""><strong><fmt:formatNumber value="${payVO.amount}"/> 원</strong></span>
					</li>
				</ul>
<%
		}
		else if ("22".equals(payVO.getPay_type())) {
%>
				<!-- 무통장입금 -->
				<ul class="payResult" style="position: relative; top: -3px;">
					<li class="float-l li-title text-c">
						<label><strong>은 행 명</strong></label>
					</li>
					<li style="width: 33%;" class="float-l li-content">
						<span style="padding-left: 1rem;">${payVO.bank_nm}</span>
					</li>
					<li class="float-l li-title text-c">
						<label><strong>계좌번호</strong></label>
					</li>
					<li style="width: 35%;" class="float-l li-content">
						<span style="padding-left: 1rem;">${payVO.account_no}</span>
					</li>
					<li class="float-l li-title text-c">
						<label><strong>예금주명</strong></label>
					</li>
					<li style="width: 33%;" class="float-l li-content">
						<span style="padding-left: 1rem;">${payVO.deposit_nm}</span>
					</li>
					<li class="float-l li-title text-c">
						<label><strong>입금기한</strong></label>
					</li>
					<li style="width: 35%;" class="float-l li-content">
						<span style="padding-left: 1rem;">
							<fmt:parseDate value="${payVO.expire_date}" var="expire_date" pattern="yyyyMMddHHmmss"/>
							<fmt:formatDate value="${expire_date}" pattern="yyyy-MM-dd HH:mm:ss" /> 까지
						</span>
					</li>
					<li class="float-l li-title text-c">
						<label><strong>입 금 액</strong></label>
					</li>
					<li style="width: 35%;" class="float-l li-content">
						<span style="padding-left: 1rem; color: #d40000;""><strong><fmt:formatNumber value="${payVO.amount}"/> 원</strong></span>
					</li>
				</ul>
<%
		}
	}
}
else {
%>
				<div style="width: 100%; margin: auto; display: inline-block;">
					<span style="color: #d40000; font-size: 2rem; display: block; line-height: 5rem;"><strong>주문실패</strong></span>
					<span style="display: block; font-size: 1rem;  line-height: 3rem;"><strong>주문번호</strong> : ${payVO.order_no}</span>
					<span style="display: block; font-size: 1rem;  line-height: 2rem;">주문 실패가 계속될 경우 상기 주문번호를 기재하여 관리자에게 문의하여 주시기 바랍니다.</span>
				</div>
<%
}
%>
<%-- 			<div style="width: 100%; margin-top: 2rem; display: inline-block;">
					<span class="pdl-1" style="font-size: .9rem;">
						<input id="order-confirm" type="checkbox" class="k-checkbox" disabled="disabled">
						<label class="k-checkbox-label" for="order-confirm" style="padding-bottom: 1rem;">상기 주문내역을 확인하였습니다.</label>
					</span>
					<span class="float-r pdr-1" style="font-size: 1rem; padding-bottom: 1rem;"><strong>총 결제금액</strong></span>
				</div>
				<div style="width: 100%; display: inline-block;">
					<span class="float-r pdr-1" style="font-size: 1.3rem; color: #ff1010;"><strong><fmt:formatNumber value="${payVO.orderAmount}"/> 원</strong></span>
				</div> --%>
				<div class="btn-section pdr-0">
					<button id="btn-result" type="button" class="k-button k-primary large float-r" style="margin-top: 2rem;">확인</button>
				</div>
			</div>
		</div>
	</div>
</div>
<div id="dialog"></div>
<form name="receiptForm" method="get" action="">
	<input type=hidden name=controlNo>
	<input type=hidden name=payment>
</form>
<!-- 
<input type="button" name="card1_receipt" value="신용카드" onclick="javascript:receipt('거래번호 20자리', '01');">
<input type="button" name="acc1_receipt" value="계좌이체" onclick="javascript:receipt('거래번호 20자리', '02');">
<input type="button" name="vacc1_receipt" value="가상계좌" onclick="javascript:receipt('거래번호 20자리', '03');">
<input type="button" name="mobile1_receipt" value="휴대폰" onclick="javascript:receipt('거래번호 20자리', '04');">
<input type="button" name="ars1_receipt" value="ars" onclick="javascript:receipt('거래번호 20자리', '05');">
<input type="button" name="bill1_receipt" value="현금영수증" onclick="javascript:receipt('거래번호 20자리', '06');">
 -->
<script>
$(document).ready(function () {
	$('#btn-result').click(function() {
		location.href = '<c:url value="/cpns/order" />';
	});
	
	$('#btn-receipt').click(function() {
		fnReceipt('${payVO.cno}');
	});
});

/**********************************************************************************
	거래내역  영수증 팝업
***********************************************************************************/
function fnReceipt(controlNo) {
	
	var payment = '';
	if ('${payVO.pay_type}' == '11') {
		payment = '01';
	}
	else if ('${payVO.pay_type}' == '21') {
		payment = '02';
	}
	else if ('${payVO.pay_type}' == '22') {
		payment = '03';
	}
	
	window.open('', 'MEMB_POP_RECEIPT', 'toolbar=0,scroll=1,menubar=0,status=0,resizable=0,width=380,height=700');
	document.receiptForm.action = 'http://testoffice.easypay.co.kr/receipt/ReceiptBranch.jsp';  // 테스트
	//document.receiptForm.action = 'https://office.easypay.co.kr/receipt/ReceiptBranch.jsp';     // 운영
	document.receiptForm.controlNo.value = controlNo;
	document.receiptForm.payment.value = payment;
	document.receiptForm.target = "MEMB_POP_RECEIPT";
	document.receiptForm.submit();
}
</script>
<style>
@media only screen and (max-width: 720px) {
	#orderResultList li span.cpnNm {
		width: 100% !important;
		padding-bottom: .8rem;
	}
	
	#orderResultList li span.qty {
		float: none !important;
		width: initial !important;
	}
	
	#orderResultList li span.price {
		float: right !important;
		width: initial !important;
	}
	
	.payResult li.li-title {
		width: 35% !important;
	}
	
	.payResult li.li-content {
		width: 65% !important;
	}
} 
</style>
</body>
</html>