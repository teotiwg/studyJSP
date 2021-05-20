<%@page import="model1.board2.BoardDTO"%>
<%@page import="model1.board2.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String num = request.getParameter("num");
String searchField = request.getParameter("searchField");
String searchWord = request.getParameter("searchWord");

String queryStr = "";
if(searchWord != null){
	queryStr ="&searchField=" + searchField + "&searchWord="+ searchWord;
}


BoardDAO dao = new BoardDAO(application);
dao.updateVisitCount(num);
BoardDTO dto = dao.selectView(num);
dao.close();
%>
<jsp:include page="./inc/boardHead.jsp" />
<body>
<script>
	function isDelete(){
		var c = confirm("정말 삭제하시겠습니까?");
		if(c){
			var f = document.writeFrm;
			f.method = "post";
			f.action = "DeleteProcess.jsp";
			f.submit();
		}
	}
</script>
<div class="container">
	<jsp:include page="./inc/boardTop.jsp" />
	<div class="row">		
		<jsp:include page="./inc/boardLeft.jsp" />
		<div class="col-9 pt-3">
			<h3>게시판 - <small>내용보기</small></h3>
						
			<div class="row mt-3 mr-1">
					<input type="hidden" name="num" value="<%=num %>" />
				<table class="table table-bordered">
				<colgroup>
					<col width="20%"/>
					<col width="30%"/>
					<col width="20%"/>
					<col width="*"/>
				</colgroup>
				<form name="writeFrm">
					<tbody>
						<tr>
							<th class="text-center table-active align-middle">작성자</th>
							<td><%=dto.getName() %></td>
							<th class="text-center table-active align-middle">작성일</th>
							<td><%=dto.getPostdate() %></td>
						</tr>
						<tr>
							<th class="text-center table-active align-middle">번호</th>
							<td><%=dto.getNum() %></td>
							<th class="text-center table-active align-middle">조회수</th>
							<td><%=dto.getVisitcount() %></td>
						</tr>
						<tr>
							<th class="text-center table-active align-middle">제목</th>
							<td colspan="3">
								<%=dto.getTitle() %>
							</td>
						</tr>
						<tr>
							<th class="text-center table-active align-middle">내용</th>
							<td colspan="3" class="align-middle" style="height:200px;">
								<%=dto.getContent().replace("\r\n", "<br/>") %>
							</td>
						</tr>
						<tr>
							<th class="text-center table-active align-middle">첨부파일</th>
							<td colspan="3">
								파일명.jpg <a href="">[다운로드]</a>
							</td>
						</tr>
					</tbody>
				</form>
				</table>
			</div>
			<div class="row mb-3">
			<%
			if(session.getAttribute("USER_ID")!= null &&
				session.getAttribute("USER_ID").toString().equals(dto.getId())){	
			
			%>
				<div class="col-6">
					<button type="button" class="btn btn-secondary"
						onclick="Location.href='BoardEdit.jsp?num=<%=dto.getNum() %><%=queryStr %>';">
						수정하기</button>
					<button type="button" class="btn btn-success"
						onclick="isDelete();">삭제하기</button>
					<button type="button" class="btn btn-info">답글쓰기</button>
				</div>
			<%
			}
			%>
				<div class="col-6 text-right pr-5">
					<!-- 각종 버튼 부분 -->
					<!-- <button type="button" class="btn">Basic</button> -->
					<!-- <button type="button" class="btn btn-primary" 
						onclick="location.href='BoardWrite.jsp';">글쓰기</button> -->
					<!-- 
					<button type="button" class="btn btn-light">Light</button>
					<button type="submit" class="btn btn-danger">전송하기</button>
					<button type="reset" class="btn btn-dark">Reset</button>
					<button type="button" class="btn btn-link">Link</button> -->
					<button type="button" class="btn btn-warning" onclick="location.href='BoardList.jsp?<%=queryStr %>';">리스트보기</button>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="./inc/boardBottom.jsp" />
</div>
</body>
</html>

<!-- 
	<i class='fas fa-edit' style='font-size:20px'></i>
	<i class='fa fa-cogs' style='font-size:20px'></i>
	<i class='fas fa-sign-in-alt' style='font-size:20px'></i>
	<i class='fas fa-sign-out-alt' style='font-size:20px'></i>
	<i class='far fa-edit' style='font-size:20px'></i>
	<i class='fas fa-id-card-alt' style='font-size:20px'></i>
	<i class='fas fa-id-card' style='font-size:20px'></i>
	<i class='fas fa-id-card' style='font-size:20px'></i>
	<i class='fas fa-pen' style='font-size:20px'></i>
	<i class='fas fa-pen-alt' style='font-size:20px'></i>
	<i class='fas fa-pen-fancy' style='font-size:20px'></i>
	<i class='fas fa-pen-nib' style='font-size:20px'></i>
	<i class='fas fa-pen-square' style='font-size:20px'></i>
	<i class='fas fa-pencil-alt' style='font-size:20px'></i>
	<i class='fas fa-pencil-ruler' style='font-size:20px'></i>
	<i class='fa fa-cog' style='font-size:20px'></i>
	아~~~~힘들다...ㅋ
 -->