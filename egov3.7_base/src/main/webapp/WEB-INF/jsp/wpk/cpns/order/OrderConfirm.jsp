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
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn"     uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt"    uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="pageTitle"><spring:message code="comCopSecRgm.title"/></c:set>


<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="<c:url value='/css/font-awesome.css?v=20180601003' />" />
	<link rel="stylesheet" href="<c:url value='/css/font-awesome-ie7.css?v=20180601003' />" />
	<link rel="stylesheet" href="<c:url value='/js/kui/styles/kendo.common-material.min.css?v=20180601001' />" />
	<link rel="stylesheet" href="<c:url value='/js/kui/styles/kendo.material.min.css?v=20180601001' />" />
	<link rel="stylesheet" href="<c:url value='/js/kui/styles/kendo.material.mobile.min.css?v=20180601001' />" />
	<link rel="stylesheet" href="<c:url value='/css/common.css?v=20180601040' />" />
	
	<script src="<c:url value='/js/jquery/jquery-3.3.1.js?v=20180601001' />" ></script>
	<script src="<c:url value='/js/common.js?v=20180601015' />" ></script>
	<script src="<c:url value='/js/kui/js/kendo.ui.core.min.js?v=20180601001' />"></script>
	<script src="<c:url value='/js/kui/js/cultures/kendo.culture.ko-KR.min.js?v=20180601001' />"></script>
	<script src="<c:url value='/js/kui/js/kendo.dialog.min.js?v=20180601001' />"></script>
	<script src="<c:url value='/js/kui/js/kendo.validator.min.js?v=20180601001' />"></script>
	<script src="<c:url value='/js/easypay/default.js' />" ></script>
	<!-- Test -->
	<script type="text/javascript" src="http://testpg.easypay.co.kr/webpay/EasypayCard_Web.js"></script>
	<!-- Real -->
	<!-- script type="text/javascript" src="https://pg.easypay.co.kr/webpay/EasypayCard_Web.js"></script-->
	
