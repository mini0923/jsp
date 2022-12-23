<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="board.Board" %>
<%@ page import="board.BoardDAO" %><%--데이터베이스 접근 객체 가져오기 --%>
<%@ page import="board.Comment" %>
<%@ page import="board.CommentDAO" %><%--데이터베이스 접근 객체 가져오기 --%>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<!-- 자유게시판 댓글 수정-->
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>여기쩔더라</title>
<link rel="stylesheet" href="resources/css/index.css">
<link rel="stylesheet" href="resources/css/community.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<%
		String userID=null;
		if(session.getAttribute("userID")!=null){
			userID=(String)session.getAttribute("userID");
		}
		int boardID=0;
		if(request.getParameter("boardID")!=null)
			boardID=Integer.parseInt(request.getParameter("boardID"));
		if(boardID==0){
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다.')");
			script.println("location.href='community.jsp'");
			script.println("</script>");
		}
		Board board = new BoardDAO().getBoard(boardID);
		
		int commentID = 0;
		if(request.getParameter("commentID")!=null)
			commentID=Integer.parseInt(request.getParameter("commentID"));
		Comment comment = new CommentDAO().getComment(commentID);
		
	%>
	<div class="container">
		<header class="blog-header py-3">
			<div
				class="row flex-nowrap justify-content-around align-items-center">
				<div class="col-4 pt-1">
					<a class="link-secondary" href="#">Subscribe</a>
				</div>
				<div class="col-4 text-center">
					<a class="blog-header-logo text-dark" href="index.jsp">Large</a>
				</div>
				<div class="col-4 d-flex justify-content-end align-items-center">
					<a class="link-secondary" href="#" aria-label="Search"> <svg
							xmlns="http://www.w3.org/2000/svg" width="20" height="20"
							fill="none" stroke="currentColor" stroke-linecap="round"
							stroke-linejoin="round" stroke-width="2" class="mx-3" role="img"
							viewBox="0 0 24 24">
							<title>Search</title><circle cx="10.5" cy="10.5" r="7.5"></circle>
							<path d="M21 21l-5.2-5.2"></path></svg>
					</a>

					<%
						//비 로그인 경우
						if (userID == null) {
					%>
					<a class="btn btn-sm btn-outline-secondary" href="login.jsp">로그인</a>&nbsp;
					<a class="btn btn-sm btn-outline-secondary" href="join.jsp">회원가입</a>
					<%
						//로그인 시
						} else {
					%>
					<%=session.getAttribute("userID")%>님 환영합니다. <a
						class="btn btn-sm btn-outline-secondary" href="myPage.jsp">마이페이지</a>&nbsp;
					<a class="btn btn-sm btn-outline-secondary"
						href="user/logoutAction.jsp">로그아웃</a>
					<%
						}
					%>
				</div>
			</div>
		</header>
	</div>
	<div class="container">
	<div class="board_test">
		<div class="board_list_wrap">
			<table class="board_list">
				<thead>
					<tr>
						<td colspan=2>게시판 글 보기</td>
					</tr>
				</thead>
				 <tbody>            
                    <tr>
                        <td>글 제목</td>
                        <td><%= board.getBoardTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></td>
                    </tr>
                    <tr>
                        <td>작성자</td>
                        <td><%= board.getUserID() %></td>
                    </tr>
                    <tr>
                        <td>작성일자</td>
                        <td><%= board.getBoardDate().substring(0,11)+board.getBoardDate().substring(11,13)+"시"+board.getBoardDate().substring(14,16)+"분" %></td>
                    </tr>
                    <tr>
                        <td>내용</td>
                        <td><%= board.getBoardContent().replaceAll(" ","&nbsp;").replaceAll("<","&lt;").replaceAll(">","&gt;").replaceAll("\n","<br>") %></td>
                    </tr>
                </tbody>
			</table>
		</div>
		</div>
	</div>
	<div class="container">
	<div class="board_test">
		<div class="board_list_wrap">
			<table class="board_list">
				<thead>
					<tr>
						<td>댓글</td>
					</tr>
				</thead>
				 <tbody>            
                    <tr>
                        <td><form method="post" action="board/commentUpdateAction.jsp?boardID=<%=boardID%>&commentID=<%=commentID%>">
                        <input type="text" class="form-control" placeholder="댓글 쓰기" name="commentContent" maxlength="300" value=<%=comment.getCommentContent() %>></td> 
                                 
                    </tr>
                </tbody>
			</table>
		</div>
		<div class="right">
		<input type="submit" class="btn btn-secondary" value="댓글수정">
		<a href="community.jsp" class="btn btn-secondary">목록</a>
		</div>
		</form>
		</div>
	</div>
 
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>