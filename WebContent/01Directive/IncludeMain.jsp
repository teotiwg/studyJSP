<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 
include 지시어 : 공통으로 사용할 JSP파일을 생성한 후
	현재문서에 포함시킬때 사용한다. 각각의 JSP파일 상단에는
	반드시 page 지시어가 삽입되어야 한다. 
	단, 하나의 JSP파일에서 page지시어가 중복선언되면 안된다. 
--%>
<%@ include file = "IncludePage.jsp" %>       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>IncludeMain.jsp</title>

<!-- CSS코드는 양이 많으므로 외부파일로 선언하여 현재문서에 링크시킨다.  -->
<link rel="stylesheet" href="./css/div_layout.css" />

</head>
<body>
<div class="AllWrap">
	<div class="header">
		<!-- GNB(Global Navigation Bar)영역 - 전체공통메뉴 -->
		<%@ include file="../common/Top.jsp" %>
	</div>
	<div class="body">
		<div class="left_menu">
			<!-- LNB(Local Navigation Bar)영역 - 로컬메뉴  -->
			<%@ include file="../common/Left.jsp" %>
		</div>
		<div class="contents">
			<!-- Contents 영역-->		
		
			<h2>오늘의날짜 : <%=todayStr %></h2>
			<br /><br />		
		
(서울=연합뉴스) 조민정 기자 = 문재인 대통령은 10일 부동산 문제에 대해선 한껏 몸을 낮췄지만, 일부 장관 후보자들의 임명 논란에 대해서는 뚜렷한 소신을 밝혔다.
<br /><br />	
기자회견을 겸해 청와대 춘추관에서 열린 취임 4주년 특별연설에서였다.
<br /><br />	
문 대통령이 언론과의 소통을 위해 춘추관을 찾은 것은 지난 1월 18일 신년 기자회견 이후 112일 만이다. 오전 11시에 시작한 특별연설은 예정된 1시간을 10분가량 넘겨 이어졌다.
<br /><br />	
짙은 회색 정장에 파란색 넥타이를 한 문 대통령은 연단에 서서 28분간 남은 임기 1년간 주력할 국정과제를 설명하는 특별연설을 한 뒤 자리에 앉아 주요 현안에 대한 출입기자들의 질문에 답했다.
<br /><br />	
문 대통령에게 던져진 첫 질문은 '지난 4년간 어떤 점이 아쉬움으로 남느냐'였다.
<br /><br />	
문 대통령은 주저 없이 "가장 아쉬웠던 점은 역시 부동산 문제"라고 답했다. 사실상 부동산 실패를 자인하면서 사과의 뜻을 밝힌 것이다.
<br /><br />	
이 과정에서 문 대통령은 "지난 재보선에서 엄중한 심판을 받았다", "정부가 할 말이 없는 상황", "죽비를 맞고 정신이 번쩍 들만한 심판"이라며 성난 부동산 민심 앞에 자세를 낮췄다.
<br /><br />
		</div>
	</div>
	<div class="copyright">
		<!-- Copyright -->
		<%@ include file="../common/Copyright.jsp" %>
	</div>
</div>
</body>
</html>