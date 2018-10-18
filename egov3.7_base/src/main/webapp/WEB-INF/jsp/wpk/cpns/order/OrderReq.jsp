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
<c:set var="pageTitle"><spring:message code="comCopSecRgm.title"/></c:set>


<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="<c:url value='/css/font-awesome.css?v=20180601003' />" />
	<link rel="stylesheet" href="<c:url value='/css/font-awesome-ie7.css?v=20180601003' />" />
	<link rel="stylesheet" href="<c:url value='/js/kui/styles/kendo.common-material.min.css?v=20180601001' />" />
	<link rel="stylesheet" href="<c:url value='/js/kui/styles/kendo.material.min.css?v=20180601001' />" />
	<link rel="stylesheet" href="<c:url value='/js/kui/styles/kendo.material.mobile.min.css?v=20180601001' />" />
	<link rel="stylesheet" href="<c:url value='/css/common.css?v=20180601034' />" />
	
	<script src="<c:url value='/js/jquery/jquery-3.3.1.js?v=20180601001' />" ></script>
	<script src="<c:url value='/js/common.js?v=20180601015' />" ></script>
	<script src="<c:url value='/js/kui/js/kendo.ui.core.min.js?v=20180601001' />"></script>
	<script src="<c:url value='/js/kui/js/cultures/kendo.culture.ko-KR.min.js?v=20180601001' />"></script>
	<script src="<c:url value='/js/kui/js/kendo.dialog.min.js?v=20180601001' />"></script>
	<script src="<c:url value='/js/kui/js/kendo.validator.min.js?v=20180601001' />"></script>
</head>
<body>
<div id="main">
	<div id="contentWrap">
		<div id="contentBox">
			<div class="main-section k-content pd-3">
				<form id="orderForm" name="orderForm" data-role="validator" novalidate="novalidate" method="POST">
					<ul class="fieldlist">
						<li>
							<label for="selCoupon" class="required">쿠폰선택</label>
							<input id="selCoupon" name="쿠폰선택" style="width: 100%;" />
						</li>
					</ul>
					<ul id="orderList" class="orderList"></ul>
				</form>
				<div class="btn-section pdr-0" style="padding-top: 2rem;">
					<button id="btn-order" type="button" class="k-button large btn-action float-r k-state-disabled" style="margin-top: 2rem;">구매하기</button>
				</div>
			</div>
		</div>
	</div>
</div>
<div id="dialog"></div>

