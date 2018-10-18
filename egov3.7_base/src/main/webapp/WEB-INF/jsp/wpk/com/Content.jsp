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
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no, width=device-width">
	<title>${pageTitle} <spring:message code="title.list" /></title>
	<link rel="shortcut icon" href="">
	<link rel="stylesheet" href="<c:url value='/css/font-awesome.css?v=20180601003' />" />
	<link rel="stylesheet" href="<c:url value='/css/font-awesome-ie7.css?v=20180601003' />" />
	<link rel="stylesheet" href="<c:url value='/js/kui/styles/kendo.common-material.min.css?v=20180601001' />" />
	<link rel="stylesheet" href="<c:url value='/js/kui/styles/kendo.material.min.css?v=20180601001' />" />
	<link rel="stylesheet" href="<c:url value='/js/kui/styles/kendo.material.mobile.min.css?v=20180601001' />" />
	<link rel="stylesheet" href="<c:url value='/css/contentcmm.css?v=20180601003' />" />
	<link rel="stylesheet" href="<c:url value='/css/common.css?v=20180601037' />" />
	
	<script src="<c:url value='/js/jquery/jquery-3.3.1.js?id=20180601001' />" ></script>
	<script src="<c:url value='/js/kui/js/kendo.ui.core.min.js?id=20180601001' />"></script>
	<script src="<c:url value='/js/kui/js/cultures/kendo.culture.ko-KR.min.js?v=20180601001' />"></script>
	<script>
		function resizeContainers() {
			var //headerHeight = $(window.parent.frames["_top"].document).contents().find("#header").outerHeight(),
				pageHeaderHeight = $("#pageHeader").outerHeight(),
				navbarWrapper = $("#main-nav-bar").height(),
				htmlHeight = (kendo.support.mobileOS) ? parseFloat(window.innerHeight) : $('html').height(),
				sidebarHeight = htmlHeight, //- headerHeight,
				borderSize = 2,
				navHeight = sidebarHeight - (navbarWrapper + borderSize);
				
			$("#main-sidebar").height(sidebarHeight);
			$("#nav-wrapper").height(navHeight);
			$("#main").height(sidebarHeight - pageHeaderHeight);
		}
		
		$(function () {
			if (kendo.support.mobileOS) {
				$(document.documentElement).addClass("k-hover-enabled");
			}
		});
		
		$(document).ready(resizeContainers);
		$(window).resize(resizeContainers);
	</script>
</head>
<body>
<noscript>
	<spring:message code="common.noScriptTitle.msg" />
	이 사이트의 기능을 모두 활용하기 위해서는 자바스크립트를 활성화 시킬 필요가 있습니다.
	<a href="http://www.enable-javascript.com/ko/" target="_blank">
	브라우저에서 자바스크립트를 활성화하는 방법</a>을 참고 하세요.
</noscript>

