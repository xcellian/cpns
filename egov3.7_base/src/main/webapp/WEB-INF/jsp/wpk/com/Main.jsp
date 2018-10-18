<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Wilson Parking</title>
</head>
<frameset frameborder="0" framespacing="0" rows="54, *, 45">
	<frame id="_top" name="_top" src="<c:url value='/top.do?userSe=${userSe}' />" scrolling="no" title="Header">
	<frame id="_content" name="_content" src="<c:url value='/content.do?userSe=${userSe}' />" scrolling="no" title="Contents">
	<frame id="_bottom" name="_bottom" src="<c:url value='/bottom.do' />" scrolling="no" title="Footer">
</frameset>