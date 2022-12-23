<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="board.BoardDAO"%>
<%@ page import="board.Board"%>
<%@ page import="board.LikeListDAO"%>
<%@ page import="board.LikeList"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.lang.Math" %>
<!DOCTYPE html>
<html>
<head>
<!--내가 쓴 커뮤니티 게시글 -->
<meta charset="UTF-8">
<title>커뮤니티 좋아요 리스트</title>
<link rel="stylesheet" href="/pr/resources/css/userManagement.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
<%
	String userID = null;
		if(session.getAttribute("userID") != null){
	userID = (String) session.getAttribute("userID");
		}
		int pageNumber = 1; //기본페이지
		if (request.getParameter("pageNumber") != null){
	pageNumber = Integer.parseInt(request.getParameter("pageNumber")); //파라미터는 꼭 이런식으로 바꿔줘야됨
		}
%>



	<div class="board_list_wrap">
				<table class="board_list">
					<thead>
						<tr>
							<td>번호</td>
							<td>제목</td>
							<td>작성자</td>
							<td>작성일</td>
							<td>삭제여부</td>
						</tr>
					</thead>
					<tbody>
						<%
							BoardDAO boardDAO = new BoardDAO();
								ArrayList<Board> list = boardDAO.getList1(userID, pageNumber);
							for(int i=0; i<list.size(); i++){
						%>
						<tr>
							<td><%= list.get(i).getBoardID() %></td>
							<td><a href="/pr/communityView.jsp?boardID=<%=list.get(i).getBoardID()%>
							&boardID=<%= list.get(i).getBoardID() %>"><%= list.get(i).getBoardTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">","&gt;").replaceAll("\n","<br>") %></a></td>
							<td><%= list.get(i).getUserID() %></td>
							<td><%= list.get(i).getBoardDate().substring(0,11) + list.get(i).getBoardDate().substring(11,13) + "시" + list.get(i).getBoardDate().substring(14,16) + "분" %></td>
							<td>
							<form method="post" name="adminDelete" action="/pr/board/boardDeleteAction.jsp">
						 		글번호 : <input type="text" name="boardID" maxlength="9999" >
							<input type="submit" value="삭제" class="btn btn-outline-secondary">
							</form>
							</td>
						
						</tr>
						<%
							}
						%>
					</tbody>
				</table>
			</div>
		</div>
	</div>	

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script> 
</body>
</html>