<div id="main-sidebar" data-role="responsivepanel" class="k-rpanel k-rpanel-left rpanel-sidebar">
	<div id="main-nav-bar">
		<a title="Close" id="back-forward" class="back-nav" style="visibility:hidden;">&nbsp;</a>
	</div>
	<div id="nav-wrapper">
		<div id="nav" class="root">
			<div id="main-nav">
				<!-- <h3>쿠폰 주문</h3> -->
				<ul>
					<c:forEach var="item" items="${menu}" varStatus="status">
						<c:choose>
							<c:when test="${item.upperMenuNo eq '0'}">
								<li class="group"><span class="group"><c:out value="${item.menuNm}" escapeXml="true" /></span></li>
							</c:when>
							<c:otherwise>
								<li>
									<a class="nav-detail" data-action="<c:url value='${item.menuAction}' />" 
										data-icon="<c:out value='${item.relateIcon}' escapeXml='true' />" 
										data-title="<c:out value='${item.menuNm}' escapeXml='true' />">
											<c:out value="${item.menuNm}" escapeXml="true" />
									</a>
								</li>
							</c:otherwise>
						</c:choose>
					</c:forEach>

					<!-- <!-- <li class="group"><span class="group">쿠폰 주문</span></li> -->
					<!-- <li><a class=" active" href="/kendo-ui/grid/index">Basic usage</a></li> -->
					<%-- <li><a class="active" href="<c:url value='/cpns/orderList' />" target="_content-main">주문내역</a></li> --%>
					<%-- <li><a class="" href="<c:url value='/cpns/orderList' />" target="_content-main">주문하기</a></li> --%>
					<!-- <!-- <li><a class="nav-detail" data-name="list" data-action="/cpns/order/list" data-icon="listViewIcon" data-title="구매내역">구매내역</a></li> -->
					<!-- <!-- <li><a class="nav-detail" data-name="order" data-action="/cpns/order/order" data-icon="editorIcon" data-title="구매하기">구매하기</a></li> -->
					<!-- <li><a href="/kendo-ui/grid/angular">AngularJS</a></li> -->
					<!-- <li class="group"><span class="group">Data Binding</span></li>
					<li><a href="/kendo-ui/grid/local-data-binding">Binding to local data</a></li>
					<li><a href="/kendo-ui/grid/remote-data-binding">Binding to remote data</a></li>
					<li><a class="new-example" href="/kendo-ui/grid/kinvey"><span class="new-widget"></span>Binding to Kinvey Backend Services</a></li>
					<li><a href="/kendo-ui/grid/signalr">Binding to SignalR</a></li>
					<li><a href="/kendo-ui/grid/web-socket">Binding to WebSocket</a></li>
					<li><a href="/kendo-ui/grid/offline">Working Offline</a></li>
					<li class="group"><span class="group">Exporting</span></li>
					<li><a href="/kendo-ui/grid/excel-export">Export to Excel</a></li>
					<li><a href="/kendo-ui/grid/pdf-export">Export to PDF</a></li>
					<li><a href="/kendo-ui/grid/copy-to-excel">Copy to Excel</a></li>
					<li class="group"><span class="group">Data Editing</span></li>
					<li><a href="/kendo-ui/grid/editing">Batch editing</a></li>
					<li><a class="new-example" href="/kendo-ui/grid/odatav4"><span class="new-widget"></span>Batch editing OData-v4</a></li>
					<li><a href="/kendo-ui/grid/editing-inline">Inline editing</a></li>
					<li><a href="/kendo-ui/grid/editing-popup">Popup editing</a></li>
					<li><a href="/kendo-ui/grid/editing-custom">Editing custom editor</a></li>
					<li><a href="/kendo-ui/grid/editing-custom-validation">Custom validator editing</a></li>
					<li class="group"><span class="group">Scrolling</span></li>
					<li><a href="/kendo-ui/grid/virtualization-local-data">Virtualization of local data</a></li>
					<li><a href="/kendo-ui/grid/virtualization-remote-data">Virtualization of remote data</a></li>
					<li><a href="/kendo-ui/grid/endless-scrolling-local">Endless scrolling of local data</a></li>
					<li><a href="/kendo-ui/grid/endless-scrolling-remote">Endless scrolling of remote data</a></li>
					<li><a href="/kendo-ui/grid/frozen-columns">Frozen columns</a></li>
					<li class="group"><span class="group">Filtering</span></li>
					<li><a href="/kendo-ui/grid/filter-row">Filter row</a></li>
					<li><a href="/kendo-ui/grid/filter-multi-checkboxes">Filter Multi Checkboxes</a></li>
					<li><a href="/kendo-ui/grid/filter-menu-customization">Filter menu customization</a></li>
					<li class="group"><span class="group">Functionality</span></li>
					<li><a href="/kendo-ui/grid/sorting">Sorting</a></li>
					<li><a href="/kendo-ui/grid/selection">Selection</a></li>
					<li><a href="/kendo-ui/grid/checkbox-selection">Checkbox selection</a></li>
					<li><a href="/kendo-ui/grid/aggregates">Aggregates</a></li>
					<li><a href="/kendo-ui/grid/hierarchy">Hierarchy</a></li>
					<li><a href="/kendo-ui/grid/persist-state">Persist state</a></li>
					<li><a href="/kendo-ui/grid/pager-visibility">Pager Visibility</a></li>
					<li class="group"><span class="group">Templates</span></li>
					<li><a href="/kendo-ui/grid/toolbar-template">Toolbar template</a></li>
					<li><a href="/kendo-ui/grid/rowtemplate">Row template</a></li>
					<li><a href="/kendo-ui/grid/detailtemplate">Detail template</a></li>
					<li class="group"><span class="group">Columns</span></li>
					<li><a href="/kendo-ui/grid/multicolumnheaders">Multi-column headers</a></li>
					<li><a href="/kendo-ui/grid/column-reordering">Column reordering</a></li>
					<li><a href="/kendo-ui/grid/column-resizing">Column resizing</a></li>
					<li><a href="/kendo-ui/grid/column-menu">Column menu</a></li>
					<li><a href="/kendo-ui/grid/foreignkeycolumn">ForeignKey column</a></li>
					<li><a href="/kendo-ui/grid/custom-command">Custom command</a></li>
					<li class="group"><span class="group">API</span></li>
					<li><a href="/kendo-ui/grid/events">Events</a></li>
					<li><a href="/kendo-ui/grid/api">API</a></li>
					<li class="group"><span class="group">Accessibility and Internationalization</span></li>
					<li><a href="/kendo-ui/grid/localization">Localization</a></li>
					<li><a href="/kendo-ui/grid/right-to-left-support">RTL support</a></li>
					<li><a href="/kendo-ui/grid/keyboard-navigation">Keyboard navigation</a></li> -->
					<!-- <!-- <li class="group"><span class="group">입주사 관리</span></li> --> -->
					<!-- <!-- <li><a class="nav-detail" data-name="list" data-action="/cpns/custs/view" data-icon="listViewIcon" data-title="입주사 목록">입주사 목록</a></li> -->
					<!-- <!-- <li><a class="nav-detail" data-name="list" data-action="/cpns/custs/cust" data-icon="listViewIcon" data-title="입주사 목록">입주사 등록</a></li> -->
					<!-- <!-- <li class="group"><span class="group">쿠폰/웹할인키 관리</span></li> --> -->
					<!-- <!-- <li><a class="nav-detail" data-name="list" data-action="/cpns/cpns/view/CT010" data-icon="listViewIcon" data-title="입주사 목록">쿠폰 목록</a></li> -->
					<!-- <!-- <li><a class="nav-detail" data-name="list" data-action="/cpns/cpns/cpn/iview/CT010" data-icon="listViewIcon" data-title="입주사 목록">쿠폰 등록</a></li> -->
					<!-- <!-- <li><a class="nav-detail" data-name="list" data-action="/cpns/cpns/view/CT020" data-icon="listViewIcon" data-title="입주사 목록">웹할인키 목록</a></li> -->
					<!-- <!-- <li><a class="nav-detail" data-name="list" data-action="/cpns/cpns/cpn/iview/CT020" data-icon="listViewIcon" data-title="입주사 목록">웹할인키 등록</a></li> -->
				</ul>
			</div>
		</div>
	</div>
