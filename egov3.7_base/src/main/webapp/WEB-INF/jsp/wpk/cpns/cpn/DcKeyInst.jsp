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
	<%-- <link rel="stylesheet" href="<c:url value='/js/kui/css/kendo.common.min.css?v=20180601001' />" /> --%>
	<%-- <link rel="stylesheet" href="<c:url value='/js/kui/styles/kendo.default.min.css?v=20180601001' />" /> --%>
	<link rel="stylesheet" href="<c:url value='/js/kui/styles/kendo.common-material.min.css?v=20180601001' />" />
	<link rel="stylesheet" href="<c:url value='/js/kui/styles/kendo.material.min.css?v=20180601001' />" />
	<link rel="stylesheet" href="<c:url value='/js/kui/styles/kendo.material.mobile.min.css?v=20180601001' />" />
	<link rel="stylesheet" href="<c:url value='/css/common.css?v=20180601029' />" />
	
	<script src="<c:url value='/js/jquery/jquery-3.3.1.js?v=20180601001' />" ></script>
	<script src="<c:url value='/js/common.js?v=20180601016' />" ></script>
	<script src="<c:url value='/js/kui/js/kendo.ui.core.min.js?v=20180601001' />"></script>
	<script src="<c:url value='/js/kui/js/cultures/kendo.culture.ko-KR.min.js?v=20180601001' />"></script>
	<script src="<c:url value='/js/kui/js/kendo.dialog.min.js?v=20180601001' />"></script>
	<script src="<c:url value='/js/kui/js/kendo.validator.min.js?v=20180601001' />"></script>
	<script src="<c:url value='/js/kui/js/cultures/kendo.culture.ko-KR.min.js?v=20180601001' />"></script>
</head>
<body>
<div id="main">
	<div id="contentWrap">
		<div class="btn-section pdr-0" style="padding-bottom: 1rem;">
			<button id="btn-cancel" class="k-button btn-action float-r" style="margin-left:.5rem;">취소</button>
			<button id="btn-save" class="k-button k-primary btn-action float-r">저장</button>
		</div>
		<div id="contentBox">
			<div class="main-section k-content pd-3">
				<form id="instForm" data-role="validator" novalidate="novalidate">
					<ul class="fieldlist">
						<li>
							<label for="selPark" class="required">주차장</label>
							<input id="selPark" name="주차장" style="width: 100%;" required />
						</li>
						<li>
							<label for="input-cpnCd" class="required" style="display: inline-block;">할인키코드</label>
							<button id="btn-cpnCdDupChk" type="button" class="k-button slim chocolate float-r" style="position: relative; top: -5px;">
								<span class="k-icon k-icon-13 k-i-check" style="top: -1px;"></span> 할인키코드 중복확인
							</button>
							<input id="input-cpnCd" name="할인키코드" type="text" class="k-textbox" style="width: 100%;" value="" autocomplete="off" 
								data-maxLen="5" required placeholder="영숫자만 입력 가능합니다." />
						</li>
						<li>
							<label for="input-cpnNm" class="required">할인키명</label>
							<input id="input-cpnNm" name="할인키명" type="text" class="k-textbox" style="width: 100%;" value="" autocomplete="off" 
								data-maxLen="30" required />
						</li>
						<li>
							<label for="input-price" class="required">판매가격</label>
							<input id="input-price" name="판매가격" type="number" class="k-textbox" style="width: 100%;" value=""  
								min="0" max="1000000" step="10" autocomplete="off" data-maxLen="10" required placeholder="0 ~ 1,000,000까지 10단위로 입력해 주세요." 
								validationMessage="{0}은(는) 0 ~ 1,000,000까지 10단위 숫자만 입력 가능합니다."
								data-required-msg="{0}은(는) 필수 입력 항목입니다." />
						</li>
						<li>
							<label for="input-memo">메모</label>
							<textarea id="input-memo" name="메모" class="k-textbox" style="width: 100%;" rows="5" data-maxLen="200" ></textarea>
						</li>
					</ul>
				</form>
			</div>
		</div>
	</div>
