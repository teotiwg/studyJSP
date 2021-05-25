<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>       
<html>
<head><title>JSTL-fmt3</title></head>
<body>
	<h4>로케일 설정</h4>	
	<c:set var="today" value="<%=new java.util.Date()%>"></c:set>
	
	한글로설정:<fmt:setLocale value="ko_kr" />
	<fmt:formatNumber value="10000" type="currency" /> /
	<fmt:formatDate value="${today }" /><br />

	일어로설정:<fmt:setLocale value="ja_JP" />
	<fmt:formatNumber value="10000" type="currency" /> /
	<fmt:formatDate value="${today }" /><br />
	
	영어로설정:<fmt:setLocale value="en_US" />
	<fmt:formatNumber value="10000" type="currency" /> /
	<fmt:formatDate value="${today }" /><br />	
</body>
</html> 