</div>
<div class="themechooser" data-rel="themechooser" data-role="details" id="pageHeader">
	<a href="#" id="sidebar-toggle"><span></span></a>
	<span class="tc-activator" id="pageTitle">
		<span id="icon" class="exampleIcon"></span>
		<strong id="title"></strong>&nbsp;
	</span>
</div>
<div id="main">
	<iframe id="_content-main" name="_content-main" width="100%" height="100%"></iframe>
</div>
<script>
	$(document).ready(function () {
		resizeContainers();
		
		$("#main-sidebar").kendoResponsivePanel({
			breakpoint  : 1200,
			orientation : "left",
			toggleButton: "#sidebar-toggle",
			open        : function(){
				$('#back-forward').css('visibility', '');
			},
			close       :function(){
				$('#back-forward').css('visibility', 'hidden');
			} 
		});
		
		$('#back-forward').click(function(e){
			e.preventDefault();
			var panel = $("#main-sidebar").data("kendoResponsivePanel");
			panel.close();
		});
		
		var navList = $('.nav-detail');
		$(navList).not('.active').click(function(e){
			e.preventDefault();
			
			if($(this).hasClass('active')) {
				return false;
			}
			
			$(navList).removeClass('active');
			$(this).addClass('active');
			$('#icon').addClass($(this).attr('data-icon'));
			$('#title').text($(this).attr('data-title'));
			var action = '<c:url value="' + $(this).attr('data-action') + '"/>';
			$('#_content-main').attr('src', action).show(0, function(){
				console.log('load complete');
				//unbolckUI
			});
		});
		
		var frmTop = $(window.parent.frames['_top'].document);
		if('${loginVO}' != undefined && '${loginVO.name}' != '') {
			$(frmTop).contents().find("#custInfo-section").removeClass('hidden');
			$(frmTop).contents().find("#custInfo-section span.custInfo").text(' ${loginVO.name}');
		}
		
		$(frmTop).contents().find('#btn-logout').click(function() {
			$(frmTop).contents().find("#custInfo-section").addClass('hidden');
			$(frmTop).contents().find("#custInfo-section span.custInfo").text('');
			
			return;
		});
	});
</script>
</body>
</html>