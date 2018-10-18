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
	<link rel="stylesheet" href="<c:url value='/css/common.css?v=20180601032' />" />
	
	<script src="<c:url value='/js/jquery/jquery-3.3.1.js?id=20180601001' />" ></script>
	<script src="<c:url value='/js/kui/js/kendo.ui.core.min.js?id=20180601001' />"></script>
</head>
<body>
<div id="header">
	<div id="logo-bar">
		<a href="<c:url value='/content.do' />" target="_content">
			<img alt="WilsonParking logo" class="kendo-ui logo" src="<c:url value='/images/wpk/common/wilson-logo-w.png' />">
		</a>
	</div>
	<div id="custInfo-section" class="nav-buttons hidden">
		<a id="btn-custInfo" name="btn-custInfo" href="<c:url value='/uat/uia/actionLogout.do' />" target="_content" class="custInfo k-icon k-icon-14 k-i-user" ></a>
		<span class="custInfo mgr-2" style="vertical-align: middle;"></span>
		<a id="btn-logout" name="btn-logout" href="<c:url value='/uat/uia/actionLogout.do' />?userSe=<c:out value="${userSe}" escapeXml="true" />" target="_content" class="btn small" >logout</a>
	</div>
</div>
<style>
.custInfo {
	color: #fff !important;
}
</style>
</body>
</html>