</head>
<body>
<div id="main">
	<div id="contentWrap">
		<div id="contentBox">
			<div class="main-section k-content pd-3">
				<div class="btn-section pdr-0">
					<button id="btn-back" type="button" class="k-button float-r" style="margin-left:.5rem;">이전페이지</button>
				</div>
				<form id="orderForm" name="orderForm" data-role="validator" novalidate="novalidate">
					<span style="font-size: 1rem; display: inline-block; position: relative;"><strong>주문내역</strong></span>
					<h1 style="margin-top: .5rem; width: 100%; border-bottom: 1px solid #2762ce;"></h1>
					<ul id="orderCnfrmList" style="display:inline-block; width:100%; padding-top: 1rem;">
						<c:forEach var="order" items="${orderVO.orderDetail}" varStatus="index">
						<li>
							<span class="cpnNm" style="width:50%;">${order.cpnNm}</span>
							<span class="qty text-r" style="width:20%;"><strong>X ${order.qty} 매</strong></span>
							<span class="price text-r" style="width:20%;"><strong><fmt:formatNumber value="${order.amount}"/> 원</strong></span>
						</li>
						</c:forEach>
					</ul>
					<span style="font-size: 1rem; display: inline-block; position: relative;; padding-top: 3rem;"><strong>결제방법 선택</strong></span>
					<h1 style="margin-top: .5rem; width: 100%; border-bottom: 1px solid #2762ce;"></h1>
					<ul class="fieldlist" style="padding: 2rem 1rem 1rem 1rem;">
						<li class="float-l pdr-2">
							<input type="radio" name="EP_pay_type" id="pay-card" class="k-radio pay-method" value="11" disabled="disabled">
							<label class="k-radio-label" for="pay-card">신용카드</label>
						</li>
						<li class="float-l pdr-2">
							<input type="radio" name="EP_pay_type" id="pay-trans" class="k-radio pay-method" value="21" disabled="disabled">
							<label class="k-radio-label" for="pay-trans">계좌이체</label>
						</li>
						<li class="float-l">
							<input type="radio" name="EP_pay_type" id="pay-vacnt" class="k-radio pay-method" value="22" disabled="disabled">
							<label class="k-radio-label" for="pay-vacnt">무통장입금</label>
						</li>
					</ul>
					<div style="width: 100%; margin-top: 2rem; display: inline-block;">
						<span class="pdl-1" style="font-size: .9rem;">
							<input id="order-confirm" type="checkbox" class="k-checkbox" disabled="disabled">
							<label class="k-checkbox-label" for="order-confirm" style="padding-bottom: 1rem;">상기 주문내역을 확인하였습니다.</label>
						</span>
						<span class="float-r pdr-1" style="font-size: 1rem; padding-bottom: 1rem;"><strong>총 결제금액</strong></span>
					</div>
					<div style="width: 100%; display: inline-block;">
						<span class="float-r pdr-1" style="font-size: 1.3rem; color: #ff1010;"><strong><fmt:formatNumber value="${orderVO.orderAmount}"/> 원</strong></span>
					</div>
					
					<!-- easypay param -->
					<!--------------------------->
					<!-- ::: 공통 인증 요청 값 -->
					<!--------------------------->
					
					<input type="hidden" id="EP_mall_id"        name="EP_mall_id"           value="">                          <!-- 가맹점 아이디-->
					<input type="hidden" id="EP_mall_nm"        name="EP_mall_nm"           value="${EP_mall_nm}">             <!-- 가맹점명-->
					<input type="hidden" id="EP_currency"       name="EP_currency"          value="${EP_currency}">            <!-- 통화코드 // 00 : 원화-->
					<input type="hidden" id="EP_return_url"     name="EP_return_url"        value="">                          <!-- 가맹점 CALLBACK URL // -->
					<input type="hidden" id="EP_ci_url"         name="EP_ci_url"            value="${EP_ci_url}">              <!-- CI LOGO URL // -->
					<input type="hidden" id="EP_lang_flag"      name="EP_lang_flag"         value="">                          <!-- 언어 // -->
					<input type="hidden" id="EP_charset"        name="EP_charset"           value="${EP_charset}">             <!-- 가맹점 CharSet // EUC-KR,UTF-8 사용시 대문자 이용-->
					<input type="hidden" id="EP_cert_type"      name="EP_cert_type"         value="">                          <!-- 인증타입 빈값:일반 0:인증 1:비인증 // -->
					<input type="hidden" id="EP_window_type"    name="EP_window_type"       value="${EP_window_type}" />       <!-- 윈도우 타입 -->
					
					<input type="hidden" id="EP_user_id"        name="EP_user_id"           value="${loginVO.userId}">         <!-- 가맹점 고객ID // -->
					<input type="hidden" id="EP_memb_user_no"   name="EP_memb_user_no"      value="${loginVO.uniqId}">         <!-- 가맹점 고객일련번호 // -->
					<input type="hidden" id="EP_user_nm"        name="EP_user_nm"           value="${loginVO.name}">           <!-- 가맹점 고객명 // -->
					<input type="hidden" id="EP_user_mail"      name="EP_user_mail"         value="${loginVO.email}">          <!-- 가맹점 고객 E-mail // -->
					<input type="hidden" id="EP_user_phone1"    name="EP_user_phone1"       value="">                          <!-- 가맹점 고객 연락처1 // -->
					<input type="hidden" id="EP_user_phone2"    name="EP_user_phone2"       value="">                          <!-- 가맹점 고객 연락처2 // -->
					<input type="hidden" id="EP_user_addr"      name="EP_user_addr"         value="">                          <!-- 가맹점 고객 주소 // -->
					<input type="hidden" id="EP_user_define1"   name="EP_user_define1"      value="">                          <!-- 가맹점 필드1 // -->
					<input type="hidden" id="EP_user_define2"   name="EP_user_define2"      value="">                          <!-- 가맹점 필드2 // -->
					<input type="hidden" id="EP_user_define3"   name="EP_user_define3"      value="">                          <!-- 가맹점 필드3 // -->
					<input type="hidden" id="EP_user_define4"   name="EP_user_define4"      value="">                          <!-- 가맹점 필드4 // -->
					<input type="hidden" id="EP_user_define5"   name="EP_user_define5"      value="">                          <!-- 가맹점 필드5 // -->
					<input type="hidden" id="EP_user_define6"   name="EP_user_define6"      value="">                          <!-- 가맹점 필드6 // -->
					<input type="hidden" id="EP_product_type"   name="EP_product_type"      value="">                          <!-- 상품정보구분 // -->
					<input type="hidden" id="EP_product_expr"   name="EP_product_expr"      value="">                          <!-- 서비스 기간 // (YYYYMMDD) -->
					<input type="hidden" id="EP_disp_cash_yn"   name="EP_disp_cash_yn"      value="Y">                         <!-- 현금영수증 화면표시여부 //미표시 : "N", 그외: DB조회 -->
					
					
					<!--------------------------->
					<!-- ::: 카드 인증 요청 값 -->
					<!--------------------------->
					
					<input type="hidden" id="EP_usedcard_code"      name="EP_usedcard_code"     value="">                      <!-- 사용가능한 카드 LIST // FORMAT->카드코드:카드코드: ... :카드코드 EXAMPLE->029:027:031 // 빈값 : DB조회-->
					<input type="hidden" id="EP_quota"              name="EP_quota"             value="">                      <!-- 할부개월 (카드코드-할부개월) -->
					<input type="hidden" id="EP_os_cert_flag"       name="EP_os_cert_flag"      value="${EP_os_cert_flag}">    <!-- 해외안심클릭 사용여부(변경불가) // -->
					<input type="hidden" id="EP_noinst_flag"        name="EP_noinst_flag"       value="">                      <!-- 무이자 여부 (Y/N) // -->
					<input type="hidden" id="EP_noinst_term"        name="EP_noinst_term"       value="">                      <!-- 무이자 기간 (카드코드-더할할부개월) // -->
					<input type="hidden" id="EP_set_point_card_yn"  name="EP_set_point_card_yn" value="">                      <!-- 카드사포인트 사용여부 (Y/N) // -->
					<input type="hidden" id="EP_point_card"         name="EP_point_card"        value="">                      <!-- 포인트카드 LIST  // -->
					<input type="hidden" id="EP_join_cd"            name="EP_join_cd"           value="">                      <!-- 조인코드 // -->
					<input type="hidden" id="EP_kmotion_useyn"      name="EP_kmotion_useyn"     value="${EP_kmotion_useyn}">   <!-- 국민앱카드 사용유무 (Y/N)// -->
					
					<!------------------------------->
					<!-- ::: 가상계좌 인증 요청 값 -->
					<!------------------------------->
					
					<input type="hidden" id="EP_vacct_bank"         name="EP_vacct_bank"        value="">                      <!-- 가상계좌 사용가능한 은행 LIST // -->
					<input type="hidden" id="EP_vacct_end_date"     name="EP_vacct_end_date"    value="">                      <!-- 입금 만료 날짜 // -->
					<input type="hidden" id="EP_vacct_end_time"     name="EP_vacct_end_time"    value="${EP_vacct_end_time}">  <!-- 입금 만료 시간 // -->
					
					<!------------------------------->
					<!-- ::: 선불카드 인증 요청 값 -->
					<!------------------------------->
					
					<input type="hidden" id="EP_prepaid_cp"         name="EP_prepaid_cp"        value="">                      <!-- 선불카드 CP // FORMAT->코드:코드: ... :코드 EXAMPLE->CCB:ECB // 빈값 : DB조회-->
					
					<!--------------------------------->
					<!-- ::: 인증응답용 인증 요청 값 -->
					<!--------------------------------->
					
					<input type="hidden" id="EP_res_cd"             name="EP_res_cd"            value="">                      <!--  응답코드 // -->
					<input type="hidden" id="EP_res_msg"            name="EP_res_msg"           value="">                      <!--  응답메세지 // -->
					<input type="hidden" id="EP_tr_cd"              name="EP_tr_cd"             value="">                      <!--  결제창 요청구분 // -->
					<input type="hidden" id="EP_ret_pay_type"       name="EP_ret_pay_type"      value="">                      <!--  결제수단 // -->
					<input type="hidden" id="EP_ret_complex_yn"     name="EP_ret_complex_yn"    value="">                      <!--  복합결제 여부 (Y/N) // -->
					<input type="hidden" id="EP_card_code"          name="EP_card_code"         value="">                      <!--  카드코드 (ISP:KVP카드코드 MPI:카드코드) // -->
					<input type="hidden" id="EP_eci_code"           name="EP_eci_code"          value="">                      <!--  MPI인 경우 ECI코드 // -->
					<input type="hidden" id="EP_card_req_type"      name="EP_card_req_type"     value="">                      <!--  거래구분 // -->
					<input type="hidden" id="EP_save_useyn"         name="EP_save_useyn"        value="">                      <!--  카드사 세이브 여부 (Y/N) // -->
					<input type="hidden" id="EP_trace_no"           name="EP_trace_no"          value="">                      <!--  추적번호 // -->
					<input type="hidden" id="EP_sessionkey"         name="EP_sessionkey"        value="">                      <!--  세션키 // -->
					<input type="hidden" id="EP_encrypt_data"       name="EP_encrypt_data"      value="">                      <!--  암호화전문 // -->
					<input type="hidden" id="EP_spay_cp"            name="EP_spay_cp"           value="">                      <!--  간편결제 CP 코드 // -->
					<input type="hidden" id="EP_card_prefix"        name="EP_card_prefix"       value="">                      <!--  신용카드prefix // -->
					<input type="hidden" id="EP_card_no_7"          name="EP_card_no_7"         value="">                      <!--  신용카드번호 앞7자리 // -->
					
					<!--------------------------------->
					
					<input type="hidden" id="EP_order_no"           name="EP_order_no"          value="" />                                                    <!-- 주문번호 -->
					<input type="hidden" id="EP_product_nm"         name="EP_product_nm"        value="${orderVO.productNm}" />                                <!-- 상품명 -->
					<input type="hidden" id="EP_product_amt"        name="EP_product_amt"       value="${orderVO.orderAmount}" />                              <!-- 상품금액 -->
					
					<input type="hidden" id="cpnType"               name="cpnType"              value="${cpnType}" />                                          <!-- 쿠폰구분 -->
					<input type="hidden" id="orderDt"               name="orderDt"              value="" />                                                    <!-- 주문일 -->
					<input type="hidden" id="orderAmount"           name="orderAmount"          value="${orderVO.orderAmount}" />                              <!-- 주문금액 -->
					<input type="hidden" id="orderDetail"           name="orderDetail"          value="<c:out value='${orderDetail}' escapeXml='true' />" />   <!-- 주문상세 -->
					
				</form>
				<div class="btn-section pdr-0">
					<button id="btn-pay" type="button" class="k-button large btn-action float-r k-state-disabled" style="margin-top: 2rem;">결제하기</button>
				</div>
			</div>
		</div>
	</div>
