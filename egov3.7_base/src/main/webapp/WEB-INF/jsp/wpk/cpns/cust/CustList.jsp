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
	<link rel="stylesheet" href="<c:url value='/css/common.css?v=20180601016' />" />
	<link rel="stylesheet" href="<c:url value='/js/bootstrap-3.3.2-dist/css/bootstrap.min.css?v=20180601001' />" />
	<link rel="stylesheet" href="<c:url value='/js/bootstrap-3.3.2-dist/css/bootstrap-theme.css?v=20180601001' />" />
	<link rel="stylesheet" href="<c:url value='/js/dataTables/DataTables-1.10.18/css/dataTables.bootstrap.css?v=20180601001' />" />
	<link rel="stylesheet" href="<c:url value='/js/dataTables/Buttons-1.5.2/css/buttons.bootstrap.css?v=20180601001' />" />
	<link rel="stylesheet" href="<c:url value='/js/ax5ui/font-awesome/css/font-awesome.css?id=20180601001' />" />
	<link rel="stylesheet" href="<c:url value='/js/ax5ui/axicon/axicon.css?id=20180601001' />" />
	
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
	<div id="contentWrap">
		<div id="contentBox">
			<div class="main-section k-content">
				<ul class="searchFieldItems">
					<li style="width: 50%;">
						<input name="selPark" id="selPark" style="width: 100%;"/>
					</li>
					<li style="width: 15%; margin-left: 1rem;">
						<input name="selUseYn" id="selUseYn" style="width: 100%;" />
					</li>
					<li style="margin-left: 1rem; float: right;">
						<div class="btn-section-search">
							<button id="btn-search" type="button" class="k-button k-primary btn-search">검색</button>
						</div>
					</li>
				</ul>
				<ul class="searchFieldItems no-b-padding">
					<li style="width: 25%;">
						<input name="selSearchItem" id="selSearchItem" style="width: 100%;"/>
					</li>
					<li style="width: 25%; padding-left: 1rem;">
						<input name="txtKeyword" id="txtKeyword" type="text" class="k-textbox" style="width: 100%;" placeholder="검색어" />
					</li>
					<li style="width: 15%; margin-left: 1rem;">
						<input id="dateRegDtStart" style="width: 100%;" placeholder="등록일 From" />
					</li>
					<li style="margin: .4rem 1rem 0;">
						<span>~</span>
					</li>
					<li style="width: 15%;">
						<input id="dateRegDtEnd" style="width: 100%;" placeholder="등록일 To" />
					</li>
				</ul>
			</div>
		</div>
		<div id="gridWrapper">
			<table id="gridCustList" class="table table-striped table-bordered display nowrap hover" cellspacing="0" width="100%"></table>
		</div>
	</div>
</div>