</div>
<div id="dialog"></div>

<script>
$(document).ready(function () {
	
	//할인키코드 중복체크 여부
	var dupChecked = false;
	
	//주차장 combobox 초기화
	var park = $('#selPark').kendoComboBox({
		filter          : 'contains',
		dataTextField   : 'parkNm',
		dataValueField  : 'parkCd',
		syncValueAndText: false,
		placeholder     : '주차장 선택',
		template        : '#:data.parkCd# #:data.parkNm#',
		dataSource      : {
			transport: {
				read: function(options){
					$.ajax({
						url     : '<c:url value="/parks"/>',
						dataType: 'json',
						data    : {useYn: '1'},
						success : function(result, status, jqXHR) {
							options.success(result.parkList);
						},
						error   : function(jqXHR, status, error) {
							// notify the data source that the request failed
							//options.error(result.parkList);
						}
					});
				}
			}
		}
	}).data('kendoComboBox');
	
	//유효성 검사 설정
	var validator = $("#instForm").kendoValidator({
		rules   : {
			maxDataLength: function(input){
				if (input.is('[data-maxLen]') && input.val() != '') {
					var maxLen = input.attr('data-maxLen');
					return $.trim(input.val()).length <= maxLen;
				}
				return true;
			},
			cdFormat     : function(input) {
				if (input.is('[id="input-cpnCd"]') && input.val() != '') {
					return fnFormatCd(input);
				}
				return true;
			}
		},
		messages: {
			required     : '{0}은(는) 필수 입력 항목입니다.',
			maxDataLength: function(input) {
				if (input.is('[data-maxLen]') && input.val() != '') {
					var name = input.attr('name'),
						maxLen = input.attr('data-maxLen');
					return name + '은(는) ' + maxLen + '자 이하로 입력해 주세요.';
				}
			},
			cdFormat   : '할인키코드는 영숫자 및 특수문자( _ )만 입력 가능합니다.'
		}
	}).data("kendoValidator");
	
	//주차장 변경 이벤트
	park.bind('change', function() {
		dupChecked = false;
	});
	
	//할인키코드 변경 이벤트
	$('#input-cpnCd').change(function() {
		dupChecked = false;
	});
	
	//할인키코드 중복체크 이벤트
	$('#btn-cpnCdDupChk').click(function(e) {
		e.preventDefault();
		//할인키코드 중복체크 여부
		dupChecked = false;
		
		var chkRetParkCd = validator.validateInput($('input[id="selPark"]')),
			chkRetCpnCd = validator.validateInput($('input[id="input-cpnCd"]'));
		
		if (!(chkRetParkCd && chkRetCpnCd)) {
			fnAlertError($('#dialog'), {
				content: '주차장 및 할인키코드는 필수 입력 항목입니다.',
				actions: [{text   : 'Ok', primary: true}]
			}).data("kendoDialog").open();
			
			return false;
		}
		
		var parkCd = park.value(),
			cpnCd = $.trim($('#input-cpnCd').val());
		
		$.ajax({
			type    : 'GET',
			url     : '<c:url value="/cpns/cpns/cpn/" />' + cpnCd,
			dataType: 'json',
			data    : {parkCd: parkCd, cpnType: '<c:out value="${cpnType}" escapeXml="true" />'},
			success : function(result, status, jqXHR) {
				if (result.retMsg == 'common.message.success') {
					
					if (result.checkResult) {
						fnAlertInfo($('#dialog'), {
							content: '사용할 수 있는 할인키코드입니다.',
							actions: [
								{
									text   : 'OK',
									primary: true,
									action : function() {
										dupChecked = true;
									}
								}
							]
						}).data("kendoDialog").open();
					}
					else {
						fnAlertWarn($('#dialog'), {
							content: '동일한 할인키코드가 존재합니다.<br/>다른 할인키코드를 입력해 주세요.',
							actions: [
								{
									text   : 'OK',
									primary: true,
									action : function() {
										dupChecked = false;
										$('#input-cpnCd').focus();
										$('#input-cpnCd').select();
									}
								}
							]
						}).data("kendoDialog").open();
					}
				}
				else {
					fnAlertError($('#dialog'), {
						content: '할인키코드 중복체크가 실패하였습니다.',
						actions: [{text   : 'Ok', primary: true}]
					}).data("kendoDialog").open();
				}
			},
			error      : function(jqXHR, status, error) {
				fnAlertError($('#dialog'), {
					content: '할인키코드 중복체크가 실패하였습니다.',
					actions: [{text   : 'Ok', primary: true}]
				}).data("kendoDialog").open();
			}
		});
	});
	
	//저장 action
	var fnSaveAction = function() {
		
		//할인키코드 중복체크 여부
		if (!dupChecked) {
			fnAlertWarn($('#dialog'), {
				content: '할인키코드 중복여부를 확인해 주세요.',
				actions: [{text   : 'Ok', primary: true}]
			}).data("kendoDialog").open();
			
			return true;
		}
		
		if (validator.validate()) {
			var data = {
				parkCd : park.value(),
				cpnCd  : $.trim($('#input-cpnCd').val()),
				cpnNm  : $.trim($('#input-cpnNm').val()),
				price  : $('#input-price').val(),
				remark : $.trim($('#input-memo').val()),
				cpnType: '<c:out value="${cpnType}" escapeXml="true" />'
			};
			
			$.ajax({
				type       : 'POST',
				url        : '<c:url value="/cpns/cpns/cpn" />',
				contentType: 'application/json; charset=utf-8',
				dataType   : 'json',
				data       : JSON.stringify(data),
				success    : function(result, status, jqXHR) {
					if (result.retMsg == 'common.message.success') {
						fnAlertSuccess($('#dialog'), {
							content: '할인키 정보를 저장하였습니다.',
							actions: [
								{
									text   : 'OK',
									primary: true,
									action : function() {
										location.replace('<c:url value="/cpns/cpns/cpn/iview/${cpnType}" />');
									}
								}
							]
						}).data("kendoDialog").open();
					}
					else {
						fnAlertError($('#dialog'), {
							content: '할인키 정보 저장에 실패하였습니다.',
							actions: [{text   : 'Ok', primary: true}]
						}).data("kendoDialog").open();
					}
				},
				error      : function(jqXHR, status, error) {
					fnAlertError($('#dialog'), {
						content: '할인키 정보 저장에 실패하였습니다.',
						actions: [{text   : 'Ok', primary: true}]
					}).data("kendoDialog").open();
				}
			});
		}
		else {
			fnAlertWarn($('#dialog'), {
				content: '입력 내용이 올바르지 않은 항목이 존재합니다.<br/>입력 내용을 확인해 주세요.',
				actions: [{text   : 'Ok', primary: true}]
			}).data("kendoDialog").open();
			
			return true;
		}
	};
		
	//저장 버튼 이벤트
	$('#btn-save').click(function(e) {
		e.preventDefault();
		
		fnConfirm($('#dialog'), {
			content: '할인키 정보를 저장하시겠습니까?',
			actions: [
				{
					text   : 'OK', 
					primary: true,
					action : fnSaveAction
				},
				{
					text   : 'CANCEL'
				}
			]
		}).data("kendoDialog").open();
	});
	
	//취소 버튼 이벤트
	$('#btn-cancel').click(function(e) {
		e.preventDefault();
		
		fnConfirm($('#dialog'), {
			content: '입력 내용이 저장되지 않았습니다.<br/>입력 내용을 초기화하시겠습니까?',
			actions: [
				{
					text   : 'OK', 
					primary: true,
					action : function() {
						$('#instForm')[0].reset();
						//할인키 중복체크 여부 초기화
						dupChecked = false;
						//유효성검사 메세지 초기화
						validator.hideMessages();
					}
				},
				{
					text   : 'CANCEL'
				}
			]
		}).data("kendoDialog").open();
	});
});
</script>
</body>
</html>