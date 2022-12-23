<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="board.BoardDAO" %>
<%@ page import="board.Board" %>
<!DOCTYPE html>
<html>
<head>
<!-- 자유게시판 수정-->
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>여기쩔더라</title>
<link rel="stylesheet" href="resources/css/index.css?after">
<link rel="stylesheet" href="resources/css/community.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
</head>
<body>
<%@include file ="header.jsp" %>
    <% 
   
    
    
    int boardID = 0;
    if (request.getParameter("boardID") != null)
    {
        boardID = Integer.parseInt(request.getParameter("boardID"));
    }
    
   
    Board board = new BoardDAO().getBoard(boardID);
    BoardDAO boardDAO = new BoardDAO();
    
    if (!userID.equals(board.getUserID())){
    	PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('권한이 없습니다.')");
        script.println("location.href = 'community.jsp'");
        script.println("</script>");
    }
    %>

    <div class="container">
		<h4 class="mb-3">게시판 글 수정</h4>
		<form method="post" action="board/updateAction.jsp?boardID=<%=boardID%>">
			<div>
				<div class="col-12">
					<label for="title" class="form-label">제목</label> <input type="text"
						class="form-control" placeholder="글 제목" name="boardTitle" maxlength="20" value="<%=board.getBoardTitle()%>">
				</div><br>
				<div class="col-12">	
					<label for="content" class="form-label">내용</label> <input
						type="text" class="form-control" name="boardContent" maxlength="2048"
						style="height: 400px" value="<%=board.getBoardContent()%>" >
				</div>
				<hr class="my-4">

				<button class="w-100 btn btn-secondary btn-lg" type="submit">글 수정</button>
			</div>
		</form>

	</div>

	<div class="container">
		<footer class="py-5">
			<div class="d-flex justify-content-between py-4 my-4 border-top">
				<p>© 2022 우당탕탕 남매들, Inc. All rights reserved.</p>
				<ul class="list-unstyled d-flex">
					<li class="ms-3"><a class="top" href="#">Back to Top</a></li>
				</ul>
			</div>
		</footer>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"
		integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"
		integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13"
		crossorigin="anonymous"></script>
</body>
</html>