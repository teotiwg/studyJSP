<%@page import="utils.JSFunction"%>
<%@page import="model1.board2.BoardDAO"%>
<%@page import="model1.board2.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./isLogin.jsp" %>
<%
String title = request.getParameter("title");
String content = request.getParameter("content");
BoardDTO dto = new BoardDTO();
dto.setTitle(title);
dto.setContent(content);
dto.setId(session.getAttribute("USER_ID").toString());
BoardDAO dao = new BoardDAO(application);

int iResult = dao.insertWrite(dto);
dao.close();
if(iResult == 1){
	response.sendRedirect("BoardList.jsp");
}
else{
	JSFunction.alertBack("글쓰기에 실패했습니다.", out);
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>