<script>
$(document).ready(function () {
	
	var orderTmpl = [
		'<li class="pd-2">',
		'<span id="btn-close-{cpnCd}" class="k-icon k-icon-14 k-i-close pointer float-r" style="padding-bottom: 1rem; top: -8px;"></span>',
		'<label id="label-cpnNm-{cpnCd}" style="padding-bottom: 1rem; font-size: .9rem;">{cpnNm}</label>',
		'<span style="font-size: .9rem; display: inline-block; position: relative; padding-left: 30px; top: 6px;">X</span>',
		'<span id="span-price-{cpnCd}" style="font-size: .9rem; display: inline-block; position: relative; padding-left: 30px; top: 6px;"></span>',
		'<span id="span-amount-{cpnCd}" class="float-r" style="font-size: 1.05rem; display: inline-block; position: relative; padding-top: 10px; padding-right: 20px;">0원</span>',
		'<input id="input-qty-{cpnCd}" name="input-qty-{cpnCd}" type="number" class="k-textbox float-l" style="width: 30%;" value="0" ',
		'min="{qtyMin}" max="{qtyMax}" step="10" autocomplete="off" data-maxLen="10" required placeholder="구매수량을 입력해 주세요." ',
		'validationMessage="구매수량은 {qtyMinC} ~ {qtyMaxC}까지 10단위 숫자만 입력 가능합니다." data-required-msg="구매수량은 필수 입력 항목입니다." />',
		'<input type="hidden" id="cpnSeq" name="cpnSeq" value="{cpnSeq}" />',
		'<input type="hidden" id="cpnCd" name="cpnCd" value="{cpnCd}" />',
		'<input type="hidden" id="cpnNm" name="cpnNm" value="{cpnNm}" />',
		'<input type="hidden" id="qty" name="qty" value="0" />',
		'<input type="hidden" id="price" name="price" value="{price}" />',
		'<input type="hidden" id="amount" name="amount" value="0" />',
		'</li>'
	].join('');
	
	//구매버튼 활성/비활성화
	var fnStateBtnOrder = function() {
		if ($('#orderList li').length > 0) {
			$('#btn-order').addClass('k-primary').removeClass('k-state-disabled');
		}
		else {
			$('#btn-order').addClass('k-state-disabled').removeClass('k-primary');
		}
	};
	
	//쿠폰 combobox 초기화
	var coupon = $('#selCoupon').kendoComboBox({
		filter          : 'contains',
		dataTextField   : 'cpnNm',
		dataValueField  : 'cpnCd',
		syncValueAndText: false,
		clearButton     : false,
		placeholder     : '쿠폰 선택',
		change          : function(e) {
			
			var selected = this.dataItem();
			
			if (selected != undefined && $('#orderList li.' + selected.cpnCd).length == 0) {
				var orderItem = $(orderTmpl.replace(/\{cpnSeq\}/g, selected.cpnSeq)
											.replace(/\{cpnCd\}/g, selected.cpnCd)
											.replace(/\{cpnNm\}/g, selected.cpnNm)
											.replace(/\{qtyMin\}/g, selected.qtyMin)
											.replace(/\{qtyMax\}/g, selected.qtyMax)
											.replace(/\{qtyMinC\}/g, kendo.toString(selected.qtyMin, 'n0'))
											.replace(/\{qtyMaxC\}/g, kendo.toString(selected.qtyMax, 'n0')));
				$('#orderList').append(orderItem);
				$(orderItem).addClass(selected.cpnCd);
				$('#span-price-' + selected.cpnCd).text(kendo.toString(selected.price, 'n0') + '원');
				$(orderItem).find('#cpnCd').val(selected.cpnCd);
				$(orderItem).find('#cpnNm').val(selected.cpnNm);
				$(orderItem).find('#price').val(selected.price);
				$('#input-qty-' + selected.cpnCd).blur(function() {
					var amount = $(this).val() * $(orderItem).find('#price').val();
					$('#span-amount-' + selected.cpnCd).text(kendo.toString(amount, 'n0') + '원');
					$(orderItem).find('#qty').val($(this).val());
					$(orderItem).find('#amount').val(amount);
				});
				
				//삭제버튼 이벤트
				$(orderItem).find('#btn-close-' + selected.cpnCd).click(function() {
					$(this).closest('li').remove();
					fnStateBtnOrder();
				});
			}
			
			fnStateBtnOrder();
		}
	}).data('kendoComboBox');
	//쿠폰 리스트 셋팅
	coupon.setDataSource(new kendo.data.DataSource({data: $.parseJSON('${custCpnList}')}));
	
	var validator = $("#orderForm").kendoValidator({
		rules   : {
			maxDataLength: function(input){
				if (input.is('[data-maxLen]') && input.val() != '') {
					var maxLen = input.attr('data-maxLen');
					return $.trim(input.val()).length <= maxLen;
				}
				return true;
			}
		},
		messages: {
			required     : '구매수량은 필수 입력 항목입니다.',
			maxDataLength: function(input) {
				if (input.is('[data-maxLen]') && input.val() != '') {
					var name = input.attr('name'),
						maxLen = input.attr('data-maxLen');
					return '구매수량은 ' + maxLen + '자 이하로 입력해 주세요.';
				}
			}
		}
	}).data("kendoValidator");
	
	//구매 버튼 이벤트
	$('#btn-order').click(function(e) {
		e.preventDefault();
		
		if ($(this).hasClass('k-state-disabled')) {
			return false;
		}
		
		if (validator.validate()) {
			
			$.each($('#orderList li'), function(idx, val) {
				$(val).find('#cpnSeq').attr('name', 'orderDetail[' + idx + '].cpnSeq');
				$(val).find('#cpnCd').attr('name', 'orderDetail[' + idx + '].cpnCd');
				$(val).find('#cpnNm').attr('name', 'orderDetail[' + idx + '].cpnNm');
				$(val).find('#qty').attr('name', 'orderDetail[' + idx + '].qty');
				$(val).find('#price').attr('name', 'orderDetail[' + idx + '].price');
				$(val).find('#amount').attr('name', 'orderDetail[' + idx + '].amount');
			});
			
			document.orderForm.action = '<c:url value="/cpns/order/cnfrm/"/>${cpnType}';
			document.orderForm.submit();
		}
		else {
			fnAlertWarn($('#dialog'), {
				content: '구매수량을 입력해 주세요.',
				actions: [{text   : 'Ok', primary: true}]
			}).data("kendoDialog").open();
			
			return true;
		}
	});
});
</script>
</body>
</html>