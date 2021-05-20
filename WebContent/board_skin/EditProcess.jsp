<%@page import="model1.board2.BoardDAO"%>
<%@page import="model1.board2.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./isLogin.jsp" %>
<%
String num = request.getParameter("num");
String title = request.getParameter("title");
String content = request.getParameter("content");

BoardDTO dto = new BoardDTO();
dto.setNum(num);
dto.setTitle(title);
dto.setContent(content);

BoardDAO dao = new BoardDAO(application);

dao.close();
int affected = dao.updateEdit(dto); 
if(affected == 1){
	response.sendRedirect("BoardView.jsp?num=" + dto.getNum());
}
else{
	JSFunction.alertBack("수정 실패", out);
}

%>
