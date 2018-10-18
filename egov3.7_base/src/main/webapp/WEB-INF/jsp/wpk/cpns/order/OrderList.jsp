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
	<link rel="stylesheet" href="<c:url value='/css/common.css?v=20180601020' />" />
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
	<script src="<c:url value='/js/datejs/date.js' />" ></script>
</head>
<body>
<div id="main">
	<div id="contentWrap">
		<div id="contentBox">
			<div class="main-section k-content">
				<ul class="searchFieldItems">
					<li style="width: 15%;">
						<input id="dateOrderDtStart" style="width: 100%;" placeholder="주문일 From" />
					</li>
					<li style="margin: .4rem 1rem 0;">
						<span>~</span>
					</li>
					<li style="width: 15%;">
						<input id="dateOrderDtEnd" style="width: 100%;" placeholder="주문일 To" />
					</li>
					<li style="margin-left: 1rem;">
						<a class="aSearchOrder" data-period="1" >15일</a>
					</li>
					<li style="margin-left: 1rem;">
						<a class="aSearchOrder" data-period="2" >1개월</a>
					</li>
					<li style="margin-left: 1rem;">
						<a class="aSearchOrder" data-period="3" >3개월</a>
					</li>
					<li style="margin-left: 1rem;">
						<a class="aSearchOrder" data-period="4" >6개월</a>
					</li>
					<li style="margin-left: 1rem; float: right;">
						<div class="btn-section-search">
							<button id="btn-search" type="button" class="k-button k-primary btn-search">검색</button>
						</div>
					</li>
				</ul>
				<ul class="searchFieldItems no-b-padding">
					<li style="width: 33.5%;">
						<input name="txtKeyword" id="txtKeyword" type="text" class="k-textbox" style="width: 100%;" placeholder="쿠폰명" />
					</li>
				</ul>
			</div>
		</div>
		<div id="gridWrapper">
			<table id="gridOrderList" class="table table-striped table-bordered display nowrap hover" cellspacing="0" width="100%"></table>
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
	var defaultOrder = [[0, 'desc']];
	
	//등록일 From 초기화
	var startDt = $("#dateOrderDtStart").kendoDatePicker({
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
			
			$('.aSearchOrder').removeClass('selected');
		},
		value  : kendo.date.addDays(new Date(), -7)
	}).data("kendoDatePicker");
	
	//등록일 To 초기화
	var endDt = $("#dateOrderDtEnd").kendoDatePicker({
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
			
			$('.aSearchOrder').removeClass('selected');
		},
		value  : new Date()
	}).data("kendoDatePicker");
	
	startDt.max(endDt.value());
	endDt.min(startDt.value());
	
	//초기조건 설정 
	searchCond = {
		'startDt': kendo.toString(startDt.value(), 'yyyy-MM-dd'),
		'endDt'  : kendo.toString(endDt.value(), 'yyyy-MM-dd'),
	};
	
	//검색조건 설정 함수
	var fnSetSearchCond = function() {
		searchCond = {
			'startDt': kendo.toString(startDt.value(), 'yyyy-MM-dd'),
			'endDt'  : kendo.toString(endDt.value(), 'yyyy-MM-dd'),
			'period' : $('.aSearchOrder.selected').attr('data-period'),
			'keyword': $.trim($('#txtKeyword').val()),
			'page'   : 0
		};
	};
	
	var fnSetPeriod = function(period) {
		
		var now = new Date();
		endDt.value(now);
		
		$('.aSearchOrder').removeClass('selected');
		
		//최근 15일
		if (period == '1') {
			startDt.value(kendo.date.addDays(now, -15));
		}
		//1개월
		else if (period == '2') {
			startDt.value(Date.today().add(-1).month());
		}
		//3개월
		else if (period == '3') {
			startDt.value(Date.today().add(-3).month());
		}
		//6개월
		else if (period == '4') {
			startDt.value(Date.today().add(-6).month());
		}
		
		startDt.max(endDt.value());
		endDt.min(startDt.value());
		
		$.each($('.aSearchOrder'), function(idx, elem) {
			if ($(elem).attr('data-period') == period) {
				$(elem).addClass('selected');
			}
		});
	};
	
	//기간버튼 클릭
	$('.aSearchOrder').click(function(e) {
		e.preventDefault();
		
		fnSetPeriod($(this).attr('data-period'));
	});
	
	//페이지 이동 후 복귀 시 검색조건 초기값 설정
	
	console.log(<c:out value="${searchCond.initialized}" escapeXml="true" />);
	
	if (<c:out value="${searchCond.initialized}" escapeXml="true" /> && pageReload) {
		//주문일 From
		startDt.value('<c:out value="${empty searchCond.startDt? \'\': searchCond.startDt}" escapeXml="true" />');
		startDt.trigger('change');
		
		//주문일 To
		endDt.value('<c:out value="${empty searchCond.endDt? \'\': searchCond.endDt}" escapeXml="true" />');
		endDt.trigger('change');
		
		//주문일 기간
		if ('<c:out value="${empty searchCond.period? \'\': searchCond.period}" escapeXml="true" />' != '') {
			fnSetPeriod('<c:out value="${searchCond.period}" escapeXml="true" />');
		}
		
		//검색어
		$('#txtKeyword').val('<c:out value="${empty searchCond.keyword? \'\': searchCond.keyword}" escapeXml="true" />');
		
		fnSetSearchCond();
		
		//그리드 데이터 시작 index
		searchCond.start = <c:out value="${searchCond.start}" escapeXml="true" />;
	}
	
	//입주사 리스트 초기화
	var gridOrderList = $('#gridOrderList').DataTable({
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
			{data: 'orderDt',      name: 'orderDt',      title: '주문일',   className: 'text-center'},
			{data: 'orderSeq',     name: 'orderSeq',     title: '주문번호', sortable: false},
			{data: 'productNm',    name: 'productNm',    title: '주문내역', sortable: false},
			{data: 'orderAmount',  name: 'orderAmount',  title: '주문금액', className: 'text-right',  render: $.fn.dataTable.render.number(',', '.', 0), sortable: false},
			{data: 'payTypeNm',    name: 'payTypeNm',    title: '결제방법', sortable: false},
			{data: 'orderStateNm', name: 'orderStateNm', title: '주문상태', sortable: false},
			{title: '주문상세',    width: 80, className: 'text-center', sortable: false}
		],
		columnDefs    : [
			{className: 'dt-head-center', searchable: false, targets: '_all'},
			{
				render: function(data, type, row) {
					return '<a title="상세내역" class="btnOrderDetail pointer" data-order="' + row.orderSeq + '" >상세내역</a>';
				},
				targets: 6
			}
		],
		ajax          : {
			type    : 'GET',
			url     : '<c:url value="/cpns/orders"/>',
			dataType: "json",
			data    : function(data) {
				//sort order - server param
				for (var i = 0; i < (data.order).length; i++) {
					data.order[i].name = data.columns[data.order[i].column].name;
				}
				
				if (<c:out value="${searchCond.initialized}" escapeXml="true" /> && pageReload) {
					//sort order 
					$('#gridOrderList').DataTable().order([<c:forEach var="item" items="${searchCond.order}">['${item.column}', '${item.dir}'],</c:forEach>]);
					
					//page length
					$('#gridOrderList').DataTable().page.len(<c:out value="${searchCond.length}" escapeXml="true" />);
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
	$('#gridOrderList').on('init.dt', function() {
		if (<c:out value="${searchCond.initialized}" escapeXml="true" /> && pageReload) {
			pageReload = false;
			var pageIdx = <c:out value="${searchCond.page}" escapeXml="true" />;
			if (pageIdx > 0) {
				gridOrderList.page(pageIdx).draw('page');
			}
		}
	}).DataTable();
	
	//페이징 이벤트
	$('#gridOrderList').on('page.dt', function() {
		searchCond.page = gridOrderList.page();
	}).DataTable();
	
	//검색버튼 클릭
	$('#btn-search').click(function(e) {
		e.preventDefault();
		
		fnSetSearchCond();
		gridOrderList.order(defaultOrder).draw();
	});
	
	//주문 상세정보 화면 표시 action binding
	$('#gridOrderList tbody').on('click', 'tr .btnOrderDetail', function(e) {
		e.stopPropagation();
		
		var data = gridOrderList.row($(this).closest('tr')).data();
		location.href = '<c:url value="/cpns/orders/"/>' + data.orderSeq + '?' + $.param(gridOrderList.ajax.params());
	});
});

</script>
</body>
</html>