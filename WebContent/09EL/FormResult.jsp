<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
request.setCharacterEncoding("UTF-8");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>파라미터 값 받기</h2>
	<h3>JSP로 받기</h3>
	<ul>
		<li>이름: <%=request.getParameter("name") %></li>
		<li>성별: <%=request.getParameter("gender") %></li>
		<li>관심사항: <%
					/*
					체크박스의 경우 2개 이상의 값이 전송될 수 있으므로
					String타입의 배열로 폼값을 받아서 처리
					*/
						String[] inters = request.getParameterValues("inter");
						for(String s : inters){
							out.println(s + " ");
						}
					%></li>
		<li>학력: <%=request.getParameter("grade") %></li>
	</ul>
	
	<%-- 
	EL로 폼값을 받을 때는 EL내장객체를 사용
	text, radio와 같은 폼값은 ${param.폼이름}
	checkbox와 같은 다종 폼값은 ${paramValues.폼이름}
	또한 쿼리스트링으로 전달되는 파라미터도 동일하게 받을 수 있음
	웹URL?nowPage=10 => ${param.nowPage} 
	 --%>
	<h3>EL로 받기</h3>
	<ul>
		<li>이름: ${param.name }</li>
		<li>성별: ${param.gender }</li>
		<li>관심사항: 
			<!-- 
			JSTL의 forEach태그는 자바의 확장for문과 동일한 역할
			items속성에 지정한 배열에 있는 요소를 하나씩 꺼내 
			var속성에 지정한 변수에 할당하면서 반복
			 -->
			<c:forEach items="${paramValues.inter }" var="s">
				${s }&nbsp;
				</c:forEach>
		</li>
		<li>학력: ${param.grade }</li>
	</ul>
</body>
</html>