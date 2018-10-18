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
	<%-- <script src="<c:url value='/js/easypay/default.js' />" ></script> --%>
	
</head>
<body>
<div id="main">
	<div id="contentWrap">
		<div id="contentBox">
			<div class="main-section k-content pd-3">
				<span style="font-size: 1rem; display: inline-block; position: relative;"><strong>주문내역</strong></span>
				<h1 style="margin-top: .5rem; width: 100%; border-bottom: 1px solid #2762ce;"></h1>
				<ul id="orderResultList" style="display:inline-block; width:100%; ">
					<%-- <c:forEach var="order" items="${payVO.orderDetail}" varStatus="index">
					<li>
						<span class="cpnNm" style="width:50%;">${order.cpnNm}</span>
						<span class="qty text-r" style="width:20%;"><strong>X ${order.qty} 매</strong></span>
						<span class="price text-r" style="width:20%;"><strong><fmt:formatNumber value="${order.amount}"/> 원</strong></span>
					</li>
					</c:forEach> --%>
					<li>
						<span class="cpnNm" style="width:50%;">쿠폰 123456789233df;gl;dlfjkgld;kfg;ldkfg33333</span>
						<span class="qty text-r" style="width:20%;"><strong>X 30매</strong></span>
						<span class="price text-r" style="width:20%;"><strong>5,000원</strong></span>
					</li>
					<li>
						<span class="cpnNm" style="width:50%;">쿠폰 123456789233df;gl;dlfjkgld;kfg;ldkfg33333</span>
						<span class="qty text-r" style="width:20%;"><strong>X 30매</strong></span>
						<span class="price text-r" style="width:20%;"><strong>5,000원</strong></span>
					</li>
				</ul>
				<!-- 공통 -->
				<span style="font-size: 1rem; display: inline-block; position: relative; padding-top: 3rem;"><strong>결제정보</strong></span>
				<c:if test="${orderVO.stat_cd != 'TS07'}">
					<button id="btn-receipt" class="k-button slim chocolate float-r" style="position: relative; display: inline-block; top: 45px;">
						<span class="k-icon k-icon-13 k-i-print" style="top: -1px;"></span> 영수증출력
					</button>
				</c:if>
				<h1 style="margin-top: .5rem; width: 100%; border-bottom: 1px solid #2762ce;"></h1>
				<ul class="payResult">
					<li class="float-l li-title text-c">
						<label><strong>주문상태</strong></label>
					</li>
					<li style="width: 33%;" class="float-l li-content">
						<span style="padding-left: 1rem; color: #d40000;"><strong>${orderVO.orderStateNm}</strong></span>
					</li>
					<li class="float-l li-title text-c">
						<label><strong>주 문 일</strong></label>
					</li>
					<li style="width: 35%;" class="float-l li-content">
						<span style="padding-left: 1rem;">${orderVO.orderDt}
							<%-- <fmt:parseDate value="${orderVO.orderDt}" var="order_date" pattern="yyyyMMdd"/> --%>
							<%-- <fmt:formatDate value="${order_date}" pattern="yyyy-MM-dd" /> --%>
						</span>
					</li>
					<li class="float-l li-title text-c">
						<label><strong>주문번호</strong></label>
					</li>
					<li style="width: 33%;" class="float-l li-content">
						<span style="padding-left: 1rem;">${orderVO.orderSeq}</span>
					</li>
					<li class="float-l li-title text-c">
						<label><strong>주문금액</strong></label>
					</li>
					<li style="width: 35%;" class="float-l li-content">
						<span style="padding-left: 1rem;"><strong><fmt:formatNumber value="${orderVO.orderAmount}"/> 원</strong></span>
					</li>
					<li class="float-l li-title text-c">
						<label><strong>결제방법</strong></label>
					</li>
					<li style="width: 83%;" class="float-l li-content">
						<span style="padding-left: 1rem;">${orderVO.payTypeNm}</span>
					</li>
				</ul>
