<%@page import="model1.board.BoardDAO"%>
<%@page import="model1.board.BoardDTO"%> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./isLogin.jsp" %>
<%
String num = request.getParameter("num");
BoardDTO dto = new BoardDTO();
BoardDAO dao = new BoardDAO(application);
dto = dao.selectView(num);
String session_id = session.getAttribute("USER_ID").toString();
int delResult = 0;
if(session_id.equals(dto.getId())){
	dto.setNum(num);
	delResult = dao.deletePost(dto); 
	dao.close();
	if(delResult==1){
		JSFunction.alertLocation("삭제되었습니다", "List.jsp", out);	
	}
	else{
		JSFunction.alertBack("삭제에 실패하였습니다", out);
	}
}
else{
	JSFunction.alertBack("본인만 삭제가능합니다.", out);
	return; 
}
%>
