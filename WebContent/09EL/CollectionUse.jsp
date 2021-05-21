<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="common.Person"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>List컬렉션</h2>
	<%
	ArrayList<Object> aList = new ArrayList<Object>();
	aList.add("청해진");
	aList.add(new Person("장보고", 28)); 
	pageContext.setAttribute("Ocean", aList);
	%>
	
	<ul>
		<li>0번째 요소: ${Ocean[0] }</li> <!-- String객체 출력 -->
		<!-- 
		List계열의 컬렉션은 배열과 같이 index를 통해 접근
		멤버변수명만으로 출력이 가능한 이유는 getter가 있기 때문 
		 -->
		<li>1번째 요소: ${Ocean[1].name }, ${Ocean[1].age }</li>
		<li>2번째 요소: ${Ocean[2] }</li> 
	</ul>
	
	<h2>Map컬렉션</h2>
	<%
	Map<String, String> map= new HashMap<String, String>();
	map.put("한글", "훈민정음");
	map.put("Eng", "English");
	pageContext.setAttribute("King", map);
	%>
	<!-- 
	Map컬렉션 사용 시 key값으로 한글 사용 가능
	단, EL에서 값을 읽을 때 한글의 경우, .을 사용 불가
	반드시 배열 형태로 사용해야 함
	 -->
	<ul>
		<li>한글Key : ${King["한글"] }, ${King['한글'] },
			\${King.한글 }</li>
		<li>영문Key : ${King["Eng"] }, ${King['Eng'] },
			${King.Eng }</li>
	</ul>
</body>
</html>