<%-- <%
		if ("11".equals(orderVO.getPayType())) {
%> --%>
				<!-- 신용카드 -->
				<ul class="payResult" style="position: relative; top: -3px;">
					<li class="float-l li-title text-c">
						<label><strong>승인번호</strong></label>
					</li>
					<li style="width: 33%;" class="float-l li-content">
						<span style="padding-left: 1rem;">${orderVO.auth_no}</span>
					</li>
					<li class="float-l li-title text-c">
						<label><strong>승인일시</strong></label>
					</li>
					<li style="width: 35%;" class="float-l li-content">
						<span style="padding-left: 1rem;">
							<fmt:parseDate value="${orderVO.tran_date}" var="tran_date" pattern="yyyyMMddHHmmss"/>
							<fmt:formatDate value="${tran_date}" pattern="yyyy-MM-dd HH:mm:ss" />
						</span>
					</li>
					<li class="float-l li-title text-c">
						<label><strong>카 드 사</strong></label>
					</li>
					<li style="width: 33%;" class="float-l li-content">
						<span style="padding-left: 1rem;">${orderVO.acquirer_nm}</span>
					</li>
					<li class="float-l li-title text-c">
						<label><strong>결제금액</strong></label>
					</li>
					<li style="width: 35%;" class="float-l li-content">
						<span style="padding-left: 1rem; color: #d40000;""><strong><fmt:formatNumber value="${orderVO.amount}"/> 원</strong></span>
					</li>
				</ul>
<%-- <%
		}
		else if ("21".equals(payVO.getPay_type())) {
%> --%>
				<!-- 계좌이체 -->
				<ul class="payResult" style="position: relative; top: -3px;">
					<li class="float-l li-title text-c">
						<label><strong>은 행 명</strong></label>
					</li>
					<li style="width: 33%;" class="float-l li-content">
						<span style="padding-left: 1rem;">${orderVO.bank_nm}</span>
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
						<span style="padding-left: 1rem; color: #d40000;""><strong><fmt:formatNumber value="${orderVO.amount}"/> 원</strong></span>
					</li>
				</ul>
<%-- <%
		}
		else if ("22".equals(payVO.getPay_type())) {
%> --%>
				<!-- 무통장입금 -->
				<ul class="payResult" style="position: relative; top: -3px;">
					<li class="float-l li-title text-c">
						<label><strong>은 행 명</strong></label>
					</li>
					<li style="width: 33%;" class="float-l li-content">
						<span style="padding-left: 1rem;">${orderVO.bank_nm}</span>
					</li>
					<li class="float-l li-title text-c">
						<label><strong>계좌번호</strong></label>
					</li>
					<li style="width: 35%;" class="float-l li-content">
						<span style="padding-left: 1rem;">${orderVO.account_no}</span>
					</li>
					<li class="float-l li-title text-c">
						<label><strong>예금주명</strong></label>
					</li>
					<li style="width: 33%;" class="float-l li-content">
						<span style="padding-left: 1rem;">${orderVO.deposit_nm}</span>
					</li>
					<li class="float-l li-title text-c">
						<label><strong>입금기한</strong></label>
					</li>
					<li style="width: 35%;" class="float-l li-content">
						<span style="padding-left: 1rem;">
							<fmt:parseDate value="${orderVO.expire_date}" var="expire_date" pattern="yyyyMMddHHmmss"/>
							<fmt:formatDate value="${expire_date}" pattern="yyyy-MM-dd HH:mm:ss" /> 까지
						</span>
					</li>
					<li class="float-l li-title text-c">
						<label><strong>입 금 액</strong></label>
					</li>
					<li style="width: 35%;" class="float-l li-content">
						<span style="padding-left: 1rem; color: #d40000;""><strong><fmt:formatNumber value="${orderVO.amount}"/> 원</strong></span>
					</li>
				</ul>
<%-- <%
		}
	}
}
%> --%>
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
					<button id="btn-list" type="button" class="k-button k-primary float-r" style="margin-top: 2rem;">확인</button>
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
	//확인 버튼 이벤트
	$('#btn-list').click(function(){
		location.href = '<c:url value="/cpns/orders/view" />' + document.location.search;
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