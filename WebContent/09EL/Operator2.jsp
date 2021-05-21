<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 페이지 영역에 속성 저장
pageContext.setAttribute("num1", 9);
pageContext.setAttribute("num2","10");

pageContext.setAttribute("nullStr", null); // null값
pageContext.setAttribute("emptyStr", ""); // 문자열
pageContext.setAttribute("lengthZero", new Integer[0]); //Wrapper클래스
pageContext.setAttribute("sizeZero", new ArrayList()); //리스트컬렉션
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>empty연산자</h3>
	<!-- 
	null일 때 true 반환하는 연산자
	String이 빈 문자열일 때, 콜렉션의 size가 0일때, 배열의 길이가 0일때
	 -->
	emtpy nullStr: ${empty nullStr } <br/>
	emtpy emptyStr: ${empty emptyStr } <br/>
	emtpy lengthZero: ${empty lengthZero }<br/>
	emtpy sizeZero: ${empty sizeZero }<br/>
	
	<h3>삼항연산자</h3>
	num1 gt num2? "참" : "거짓"
		=> ${num1 gt num2 ? "num1이 크다" : "num2가 크다" }
		
	<h3>null 연산</h3>
	<!-- 
	자바에선 null과 연산을 할 수 없지만
	EL에선 null을 0으로 간주하여 연산하므로
	NullPointerException이 발생 않음
	 -->
	null + 10 : ${null + 10 }<br/>
	nullStr + 10: ${nullStr + 10 }<br/>
	param.noVar > 10 : ${param.noVar > 10 }
	<!-- 
	해당페이지?noVar=99 => 숫자로 인식하므로 true
	해당페이지?noVar=  => 0으로 간주되어 false
	해당페이지?noVar=구십 => 문자는 숫자로 변경할 수 없어 에러 발생
	 -->
</body>
</html>