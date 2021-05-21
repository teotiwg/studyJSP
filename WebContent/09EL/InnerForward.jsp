<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	</head>
	<body>
		<h2>forward된 페이지</h2>
		
		<h3>JSP코드 통해 속성 읽기</h3>
		
		<!-- 
		포워드 처리된 페이지에선 page영역은 공유되지 않고 request영역이 공유됌
		따라서 해당 페이지에서 가장 좁은 영역은 request영역이 됌
		 -->
		<ul>
			<li>pageContext.getAttribute("scopeVar"): 
				<%=pageContext.getAttribute("scopeVar") %></li>
			<li>request.getAttribute("scopeVar"): 
				<%=request.getAttribute("scopeVar") %></li>
			<li>session.getAttribute("scopeVar"): 
				<%=session.getAttribute("scopeVar") %></li>
			<li>application.getAttribute("scopeVar"): 
				<%=application.getAttribute("scopeVar") %></li>
		</ul>
		
		<h3>각 영역에 저장된 속성 읽기</h3>
		<ul>
			<li>페이지 영역: ${pageScope.scopeVar }</li> <!-- 출력안됌 -->
			<li>리퀘스트영역: ${requestScope.scopeVar }</li>
			<li>세션영역: ${sessionScope.scopeVar }</li>
			<li>어플리케이션영역: ${application.scopeVar }</li>
		</ul>
		
		<h3>xxxScope 미지정 후 속성 읽기</h3>
		<ul>
			<li>가장 좁은 영역 읽음: ${scopeVar }</li>
			<li>포워드된 페이지에선 가장 좁은 영역인 리퀘스트 영역이 읽혀지게 됌
			페이지 영역은 포워드된 페이지에는 공유되지 않음</li>
		</ul>
	</body>
</html>