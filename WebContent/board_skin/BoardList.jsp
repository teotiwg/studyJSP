<%@page import="common.BoardConfig"%>
<%@page import="model1.board2.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="model1.board2.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// application 내장객체를 인수로 DAO객체 생성(DB연결)
BoardDAO dao = new BoardDAO(application);
// 파라미터 저장 위한 MAP컬렉션 생성
Map<String, Object> param = new HashMap<String, Object>();
// 검색에 대한 파라미터를 받아서 변수에 저장
String searchField = request.getParameter("searchField");// 검색할 필드명
String searchWord = request.getParameter("searchWord");// 검색어

String queryStr = "";

// 사용자가 검색하면..
if(searchWord != null){
	// 검색필드와 검색어를 Map에 추가
	param.put("searchField", searchField);
	param.put("searchWord", searchWord);
	
	queryStr = "&searchField=" + searchField + "&searchWord=" + searchWord;
}
// 게시물의 전체 갯수를 카운트하기 위한 메소드 호출
int totalCount = dao.selectCount(param);

int pageSize = BoardConfig.PAGE_PER_SIZE;
int blockPage = BoardConfig.PAGE_PER_BLOCK;
int totalPage = (int)Math.ceil((double)totalCount/pageSize);
int pageNum = 1;

String pageTemp = request.getParameter("pageNum");
if(pageTemp != null && !pageTemp.equals(""))
	pageNum = Integer.parseInt(pageTemp);

int start =(pageNum - 1) * pageSize + 1;
int end = pageNum * pageSize;

param.put("start", start);
param.put("end", end);

//System.out.println(start + " = "+ end);

List<BoardDTO> boardLists = dao.selectList(param);
dao.close();
%>    
    
