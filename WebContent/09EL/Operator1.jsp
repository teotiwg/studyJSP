<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 변수 선언
int num1 = 3;
// 페이지 영역에 속성 저장
// 저장 시 Object형으로 변환됌
pageContext.setAttribute("num2", 4);
pageContext.setAttribute("num3","5");
pageContext.setAttribute("num4","6");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>변수 선언 및 할당</h3>
	스크립트릿에서 선언한 변수: ${num1 }<br/> <!-- 일반 변수는 출력되지 않음 -->
	page영역에 저장된 변수: ${num2 }<br/> <!-- 4 출력 -->
	변수할당 및 즉시 출력: ${num1=7 }<br/> <!-- 7이 할당됌과 동시에 출력됌 -->
	<!-- 할당과 동시에 출력 않으려면 뒷부분에 ;''과 같은 처리 필요 
		출력결과는 화살표 뒷부분만 8 출력됌
	-->
	변수할당 및 별도 출력: ${num2=8; ''} => ${num2 }<br/> 
	num1 = ${num1 }, num2=${num2 }, num3=${num3 }, num4=${num4}<!-- 7, 8, 5, 6 출력 -->
	
	<h3>산술연산자</h3>
	<!-- 
	자바에선 정수와 정수를 연산할 경우 정수의 결과가 나오지만 
	EL에선 자동형변환되므로 실수의 결과가 나올 수도 있음
	 -->
	num1 + num2: ${num1 + num2 }<br/>
	num1 - num2: ${num1 - num2 }<br/>
	num1 * num2: ${num1 * num2 }<br/>
	num1 div num2: ${num1 div num2 }<br/> <!-- 나눗셈연산 div -->
	num1 % num2: ${num1 % num2 }<br/>
	num1 mod num2: ${num1 mod num2 } <!-- 나머지 연산 mod -->
	
	<h3>+연산자는 덧셈만 가능</h3>
	<!-- 
	EL식 안에서 +연산자는 덧셈만 가능하고 문자열 연결은 불가능
	만약 문자열을 통해 연결하고 싶다면 별도의 EL 2개 사용
	 -->
	num1 + "34" : ${num1 + "34" }<br/>
	num2 + "이십" : \${num2 + "이십" }<br/>
	"삼십" + "사십" : \${"삼십" + "사십" }
	${"삼십"} ${"사십"} <!-- 이처럼 별도로 작성 필요 -->
	
	<!-- 
	자바에서 사용했던 특수기호 형태의 연산자 외에
	영문 형태의 연산자 제공
	 -->
	<h3>비교연산자</h3>
	num4 > num3 : ${num4 gt num3 }<br/>
	num1 < num3 : ${num1 lt num3 }<br/>
	num2 >= num4 : ${num2 ge num4 }<br/>
	num1 == num4: ${num1 eq num4 }
	
	<h3>논리연산자</h3>
	num3<=num4 && num3==num4 : ${num3 le num4 and num3 eq num4 }
	<br/>
	num3>= num4 || num3!=num4 : ${num3 ge num4 or num3 ne num4 }
</body>
</html>