<style>
@media only screen and (max-width: 720px) {
	.btn-section .btn {
		border-radius: 2px;
		padding: 5px 30px;
		line-height: 1.33334;
	} 
} 
</style>
<script>
$(document).ready(function() {
	
	//초기 검색조건
	var pageReload = true;
	var searchCond = {};
	var defaultOrder = [[0, 'asc'], [1, 'asc']];
	
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
	}).data("kendoComboBox");
	
	//상태 combobox 초기화
	var useYn = $('#selUseYn').kendoComboBox({
		filter        : 'none',
		dataTextField : 'useYnNm',
		dataValueField: 'useYnCd',
		placeholder   : '상태 선택',
		dataSource    : [
			{useYnNm: '사용', useYnCd: '1'},
			{useYnNm: '해지', useYnCd: '0'}
		]
	}).data("kendoComboBox");
	
	useYn.input.attr("readonly", true).on("keydown", function(e) {
		if (e.keyCode === 8) {
			e.preventDefault();
		}
	});
	
	//검색조건 combobox 초기화
	var searchItem = $('#selSearchItem').kendoMultiSelect({
		filter        : 'contains',
		dataTextField : 'itemLabel',
		dataValueField: 'itemValue',
		placeholder   : '검색조건',
		autoClose     : false,
		dataSource    : [
			{itemLabel: '입주사명',   itemValue: 'custNm'},
			{itemLabel: '입주사ID',   itemValue: 'custId'},
			{itemLabel: '전화번호',   itemValue: 'telNo'},
			{itemLabel: '휴대폰번호', itemValue: 'mobile'}
		],
		change        : function() {
			$.fn.dataTable.tables({visible: true, api: true}).columns.adjust();
		}
	}).data("kendoMultiSelect");
	
	//등록일 From combobox 초기화
	var startDt = $("#dateRegDtStart").kendoDatePicker({
		culture: 'ko-KR',
		format : 'yyyy-MM-dd',
		change : function(){
			var startDate = startDt.value(),
				endDate = endDt.value();
			
			if (startDate) {
				startDate = new Date(startDate);
				startDate.setDate(startDate.getDate());
				endDt.min(startDate);
			}
			else if (endDate) {
				startDt.max(new Date(endDate));
			}
			else {
				endDate = new Date();
				startDt.max(endDate);
				endDt.min(endDate);
			}
		}
	}).data("kendoDatePicker");
	
	//등록일 To combobox 초기화
	var endDt = $("#dateRegDtEnd").kendoDatePicker({
		culture: 'ko-KR',
		format : 'yyyy-MM-dd',
		change : function(){
			var startDate = startDt.value(),
				endDate = endDt.value();
			
			if (endDate) {
				endDate = new Date(endDate);
				endDate.setDate(endDate.getDate());
				startDt.max(endDate);
			}
			else if (startDate) {
				endDt.min(new Date(startDate));
			}
			else {
				endDate = new Date();
				startDt.max(endDate);
				endDt.min(endDate);
			}
		}
	}).data("kendoDatePicker");
	
	startDt.max(endDt.value());
	endDt.min(startDt.value());
	
	//검색조건 설정 함수
	var fnSetSearchCond = function() {
		var searchItems = new Array();
		$.each(searchItem.value(), function(index, value){
			searchItems.push({name: value});
		});
		
		searchCond = {
			'parkCd'     : park.value(),
			'useYn'      : useYn.value(),
			'searchItem' : searchItems,
			'keyword'    : $.trim($('#txtKeyword').val()),
			'startDt'    : kendo.toString(startDt.value(), 'yyyy-MM-dd'),
			'endDt'      : kendo.toString(endDt.value(), 'yyyy-MM-dd'),
			'page'       : 0
		};
	};
	
	//페이지 이동 후 복귀 시 검색조건 초기값 설정
	if (<c:out value="${searchCond.initialized}" escapeXml="true" /> && pageReload) {
		//주차장콤보
		park.value('<c:out value="${empty searchCond.parkCd? \'\': searchCond.parkCd}" escapeXml="true" />');
		park.trigger('change');
		
		//상태
		useYn.select(function(dataItem) {
			return dataItem.useYnCd === '<c:out value="${empty searchCond.useYn? \'\': searchCond.useYn}" escapeXml="true" />';
		});
		useYn.trigger('change');
		
		//검색조건
		searchItem.value([<c:forEach var="item" items="${searchCond.searchItem}">'${item.name}',</c:forEach>]);
		searchItem.trigger('change');
		
		//검색어
		$('#txtKeyword').val('<c:out value="${empty searchCond.keyword? \'\': searchCond.keyword}" escapeXml="true" />');
		
		//등록일 From
		startDt.value('<c:out value="${empty searchCond.startDt? \'\': searchCond.startDt}" escapeXml="true" />');
		startDt.trigger('change');
		
		//등록일 To
		endDt.value('<c:out value="${empty searchCond.endDt? \'\': searchCond.endDt}" escapeXml="true" />');
		endDt.trigger('change');
		
		fnSetSearchCond();
		
		//그리드 데이터 시작 index
		searchCond.start = <c:out value="${searchCond.start}" escapeXml="true" />;
	}
	
	//입주사 리스트 초기화
	var gridCustList = $('#gridCustList').DataTable({
		processing    : true,
		serverSide    : true,
		responsive    : true,
		scrollX       : true,
		scrollY       : 350,
		scrollCollapse: false,
		pagingType    : 'full_numbers',
		searching     : false,
		order         : $.extend(true, [], defaultOrder),
		pageLength    : 10,
		lengthChange  : true,
		lengthMenu    : [10, 20, 30, 50],
		language      : {
			lengthMenu: '_MENU_ 개씩 보기',
			paginate  : {
				first   : '<i class="fa fa-step-backward" aria-hidden="true"></i>',
				last    : '<i class="fa fa-step-forward" aria-hidden="true"></i>',
				next    : '<i class="fa fa-caret-right" aria-hidden="true"></i>',
				previous: '<i class="fa fa-caret-left" aria-hidden="true"></i>'
			},
			info      : '&nbsp;&nbsp;_START_ ~ _END_ &nbsp;&nbsp;전체 _TOTAL_',
			infoEmpty : '',
			processing: '<strong>Wait...</strong>',
			select    : {
				rows: ''
			}
		},
		select        : {
			style: 'single'
		},
		columns       : [
			{data: 'parkNm', name: 'parkNm', title: '주차장'},
			{data: 'custNm', name: 'custNm', title: '입주사명'},
			{data: 'custId', name: 'custId', title: '입주사ID'},
			{data: 'telNo',  name: 'telNo',  title: '전화번호',   className: 'text-center'},
			{data: 'mobile', name: 'mobile', title: '휴대폰번호', className: 'text-center'},
			{data: 'useYn',  name: 'useYn',  title: '상태',       className: 'text-center'},
			{data: 'regDt',  name: 'regDt',  title: '등록일',     className: 'text-center'},
			{title: '', width: 60, className: 'text-center', sortable: false}
		],
		columnDefs    : [
			{className: 'dt-head-center', searchable: false, targets: '_all'},
			{
				render: function(data, type, row) {
					return row.parkCd + ' ' + data;
				},
				targets: 0
			},
			{
				render: function(data, type, row) {
					return data == '0'? '해지': '사용';
				},
				targets: 5
			},
			{
				render: function(data, type, row) {
					return '<span class="btnCustEdit k-icon k-icon-14 k-icon-blue k-i-edit pointer" title="상세"></span>'
						+ '<span class="btnCpnSet k-icon k-icon-14 k-icon-blue k-i-gear mgl-1 pointer" title="쿠폰설정"></span>';
				},
				targets: 7
			}
		],
		ajax          : {
			type    : 'GET',
			url     : '<c:url value="/cpns/custs"/>',
			dataType: "json",
			data    : function(data) {
				//sort order - server param
				for (var i = 0; i < (data.order).length; i++) {
					data.order[i].name = data.columns[data.order[i].column].name;
				}
				
				if (<c:out value="${searchCond.initialized}" escapeXml="true" /> && pageReload) {
					//sort order 
					$('#gridCustList').DataTable().order([<c:forEach var="item" items="${searchCond.order}">['${item.column}', '${item.dir}'],</c:forEach>]);
					
					//page length
					$('#gridCustList').DataTable().page.len(<c:out value="${searchCond.length}" escapeXml="true" />);
				}
				else {
					delete searchCond.start
				}
				
				data.initialized = true;
				$.extend(true, data, searchCond);
			},
			dataSrc : function(res) {
				return res.custList;
			}
		}
	});
	
	//페이지 이동 후 복귀 시 이전 페이지를 표시하기 위한 초기화 이벤트
	$('#gridCustList').on('init.dt', function() {
		if (<c:out value="${searchCond.initialized}" escapeXml="true" /> && pageReload) {
			pageReload = false;
			var pageIdx = <c:out value="${searchCond.page}" escapeXml="true" />;
			if (pageIdx > 0) {
				gridCustList.page(pageIdx).draw('page');
			}
		}
	}).DataTable();
	
	//페이징 이벤트
	$('#gridCustList').on('page.dt', function() {
		searchCond.page = gridCustList.page();
	}).DataTable();
	
	//검색버튼 클릭
	$('#btn-search').click(function(e) {
		e.preventDefault();
		
		fnSetSearchCond();
		gridCustList.order(defaultOrder).draw();
	});
	
	//입주사 상세정보 화면 표시 action binding
	$('#gridCustList tbody').on('click', 'tr .btnCustEdit', function(e) {
		e.stopPropagation();
		
		var data = gridCustList.row($(this).closest('tr')).data();
		location.href = '<c:url value="/cpns/custs/"/>' + data.custSeq + '?' + $.param(gridCustList.ajax.params());
	});
	
	//입주사 쿠폰설정 화면 표시 action binding
	$('#gridCustList tbody').on('click', 'tr .btnCpnSet', function(e) {
		e.stopPropagation();
		
		var data = gridCustList.row($(this).closest('tr')).data();
		location.href = '<c:url value="/cpns/custs/"/>' + data.custSeq + '/cpns/view?' + $.param(gridCustList.ajax.params());
	});
	
//	//입주사 리스트 선택 style
//	$('#gridCustList tbody').on('click', 'tr', function(e) {
//		e.stopPropagation();
//		if ($(this).hasClass('selected')) {
//			$(this).removeClass('selected');
//		}
//		else {
//			gridCustList.$('tr.selected').removeClass('selected');
//			$(this).addClass('selected');
//		}
//	});
//	
	//입주사 리스트 선택 style
	//$('#gridCustList tbody').on('dblclick', 'tr', function(e) {
	//	e.stopPropagation();
	//	
	//	var data = gridCustList.row(this).data();
	//	location.href = '<c:url value="/cpns/cust/detail/' + data.custSeq + '"/>';
	//});
//	$('#gridWrapper').on('resize', function() {
//		alert('resize');
//	});
});
</script>
</body>
</html>