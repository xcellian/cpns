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
	<title>${pageTitle} <spring:message code="title.list" /></title>
	<link rel="stylesheet" href="<c:url value='/css/font-awesome.css?v=20180601003' />" />
	<link rel="stylesheet" href="<c:url value='/css/font-awesome-ie7.css?v=20180601003' />" />
	<link rel="stylesheet" href="<c:url value='/js/kui/styles/kendo.common-material.min.css?v=20180601001' />" />
	<link rel="stylesheet" href="<c:url value='/js/kui/styles/kendo.material.min.css?v=20180601001' />" />
	<link rel="stylesheet" href="<c:url value='/js/kui/styles/kendo.material.mobile.min.css?v=20180601001' />" />
	<link rel="stylesheet" href="<c:url value='/css/common.css?v=20180601021' />" />
	<link rel="stylesheet" href="<c:url value='/js/bootstrap-3.3.2-dist/css/bootstrap.min.css?v=20180601002' />" />
	<link rel="stylesheet" href="<c:url value='/js/bootstrap-3.3.2-dist/css/bootstrap-theme.css?v=20180601001' />" />
	<link rel="stylesheet" href="<c:url value='/js/dataTables/DataTables-1.10.18/css/dataTables.bootstrap.css?v=20180601001' />" />
	<link rel="stylesheet" href="<c:url value='/js/dataTables/Buttons-1.5.2/css/buttons.bootstrap.css?v=20180601001' />" />
	
	<script src="<c:url value='/js/jquery/jquery-3.3.1.js?v=20180601001' />" ></script>
	<script src="<c:url value='/js/common.js?v=20180601002' />" ></script>
	<script src="<c:url value='/js/kui/js/kendo.ui.core.min.js?v=20180601001' />"></script>
	<script src="<c:url value='/js/kui/js/cultures/kendo.culture.ko-KR.min.js?v=20180601001' />"></script>
	<script src="<c:url value='/js/dataTables/DataTables-1.10.18/js/jquery.dataTables.js?v=20180601001' />" ></script>
	<script src="<c:url value='/js/dataTables/DataTables-1.10.18/js/dataTables.bootstrap.js?v=20180601001' />" ></script>
	<script src="<c:url value='/js/dataTables/Select-1.2.6/js/dataTables.select.js?v=20180601001' />" ></script>
	<script src="<c:url value='/js/dataTables/Buttons-1.5.2/js/dataTables.buttons.js?v=20180601001' />" ></script>
	<script src="<c:url value='/js/dataTables/Buttons-1.5.2/js/buttons.bootstrap.js?v=20180601001' />" ></script>

</head>
<body>
<div id="main">
	<div class="tabset">
		<!-- Tab 1 -->
		<input type="radio" name="tabset" id="tab-cpn" value="${cpnTypeCoupon}" aria-controls="cpn" checked>
		<label for="tab-cpn">쿠폰 설정</label>
		<!-- Tab 2 -->
		<input type="radio" name="tabset" id="tab-dcKey" value="${cpnTypeDcKey}" aria-controls="dcKey">
		<label for="tab-dcKey">할인키 설정</label>
		
		<div class="tab-panels">
			<section id="section-cpn" class="tab-panel">
			</section>
			<section id="section-dcKey" class="tab-panel">
			</section>
		</div>
	</div>
	<div id="contentWrap" style="margin: .6rem 3.8rem 0; margin-bottom: 0;" class="">
		<ul class="listItems">
			<li style="width: 50%; padding-bottom: 2rem;">
				<span class="k-icon k-icon-24 k-i-gear"></span>
				<span style="font-size: 1.2rem; vertical-align: bottom;">${custVO.custNm} - <span class="cpnTitle" style="vertical-align: bottom;">쿠폰</span> 설정</span>
			</li>
			<li style="width: 50%; padding-bottom: 2rem;">
				<div class="btn-section pdr-0">
					<button id="btn-list" type="button" class="k-button btn-action float-r" style="margin-left:.5rem;">목록</button>
					<button id="btn-refresh" type="button" class="k-button btn-action float-r" style="margin-left:.5rem;">새로고침</button>
					<button id="btn-save" type="button" class="k-button k-primary btn-action float-r">저장</button>
				</div>
			</li>
			<li style="width: 40%;">
				<label for="gridCpnWrapper" class="contentSubTitle mg-0" style="display: inline-block; padding-bottom: .7rem;">
					<span class="k-icon k-icon-20 k-i-folder"></span> <span class="cpnTitle">쿠폰</span> 목록
				</label>
				<div id="gridCpnWrapper" style="width: 100%;">
					<table id="gridCpnList" class="table table-striped table-bordered display nowrap hover" cellspacing="0" width="100%"></table>
				</div>
			</li>
			<li style="width: 5%; padding-top: 6.5rem; margin: auto; text-align: center;">
				<div class="k-listbox-toolbar">
					<ul class="k-reset">
						<li>
							<a id="btn-to" class="k-button k-button-icon k-state-disabled" data-command="transferTo" title="추가" aria-label="Transfer To" role="button">
								<span class="k-icon k-i-arrow-60-right"></span>
							</a>
						</li>
						<li style="padding-top: 1rem;">
							<a id="btn-from" class="k-button k-button-icon k-state-disabled" data-command="transferFrom" title="삭제" aria-label="Transfer From" role="button" tabindex="-1">
								<span class="k-icon k-i-arrow-60-left"></span>
							</a>
						</li>
					</ul>
				</div>
			</li>
			<li style="width: 55%;">
				<label for="gridCustCpnWrapper" class="contentSubTitle mg-0" style="display: inline-block; padding-bottom: .7rem;">
					<span class="k-icon k-icon-20 k-i-folder-add"></span> 입주사 사용 <span class="cpnTitle">쿠폰</span> 목록
				</label>
				<div id="gridCustCpnWrapper" style="width: 100%;">
					<table id="gridCustCpnList" class="table table-striped table-bordered display nowrap hover" cellspacing="0" width="100%"></table>
				</div>
			</li>
		</ul>
	</div>
