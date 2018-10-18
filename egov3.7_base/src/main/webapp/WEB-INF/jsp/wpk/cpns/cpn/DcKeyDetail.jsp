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
			<button id="btn-list" type="button" class="k-button btn-action float-r" style="margin-left:.5rem;">목록</button>
			<button id="btn-cancel" type="button" class="k-button btn-action float-r hidden" style="margin-left:.5rem;">취소</button>
			<button id="btn-edit" type="button" class="k-button k-primary btn-action float-r hidden disabled">수정</button>
			<button id="btn-save" type="button" class="k-button k-primary btn-action float-r hidden">저장</button>
		</div>
		<div id="contentBox">
			<div class="main-section k-content pd-3">
				<form id="dtlForm">
					<ul class="fieldlist">
						<li>
							<label for="input-parkNm" class="required">주차장</label>
							<input id="input-parkNm" type="text" class="k-textbox op-1" style="width: 100%;" value="<c:out value='${cpnVO.parkNm}' escapeXml='true' />" />
						</li>
						<li>
							<label for="input-cpnCd" class="required">할인키코드</label>
							<input id="input-cpnCd" type="text" class="k-textbox op-1" style="width: 100%;" value="<c:out value='${cpnVO.cpnCd}' escapeXml='true' />" />
						</li>
						<li>
							<label for="input-cpnNm" class="required">할인키명</label>
							<input id="input-cpnNm" name="할인키명" type="text" class="k-textbox op-1 editable" style="width: 100%;" 
								value="<c:out value='${cpnVO.cpnNm}' escapeXml='true' />" autocomplete="off" data-maxLen="30" required />
						</li>
						<li>
							<label for="input-price" class="required">판매가격</label>
							<input id="input-price" name="판매가격" type="number" class="k-textbox op-1 editable" style="width: 100%;" value="<c:out value='${cpnVO.price}' escapeXml='true' />" 
								min="0" max="1000000" step="10" autocomplete="off" data-maxLen="10" required placeholder="0 ~ 1,000,000까지 10단위로 입력해 주세요." 
								validationMessage="{0}은(는) 0 ~ 1,000,000까지 10단위 숫자만 입력 가능합니다."
								data-required-msg="{0}은(는) 필수 입력 항목입니다." />
						</li>
						<li>
							<label for="sel-useYn" class="required">상태</label>
							<input id="sel-useYn" name="상태" class="op-1 editable" style="width: 100%;" />
						</li>
						<li>
							<label for="input-memo">메모</label>
							<textarea id="input-memo" name="메모" class="k-textbox op-1 editable" style="width: 100%;" rows="5" data-maxLen="200" ><c:out value='${cpnVO.remark}' escapeXml='true' /></textarea>
						</li>
						<li style="width: 49%;" class="float-l">
							<label for="input-regDt">등록일</label>
							<input id="input-regDt" type="text" class="k-textbox op-1" style="width: 100%;" value="<c:out value='${cpnVO.regDt}' escapeXml='true' />" />
						</li>
						<li style="width: 49%; padding-left: 2%;" class="float-l">
							<label for="input-regID">등록자</label>
							<input id="input-regID" type="text" class="k-textbox op-1" style="width: 100%;" value="<c:out value='${cpnVO.regId}' escapeXml='true' />" />
						</li>
						<li style="width: 49%;" class="float-l">
							<label for="input-updtDt">수정일</label>
							<input id="input-updtDt" type="text" class="k-textbox op-1" style="width: 100%;" value="<c:out value='${cpnVO.updtDt}' escapeXml='true' />" />
						</li>
						<li style="width: 49%; padding-left: 2%;" class="float-l">
							<label for="input-updtID">수정자</label>
							<input id="input-updtID" type="text" class="k-textbox op-1" style="width: 100%;" value="<c:out value='${cpnVO.updtId}' escapeXml='true' />" />
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
	
	//전체 항목 비활성화
	$('.k-textbox').prop('disabled', true).addClass('k-state-disabled');
	
	//상태 combobox 초기화
	var useYn = $('#sel-useYn').kendoComboBox({
		filter        : 'none',
		dataTextField : 'useYnNm',
		dataValueField: 'useYnCd',
		clearButton   : false,
		dataSource    : [
			{useYnNm: '사용',     useYnCd: '1'},
			{useYnNm: '사용불가', useYnCd: '0'}
		]
	}).data("kendoComboBox");
	
	//combobx 비활성화
	useYn.select(function(dataItem) {
		return dataItem.useYnCd === '<c:out value="${cpnVO.useYn}" />';
	});
	useYn.enable(false);
	
	//유효성 검사 설정
	var validator = $("#dtlForm").kendoValidator({
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
	
	//상태 [사용]인 경우만 수정 버튼 활성화 및 이벤트 바인딩
	if ('1' == '<c:out value="${cpnVO.useYn}" />') {
		
		//입력항목 상태 전환
		var fnToggleStatus = function(editable) {
			if (editable) {
				$('.k-textbox.editable').prop('disabled', false).removeClass('k-state-disabled');
				useYn.enable(true);
				useYn.input.attr("readonly", true).on("keydown", function(e) {
					if (e.keyCode === 8) {
						e.preventDefault();
					}
				});
			}
			else {
				$('.k-textbox').prop('disabled', true).addClass('k-state-disabled');
				useYn.enable(false);
			}
			
			$('.k-button.btn-action').toggleClass('hidden');
		};
		
		//저장 action
		var fnSaveAction = function() {
			if (validator.validate()) {
				var data = {
					useYn  : useYn.value(),
					cpnNm  : $.trim($('#input-cpnNm').val()),
					price  : $('#input-price').val(),
					remark : $.trim($('#input-memo').val()),
					cpnType: '<c:out value="${cpnType}" escapeXml="true" />'
				};
				
				$.ajax({
					type       : 'PUT',
					url        : '<c:url value="/cpns/cpns/" />' + '${cpnVO.cpnSeq}',
					contentType: 'application/json; charset=utf-8',
					dataType   : 'json',
					data       : JSON.stringify(data),
					success    : function(result, status, jqXHR) {
						if (result.retMsg == 'common.message.success') {
							fnAlertSuccess($('#dialog'), {
								content: '할인키 정보를 수정하였습니다.',
								actions: [
									{
										text   : 'OK',
										primary: true,
										action : function() {
											location.href = '<c:url value="/cpns/cpns/" />' + '${cpnVO.cpnSeq}' + document.location.search;
										}
									}
								]
							}).data("kendoDialog").open();
						}
						else {
							fnAlertError($('#dialog'), {
								content: '할인키 정보 수정에 실패하였습니다.',
								actions: [{text   : 'Ok', primary: true}]
							}).data("kendoDialog").open();
						}
					},
					error      : function(jqXHR, status, error) {
						fnAlertError($('#dialog'), {
							content: '할인키 정보 수정에 실패하였습니다.',
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
		
		$('#btn-edit').removeClass('hidden disabled');
		
		//수정 버튼 이벤트
		$('#btn-edit').click(function(e) {
			e.preventDefault();
			
			fnToggleStatus(true);
		});
		
		//저장 버튼 이벤트
		$('#btn-save').click(function(e) {
			e.preventDefault();
			
			fnConfirm($('#dialog'), {
				content: '할인키 정보를 수정하시겠습니까?',
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
				content: '수정 내용이 저장되지 않았습니다.<br/>수정을 취소하시겠습니까?',
				actions: [
					{
						text   : 'OK', 
						primary: true,
						action : function() {
							$('#dtlForm')[0].reset();
							
							setTimeout(function() {
								useYn.select(function(dataItem) {
									return dataItem.useYnCd === '<c:out value="${cpnVO.useYn}" />';
								});
							}, 50);
							
							fnToggleStatus(false);
							
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
		
	}
	
	//목록 버튼 이벤트
	$('#btn-list').click(function(){
		location.href = '<c:url value="/cpns/cpns/view/" />' + '<c:out value="${cpnVO.cpnType}" />' + document.location.search;
	});
});
</script>
</body>
</html>