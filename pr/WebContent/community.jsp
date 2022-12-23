<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="board.BoardDAO" %>
<%@ page import="board.Board" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<!-- 자유게시판 -->
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>여기쩔더라</title>
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
	request.setCharacterEncoding("UTF-8");
%>
<%

	int boardID = 0;
	
    int pageNumber = 1; // 기본페이지 기본적으로 페이지 1부터 시작하므로
    if (request.getParameter("pageNumber") != null)
    {
        pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
    }
%>
	<!-- 여기서 부터 게시판 작업 -->
	<div class="container">
		<div class="board_list_wrap">
			<table class="board_list">
				<caption> 자유 게시판 </caption>
				<thead>
					<tr>
						
						<td>작성자</td>
						<td>제목</td>
						<td>작성일</td>
						<td>조회수</td>
					</tr>
				</thead>
				 <tbody>
                <%
                    BoardDAO boardDAO = new BoardDAO();
	                ArrayList<Board> list = boardDAO.getList(pageNumber);
	                boardDAO.Count(boardID);
                    for(int i = 0; i < list.size(); i++)
                    {
                    	
                %>
                
                    <tr>
                     	<td><%=list.get(i).getUserID() %></td>
                    	<td><a href="communityView.jsp?boardID=<%=list.get(i).getBoardID()%>"><%=list.get(i).getBoardTitle().replaceAll(" ","&nbsp;").replaceAll("<","&lt;").replaceAll(">", "&gt;").replaceAll("\n","<br>") %></a></td>	
                        <td><%=list.get(i).getBoardDate().substring(0,11) + list.get(i).getBoardDate().substring(11, 13) + "시" 
                        + list.get(i).getBoardDate().substring(14,16) + "분" %></td>
                   		<td><%=list.get(i).getBoardCount() %></td>
                       
                  
                     </tr>
                </tbody>
                <%
                    }
                %>
                
			</table>
		</div>
	</div>
	
	<div class="paging">
		<div class="btn-toolbar mb-3" role="toolbar" aria-label="Toolbar with button group	s">
	  		<div class="btn-group me-2" role="group" aria-label="First group">
	  		<%
                if(pageNumber != 1) {
            %>
                <a href="community.jsp?pageNumber=<%=pageNumber - 1 %>" class="btn btn-success btn-arrow-right"> << </a>
            <%
                } if (boardDAO.nextPage(pageNumber + 1)) {
            %>
                <a href="community.jsp?pageNumber=<%=pageNumber + 1 %>" class="btn btn-success btn-arrow-left"> >> </a>
            
            <%	
                }
            %>
	  		</div>
		</div>
	</div>
	<div class="container">
		<div class="write"> <a href="communityWrite.jsp"> <button type="button"class="btn btn-outline-secondary">글쓰기</button></div></a>
	</div>
</body>
</html>