</div>
<div id="dialog"></div>

<script>
$(document).ready(function () {
	
	if($('#orderCnfrmList li').length > 0) {
		$('.pay-method').attr('disabled', false);
	}
	
	$('.pay-method').change(function() {
		if ($(this).is(':checked')) {
			$('#order-confirm').attr('disabled', false);
		}
		else {
			$('#order-confirm').attr('disabled', true);
		}
	});
	
	$('#order-confirm').change(function() {
		if ($(this).is(':checked')) {
			$('#btn-pay').addClass('k-primary').removeClass('k-state-disabled');
		}
		else {
			$('#btn-pay').addClass('k-state-disabled').removeClass('k-primary');
		}
	});
	
	//초기값 설정
	//개발
	$('#EP_return_url').val('${EP_return_url_dev}');   // Return 받을 URL (HTTP부터 입력)     필수 변경 가능
	$('#EP_mall_id').val('${EP_mall_id_dev}');
	
	//운영
	/* $('#EP_return_url').val('${EP_return_url_prod}');  // Return 받을 URL (HTTP부터 입력)     필수 변경 가능 */
	/* $('#EP_mall_id').val('${EP_mall_id_prod}'); */
	
	/* 인증창 호출, 인증 요청 */
	var fnCert = function() {
		var frm_pay = document.orderForm;
		
		/* UTF-8 사용가맹점의 경우 EP_charset 값 셋팅 필수 */
		if(frm_pay.EP_charset.value == 'UTF-8') {
			// 한글이 들어가는 값은 모두 encoding 필수.
			frm_pay.EP_mall_nm.value    = encodeURIComponent(frm_pay.EP_mall_nm.value);
			frm_pay.EP_product_nm.value = encodeURIComponent(frm_pay.EP_product_nm.value);
			frm_pay.EP_user_nm.value    = encodeURIComponent(frm_pay.EP_user_nm.value);
			frm_pay.EP_user_addr.value  = encodeURIComponent(frm_pay.EP_user_addr.value);
		}
		
		/* 가맹점에서 원하는 인증창 호출 방법을 선택 */
		if(frm_pay.EP_window_type.value == 'iframe') {
			easypay_webpay(frm_pay, '<c:url value="/easypay/normal/iframe_req.jsp" />', 'hiddenifr', '', '', 'iframe', 30);
			
			if(frm_pay.EP_charset.value == 'UTF-8') {
				// encoding 된 값은 모두 decoding 필수.
				frm_pay.EP_mall_nm.value    = decodeURIComponent(frm_pay.EP_mall_nm.value);
				frm_pay.EP_product_nm.value = decodeURIComponent(frm_pay.EP_product_nm.value);
				frm_pay.EP_user_nm.value    = decodeURIComponent(frm_pay.EP_user_nm.value);
				frm_pay.EP_user_addr.value  = decodeURIComponent(frm_pay.EP_user_addr.value);
			}
		}
		else if(frm_pay.EP_window_type.value == 'popup') {
			easypay_webpay(frm_pay, '<c:url value="/easypay/normal/popup_req.jsp" />', 'hiddenifr', '', '', 'popup', 30);
			
			if(frm_pay.EP_charset.value == 'UTF-8') {
				// encoding 된 값은 모두 decoding 필수.
				frm_pay.EP_mall_nm.value    = decodeURIComponent(frm_pay.EP_mall_nm.value);
				frm_pay.EP_product_nm.value = decodeURIComponent(frm_pay.EP_product_nm.value);
				frm_pay.EP_user_nm.value    = decodeURIComponent(frm_pay.EP_user_nm.value);
				frm_pay.EP_user_addr.value  = decodeURIComponent(frm_pay.EP_user_addr.value);
			}
		}
	};
	
	/* 주문번호 생성 */
	var fnOrderNo = function(now) {
		return '${prefixOrderNo}' + kendo.toString(now, "yyyyMMddHHMMss") + kendo.date.getMilliseconds(now);
	};
	
	$('#btn-pay').click(function(e) {
		e.preventDefault();
		
		if ($(this).hasClass('k-state-disabled')) {
			return false;
		}
		
		var now = new Date();
		//주문번호
		$('#EP_order_no').val(fnOrderNo(now));
		//주문일
		$('#orderDt').val(kendo.toString(now, "yyyyMMdd"));
		//상품금액
		$('#EP_product_amt').val('5000');
		
		fnCert();
		
	});
	
	$('#btn-back').click(function() {
		history.back();
	});
});

function f_submit() {
	var frm_pay = document.orderForm;
	
	frm_pay.target = '_self';
	frm_pay.action = '<c:url value="/easypay/easypay_request.jsp" />';
	frm_pay.submit();
}
</script>
<style>
#btn-back {
	padding: 5px 14px;
}

@media only screen and (max-width: 720px) {
	#orderCnfrmList li span.cpnNm {
		width: 100% !important;
		padding-bottom: .8rem;
	}
	
	#orderCnfrmList li span.qty {
		padding-left: 30% !important;
		float: none !important;
		width: initial !important;
	}
	
	#orderCnfrmList li span.price {
		float: right !important;
		width: initial !important;
	}
} 
</style>
</body>
</html>