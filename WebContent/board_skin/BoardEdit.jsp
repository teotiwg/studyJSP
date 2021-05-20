<%@page import="model1.board2.BoardDTO"%>
<%@page import="model1.board2.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./isLogin.jsp" %>
<%
String num = request.getParameter("num");

String searchField = request.getParameter("searchField");
String searchWord = request.getParameter("searchWord");
String queryStr = "";

if(searchWord != null){
	queryStr = "&searchField=" + searchField + "&searchWord=" + searchWord;
}

BoardDAO dao = new BoardDAO(application);
BoardDTO dto = dao.selectView(num);

String session_id = (String)session.getAttribute("USER_ID");
if(!session_id.equals(dto.getId())){
	JSFunction.alertBack("작성자 본인만 수정 가능", out);
	return;
}
dao.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원제 게시판</title>
<script type="text/javascript">
	function formValidate(f){
		if(f.title.value == ""){
			alert("제목 입력하세요");
			f.title.focus();
			return false;
		}
		if(f.content.value == ""){
			alert("내용을 입력하세요.");]
			f.content.focus();
			return false;
		}
	}
</script>
</head>
<jsp:include page="./inc/boardHead.jsp" />
<body>
<div class="container">
	<jsp:include page="./inc/boardTop.jsp" />
	<div class="row">		
		<jsp:include page="./inc/boardLeft.jsp" />
		<div class="col-9 pt-3">
			<h3>게시판 - <small>글작성하기</small></h3>
			<form name="writeFrm" method="post" action="EditProcess.jsp"
					onsubmit="return checkValidate(this);">	
			<input type="hidden" name="num" value="<%=dto.getNum() %>" />		
			<div class="row mt-3 mr-1">
				<table class="table table-bordered table-striped">
					<colgroup>
						<col width="20%"/>
						<col width="*"/>
					</colgroup>
					<tbody>
						<tr>
							<th class="text-center align-middle">작성자</th>
							<td>
								<input type="text" class="form-control"	style="width:100px;"/>
							</td>
						</tr>
						<tr>
							<th class="text-center" 
								style="vertical-align:middle;">패스워드</th>
							<td>
								<input type="password" class="form-control"
									style="width:200px;"/>
							</td>
						</tr>
						<tr>
							<th class="text-center"
								style="vertical-align:middle;">제목</th>
							<td>
								<input type="text" name="title" class="form-control" 
								value="<%=dto.getTitle() %>"/>
							</td>
						</tr>
						<tr>
							<th class="text-center"
								style="vertical-align:middle;">내용</th>
							<td>
								<textarea rows="10" name="content"class="form-control"
								><%=dto.getContent() %></textarea>
							</td>
						</tr>
						<tr>
							<th class="text-center"
								style="vertical-align:middle;">첨부파일</th>
							<td>
								<input type="file" class="form-control" />
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="row mb-3">
				<div class="col text-right">
					<!-- 각종 버튼 부분 -->
					<!-- <button type="button" class="btn">Basic</button> -->
					<!-- <button type="button" class="btn btn-primary" 
						onclick="location.href='BoardWrite.jsp';">글쓰기</button> -->
					<!-- <button type="button" class="btn btn-secondary">수정하기</button>
					<button type="button" class="btn btn-success">삭제하기</button>
					<button type="button" class="btn btn-info">답글쓰기</button>
					<button type="button" class="btn btn-light">Light</button>
					<button type="button" class="btn btn-link">Link</button> -->
					<button type="submit" class="btn btn-danger">작성완료</button>
					<button type="reset" class="btn btn-dark">Reset</button>
					<button type="button" class="btn btn-warning" onclick="location.href='BoardList.jsp?<%=queryStr %>';">리스트보기</button>
				</div>
			</div>
		</form>
		</div>
	</div>
	<jsp:include page="./inc/boardBottom.jsp" />
</div>
</body>
</html>