</div>
<div id="dialog"></div>
<div id="loading-mask"></div>

<script>
$(document).ready(function () {
	
	var cpnType = '${cpnTypeCoupon}',
		cpnTypeTitle = '쿠폰',
		cpnTypeTitlePost = '쿠폰을';
	
	//쿠폰 리스트 초기화
	var gridCpnList = $('#gridCpnList').DataTable({
		processing    : true,
		serverSide    : true,
		responsive    : true,
		scrollX       : true,
		scrollY       : 450,
		scrollCollapse: false,
		paging        : false,
		searching     : false,
		ordering      : false,
		info          : false,
		lengthChange  : false,
		language      : {
			infoEmpty : '',
			processing: '<strong>Wait...</strong>',
			select    : {
				rows: ''
			}
		},
		select        : {
			style: 'multi'
		},
		columns       : [
			{data: 'cpnCd',  name: 'cpnCd',  title: '쿠폰코드'},
			{data: 'cpnNm',  name: 'cpnNm',  title: '쿠폰명'},
			{data: 'price',  name: 'price',  title: '판매금액', className: 'text-right', render: $.fn.dataTable.render.number(',', '.', 0)},
			{data: 'remark', name: 'remark', title: '비고', width: '25%'}
		],
		columnDefs    : [
			{className: 'dt-head-center', searchable: false, targets: '_all'}
		],
		ajax          : {
			type    : 'GET',
			url     : '<c:url value="/cpns/parks/${custVO.parkCd}/cpns"/>',
			dataType: "json",
			data    : function(data) {
				data.cpnType = cpnType;
				data.custSeq = '${custVO.custSeq}';
			},
			dataSrc : function(res) {
				return res.cpnList;
			}
		},
		rowCallback: function(row, data) {
			if (data.isUsed != '') {
				$(row).addClass('k-state-disabled');
			}
		}
	});	
	
	//입주사 쿠폰 리스트 초기화
	var gridCustCpnList = $('#gridCustCpnList').DataTable({
		processing    : true,
		serverSide    : true,
		responsive    : true,
		scrollX       : true,
		scrollY       : 450,
		scrollCollapse: false,
		paging        : false,
		searching     : false,
		ordering      : false,
		info          : false,
		lengthChange  : false,
		language      : {
			infoEmpty : '',
			processing: '<strong>Wait...</strong>',
			select    : {
				rows: ''
			}
		},
		select        : {
			style: 'multi'
		},
		columns       : [
			{data: 'cpnCd',  name: 'cpnCd',  title: '쿠폰코드'},
			{data: 'cpnNm',  name: 'cpnNm',  title: '쿠폰명'},
			{data: 'qtyMin', name: 'qtyMin', title: '최소구매수량', className: 'inline-edit'},
			{data: 'qtyMax', name: 'qtyMax', title: '최대구매수량', className: 'inline-edit'},
			{data: 'price',  name: 'price',  title: '판매금액',     className: 'inline-edit'}
		],
		
		columnDefs    : [
			{className: 'dt-head-center', searchable: false, targets: '_all'},
			{
				render: function(data, type, row) {
					return '<input id="input-qtyMin-' + row.cpnCd 
							+ '" type="number" class="k-textbox" style="width: 100%; padding: 0;" value="' + data + '" min="0" step="10" autocomplete="off" />';
				},
				targets: 2
			},
			{
				render: function(data, type, row) {
					return '<input id="input-qtyMax-' + row.cpnCd 
							+ '" type="number" class="k-textbox" style="width: 100%; padding: 0;" value="' + data + '" min="0" step="10" autocomplete="off" />';
				},
				targets: 3
			},
			{
				render: function(data, type, row) {
					return '<input id="input-price-' + row.cpnCd 
							+ '" type="number" class="k-textbox" style="width: 100%; padding: 0;" value="' + data + '" min="0" max="1000000" step="10" autocomplete="off" />';
				},
				targets: 4
			}
		],
		ajax          : {
			type    : 'GET',
			url     : '<c:url value="/cpns/custs/${custVO.custSeq}/cpns"/>',
			dataType: "json",
			data    : function(data) {
				data.cpnType = cpnType;
			},
			dataSrc : function(res) {
				return res.custCpnList;
			}
		},
		rowCallback: function(row, data) {
			$(row).attr('data-cpnSeq', data.cpnSeq);
		}
	});	
	
	//입주사 리스트 선택 이벤트
	gridCpnList.on('select deselect', function(e, dt, type, indexes) {
		
		if (gridCpnList.rows({selected: true}).count() > 0) {
			$('#btn-to').removeClass('k-state-disabled');
		}
		else {
			$('#btn-to').addClass('k-state-disabled');
		}
	}).on('user-select', function(e, dt, type, cell, originalEvent) {
		
		if ($(originalEvent.target.parentNode).hasClass('k-state-disabled')) {
			e.preventDefault();
		}
	});
	
	//쿠폰 목록에서 입주사 구매 가능 쿠폰 행 상태 변경
	var fnChangeRowState = function(val, isDisable) {
		
		$.each($('#gridCpnList > tbody > tr'), function(idx2, val2) {
			
			if (isDisable) {
				if (!$(val2).hasClass('k-state-disabled') && $(val2).find('td:eq(0)').text() == val) {
					gridCpnList.row(idx2).deselect();
					$(val2).addClass('k-state-disabled');
				}
			}
			else {
				if ($(val2).hasClass('k-state-disabled') && $(val2).find('td:eq(0)').text() == val) {
					$(val2).removeClass('k-state-disabled');
				}
			}
		});
	};
	
	//입주사 쿠폰 추가 버튼 클릭 이벤트
	$('#btn-to').click(function(e) {
		e.stopPropagation();
		
		if (!$(this).hasClass('k-state-disabled')) {
			if ($('#gridCustCpnList > tbody > tr').length == 1 && $('#gridCustCpnList > tbody > tr > td').hasClass('dataTables_empty')) {
				$('#gridCustCpnList > tbody > tr').remove();
			}
			
			$.each(gridCpnList.rows({selected: true}).data().toArray(), function(idx, val) {
				var row = [
					'<tr class="added" data-cpnSeq="' + val.cpnSeq + '">',
					'<td>', val.cpnCd,'</td>',
					'<td>', val.cpnNm,'</td>',
					'<td class="text-right inline-edit">',
					'<input id="input-qtyMin-', val.cpnCd, '" type="number" class="k-textbox" style="width: 100%; padding: 0;" value="100" min="0" step="10" autocomplete="off" />',
					'</td>',
					'<td class="text-right inline-edit">',
					'<input id="input-qtyMax-', val.cpnCd, '" type="number" class="k-textbox" style="width: 100%; padding: 0;" value="1000" min="0" step="10" autocomplete="off" />',
					'</td>',
					'<td class="text-right inline-edit">',
					'<input id="input-price-', val.cpnCd, '" type="number" class="k-textbox" style="width: 100%; padding: 0;" value="', val.price, '" min="0" max="1000000" step="10" autocomplete="off" />',
					'</td>',
					'</tr>',
					].join('');
				
				//행 추가
				$('#gridCustCpnList > tbody').append(row);
				//쿠폰 목록 비 활성화
				fnChangeRowState(val.cpnCd, true);
				//테이블 사이즈 조정
				$.fn.dataTable.tables({visible: true, api: true}).columns.adjust();
			});
		}
	});
	
	//입주사 쿠폰 삭제 버튼 클릭 이벤트
	$('#btn-from').click(function(e) {
		e.stopPropagation();
		
		if (!$(this).hasClass('k-state-disabled')) {
			
			$.each($('#gridCustCpnList > tbody > tr.selected'), function(idx, val) {
				
				//쿠폰 목록 활성화
				fnChangeRowState($(val).find('td:eq(0)').text(), false);
				//테이블 사이즈 조정
				$.fn.dataTable.tables({visible: true, api: true}).columns.adjust();
				//행 삭제
				$(val).remove();
				
				if ($('#gridCustCpnList > tbody > tr').length == 0) {
					$('#btn-from').addClass('k-state-disabled');
					$('#gridCustCpnList > tbody').append('<tr class="odd"><td valign="top" colspan="5" class="dataTables_empty">No data available in table</td></tr>');
				}
			});
		}
	});
	
	//입주사 쿠폰 리스트 선택 style
	$('#gridCustCpnList tbody').on('click', 'tr', function(e) {
		e.preventDefault();
		e.stopPropagation();
		
		if (e.originalEvent.target.nodeName.toLowerCase() == 'input') {
			return;
		}
		
		if ($(this).hasClass('selected')) {
			$(this).removeClass('selected');
		}
		else if (!$(this).find('td.dataTables_empty').length){
			$(this).addClass('selected');
		}
		
		if ($('#gridCustCpnList > tbody > tr.selected').length > 0) {
			$('#btn-from').removeClass('k-state-disabled');
		}
		else {
			$('#btn-from').addClass('k-state-disabled');
		}
	});
	
	//입력체크
	var fnValidate = function() {
		
		var isValid = true;
		//입주사 쿠폰 설정여부
		if (gridCustCpnList.rows().count() == 0 && $('#gridCustCpnList > tbody > tr').length == 1 
			&& $('#gridCustCpnList > tbody > tr > td').hasClass('dataTables_empty')) {
			
			fnAlertWarn($('#dialog'), {
				content: '입주사 사용 ' + cpnTypeTitlePost + ' 설정해 주세요.',
				actions: [{text   : 'Ok', primary: true}]
			}).data("kendoDialog").open();
			
			return false;
		}
		else {
			$.each($('#gridCustCpnList > tbody > tr'), function(idx, val) {
				
				if ($(val).find('td:eq(2) input').val() == '') {
					fnAlertWarn($('#dialog'), {
						content: '최소 구매 수량을 입력해 주세요.',
						actions: [{
							text   : 'Ok',
							primary: true,
							action : function() {
								$(val).find('td:eq(2) input').focus();
							}
						}]
					}).data("kendoDialog").open();
					
					isValid = false;
					return false;
				}
				else if ($(val).find('td:eq(3) input').val() == '') {
					fnAlertWarn($('#dialog'), {
						content: '최대 구매 수량을 입력해 주세요.',
						actions: [{
							text   : 'Ok',
							primary: true,
							action : function() {
								$(val).find('td:eq(3) input').focus();
							}
						}]
					}).data("kendoDialog").open();
					
					isValid = false;
					return false;
				}
				else if ($(val).find('td:eq(4) input').val() == '' || $(val).find('td:eq(4) input').val() == 0) {
					fnAlertWarn($('#dialog'), {
						content: '판매금액을 입력해 주세요.',
						actions: [{
							text   : 'Ok',
							primary: true,
							action : function() {
								$(val).find('td:eq(4) input').focus();
							}
						}]
					}).data("kendoDialog").open();
					
					isValid = false;
					return false;
				}
			});
			
			return isValid;
		}
		
		return true;
	};
	
	//저장 action
	var fnSaveAction = function() {
		
		//입력체크
		if (fnValidate()) {
			
			var data = [];
			$.each($('#gridCustCpnList > tbody > tr'), function(idx, val) {
				
				if ($(val).find('td.dataTables_empty').length > 0) {
					return false;
				}
				
				data.push({
					parkCd : '${custVO.parkCd}',
					cpnSeq : $(val).attr('data-cpnSeq'),
					cpnCd  : $(val).find('td:eq(0)').text(),
					cpnNm  : $(val).find('td:eq(1)').text(),
					qtyMin : $(val).find('td:eq(2) input').val(),
					qtyMax : $(val).find('td:eq(3) input').val(),
					price  : $(val).find('td:eq(4) input').val(),
					cpnType: cpnType
				});
			});
			
			$.ajax({
				type       : 'POST',
				url        : '<c:url value="/cpns/custs/${custVO.custSeq}/cpns?park=${custVO.parkCd}" />',
				contentType: 'application/json; charset=utf-8',
				dataType   : 'json',
				data       : JSON.stringify(data),
				success    : function(result, status, jqXHR) {
					if (result.retMsg == 'common.message.success') {
						fnAlertSuccess($('#dialog'), {
							content: '입주사 ' + cpnTypeTitle + ' 정보를 저장하였습니다.',
							actions: [
								{
									text   : 'OK',
									primary: true,
									action : function() {
										gridCpnList.draw();
										gridCustCpnList.draw();
									}
								}
							]
						}).data("kendoDialog").open();
					}
					else {
						fnAlertError($('#dialog'), {
							content: '입주사 ' + cpnTypeTitle + ' 정보 저장에 실패하였습니다.',
							actions: [{text   : 'Ok', primary: true}]
						}).data("kendoDialog").open();
					}
				},
				error      : function(jqXHR, status, error) {
					fnAlertError($('#dialog'), {
						content: '입주사 ' + cpnTypeTitle + ' 정보 저장에 실패하였습니다.',
						actions: [{text   : 'Ok', primary: true}]
					}).data("kendoDialog").open();
				}
			});
		}
		
		return true;
	};
	
	//저장 버튼 이벤트
	$('#btn-save').click(function(e) {
		e.preventDefault();
		
		//입주사 쿠폰 설정여부
		if (gridCustCpnList.rows().count() > 0 && $('#gridCustCpnList > tbody > tr').length == 1 
		&& $('#gridCustCpnList > tbody > tr > td').hasClass('dataTables_empty')) {
			
			fnConfirm($('#dialog'), {
				content: '입주사 ' + cpnTypeTitle + ' 정보를 삭제하시겠습니까?',
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
		}
		else {
			fnConfirm($('#dialog'), {
				content: '입주사 ' + cpnTypeTitle + ' 정보를 저장하시겠습니까?',
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
		}
	});
	
	//새로고침 버튼 이벤트
	$('#btn-refresh').click(function() {
		fnConfirm($('#dialog'), {
			content: '저장하지 않은 정보는 삭제됩니다.',
			actions: [
				{
					text   : 'OK', 
					primary: true,
					action : function() {
						gridCpnList.draw();
						gridCustCpnList.draw();
					}
				},
				{
					text   : 'CANCEL'
				}
			]
		}).data("kendoDialog").open();
	});
	
	//목록 버튼 이벤트
	$('#btn-list').click(function(){
		location.href = '<c:url value="/cpns/custs/view" />' + document.location.search;
	});
	
	//탭 클릭 이벤트
	$('input:radio[name="tabset"]').change(function(e) {
		
		cpnType = $(this).val();
		
		if ($('#tab-cpn').is(':checked')) {
			cpnTypeTitle = '쿠폰';
			cpnTypeTitlePost = '쿠폰을';
		}
		else if ($('#tab-dcKey').is(':checked')) {
			cpnTypeTitle = '할인키';
			cpnTypeTitlePost = '할인키를';
		}
		
		$('.cpnTitle').text(cpnTypeTitle);
		//테이블 헤더
		gridCpnList.columns(0).header().to$().text(cpnTypeTitle  + '코드');
		gridCpnList.columns(1).header().to$().text(cpnTypeTitle  + '명');
		gridCustCpnList.columns(0).header().to$().text(cpnTypeTitle  + '코드');
		gridCustCpnList.columns(1).header().to$().text(cpnTypeTitle  + '명');
		//테이블 redraw
		gridCpnList.columns.adjust().draw();
		gridCustCpnList.columns.adjust().draw();
	});
});
</script>
</body>
</html>