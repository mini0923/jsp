<%@page import="java.util.ArrayList"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="board.Board"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/pr/resources/css/userManagement.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<title>Insert title here</title>
</head>
<body>
<%

		String boardID = null;
		
		if(session.getAttribute("boardID") != null){
			boardID = (String) session.getAttribute("boardID");
		}
		
		
		int pageNumber = 1; //기본페이지
		if (request.getParameter("pageNumber") != null){
		 	pageNumber = Integer.parseInt(request.getParameter("pageNumber")); //파라미터는 꼭 이런식으로 바꿔줘야됨
		}
		
		
%>

	<div class="container">
			<div class="board_list_wrap">
				<table class="board_list">
				<thead>
				        <tr>
				            <td>글 번호</td>
				            <th>제목</td>
				            <td>작성자</td>
				            <td>작성일</td>
				            <td>삭제여부</td>
				        </tr>
				        </thead>
				 <tbody>
				        <%
					    BoardDAO boardDAO = new BoardDAO();
					    ArrayList<Board> List = boardDAO.getList(pageNumber);
					    
					%>
					<% for (Board f : List) { %>
		        <tr>
   			            <td><%= f.getBoardID()%></td>
			      	    <td><%= f.getBoardTitle()%> </td>
			            <td><%= f.getUserID()%> </td>
			            <td><%= f.getBoardDate()%></td>
			            <td>
			           <form method="post" name="adminDelete" action="/pr/board/adminBoardDeleteAction.jsp">
						 글번호 : <input type="text" name="boardID" maxlength="17" >
						<input type="submit" value="삭제" class="btn btn-outline-secondary">
					</form>
			           </td>
		         </tr>
			    <% } %>
			     </tbody>
				</table>
			</div>
		</div>
		<div class="paging">
		<div class="btn-toolbar mb-3" role="toolbar" aria-label="Toolbar with button groups">
	  		<div class="btn-group me-2" role="group" aria-label="First group">
	  		<%
                if(pageNumber != 1) {
            %>
                <a href="communityManagement.jsp?pageNumber=<%=pageNumber - 1 %>" class="btn btn-success btn-arrow-right"> << </a>
            <%
                } if (boardDAO.nextPage(pageNumber + 1)) {
            %>
                <a href="communityManagement.jsp?pageNumber=<%=pageNumber + 1 %>" class="btn btn-success btn-arrow-left"> >> </a>
            
            <%	
                }
            %>
	  		</div>
		</div>
	</div>
</body>
</html>