<jsp:include page="./inc/boardHead.jsp" />
<body>
<div class="container">
	<jsp:include page="./inc/boardTop.jsp" />
	<div class="row">		
		<div class="col-3">
			<div style="height: 100px; line-height: 100px; margin:10px 0; text-align: center; 
				color:#ffffff; background-color:rgb(133, 133, 133); border-radius:10px; font-size: 1.5em;">
				웹사이트제작
			</div>
			<div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
				<a class="nav-link active" id="v-pills-home-tab" data-toggle="pill" href="#v-pills-home" role="tab" aria-controls="v-pills-home" aria-selected="true">자유게시판</a>
				<a class="nav-link" id="v-pills-profile-tab" data-toggle="pill" href="#v-pills-profile" role="tab" aria-controls="v-pills-profile" aria-selected="false">자료실</a>
				<a class="nav-link" id="v-pills-messages-tab" data-toggle="pill" href="#v-pills-messages" role="tab" aria-controls="v-pills-messages" aria-selected="false">방명록</a>				
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Menu</a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="#">Sub Menu 1</a>
						<a class="dropdown-item" href="#">Sub Menu 2</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#">Sub Menu 3</a>
						<a class="dropdown-item" href="#">Sub Menu 4</a>
					</div>
				</li>
			</div>
		</div>
		<div class="col-9 pt-3">
			<h3>게시판 - <small>목록보기</small></h3>
			
			<div class="row">
				<!-- 검색부분 -->
				<form class="form-inline ml-auto" method="get">	
					<div class="form-group">
						<select name="searchField" class="form-control">
							<option value="title">제목</option>
							<option value="name">작성자</option>
							<option value="content">내용</option>
						</select>
					</div>
					<div class="input-group">
						<input type="text" name="searchWord"  class="form-control"/>
						<div class="input-group-btn">
							<button type="submit" class="btn btn-warning">
								<i class='fa fa-search' style='font-size:12px'></i>
							</button>
						</div>
					</div>
				</form>	
			</div>
			<div class="row mt-3">
				<!-- 게시판리스트부분 -->
				
				<table class="table table-bordered table-hover table-striped">
				<colgroup>
					<col width="60px"/>
					<col width="*"/>
					<col width="120px"/>
					<col width="120px"/>
					<col width="80px"/>
					<col width="60px"/>
				</colgroup>				
				<thead>
				<tr style="background-color: rgb(133, 133, 133); " class="text-center text-white">
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회수</th>
					<th>첨부</th>
				</tr>
				</thead>				
				<tbody>
				<%--for(int i=1 ; i<=5 ; i++){ --%>
				<%
				if(boardLists.isEmpty()){
					// 컬렉션에 저장된 데이터가 없다면..
				%>
				<tr>
					<td colspan="5" align="center">
						등록된 게시물이 없습니다.
					</td>
				</tr>
				<%
				}
				else{
					int vNum= 0;
					int countNum = 0;
					for(BoardDTO dto: boardLists){
						vNum = totalCount - (((pageNum - 1) * pageSize) + countNum++);
				%>
				<!-- 리스트반복 -->
				<tr>
					<td class="text-center"><%=dto.getNum() %></td>
					<td class="text-left"><a href="BoardView.jsp?num=<%=dto.getNum() %>"><%=dto.getTitle() %></a></td>
					<td class="text-center"><%=dto.getId() %></td>
					<td class="text-center"><%=dto.getPostdate() %></td>
					<td class="text-center"><%=dto.getVisitcount() %></td>
					<td class="text-center"><i class="material-icons" style="font-size:20px">attach_file</i></td>
				</tr> 	
				<%
					}
				}
				%>			 
				<%-- } --%>
				</tbody>
				</table>
			</div>
			<div class="row">
				<div class="col text-right">
					<!-- 각종 버튼 부분 -->
					<button type="button" class="btn">Basic</button>
					<button type="button" class="btn btn-primary" onclick="location.href='BoardWrite.jsp';">글쓰기</button>
					<button type="button" class="btn btn-secondary">수정하기</button>
					<button type="button" class="btn btn-success">삭제하기</button>
					<button type="button" class="btn btn-info">답글쓰기</button>
					<button type="button" class="btn btn-warning">리스트보기</button>
					<button type="button" class="btn btn-danger">전송하기</button>
					<button type="button" class="btn btn-dark">Reset</button>
					<button type="button" class="btn btn-light">Light</button>
					<button type="button" class="btn btn-link">Link</button>
				</div>
			</div>
			<div class="row mt-3">
				<div class="col">
					<!-- 페이지번호 부분 -->
					<ul class="pagination justify-content-center">
						<li class="page-item"><a href="#" class="page-link"><i class="fas fa-angle-double-left"></i></a></li>
						<li class="page-item"><a href="#" class="page-link"><i class="fas fa-angle-left"></i></a></li>
						<li class="page-item"><a href="#" class="page-link">1</a></li>		
						<li class="page-item active"><a href="#" class="page-link">2</a></li>
						<li class="page-item"><a href="#" class="page-link">3</a></li>
						<li class="page-item"><a href="#" class="page-link">4</a></li>		
						<li class="page-item"><a href="#" class="page-link">5</a></li>
						<li class="page-item"><a href="#" class="page-link"><i class="fas fa-angle-right"></i></a></li>
						<li class="page-item"><a href="#" class="page-link"><i class="fas fa-angle-double-right"></i></a></li>
					</ul>
				</div>				
			</div>		
		</div>
	</div>
	<div class="row border border-dark border-bottom-0 border-right-0 border-left-0"></div>
	<div class="row mb-5 mt-3">		 
		<div class="col-2">
			<h3>겸이아빠&trade;</h3>
		</div>
		<div class="col-10 text-center">
			Email : nakjasabal@naver.com&nbsp;&nbsp;
			Mobile : 010-7906-3600&nbsp;&nbsp;
			Address : 서울시 금천구 가산동 426-5 월드메르디앙2차 1강의실
			<br/>
			copyright &copy; 2019 한국소프트웨어인재개발원.
			All right reserved.
		</div>
	</div>
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