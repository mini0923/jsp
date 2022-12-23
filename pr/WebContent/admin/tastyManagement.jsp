<%@page import="java.util.ArrayList"%>
<%@page import="tastyboard.TastyDAO"%>
<%@page import="tastyboard.Tasty"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <meta http-equiv="X-UA-Compatible" content="ie=edge">
   <title>여기쩔더라</title>
<link rel="stylesheet" href="/pr/resources/css/userManagement.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Gamja+Flower&family=Hahmlet:wght@200&display=swap" rel="stylesheet">
   <script src="https://kit.fontawesome.com/bd0f83fb2e.js" crossorigin="anonymous"></script>

</head>
<body>

	
	<%
	String tastyID = null;
	
	
	
	if(session.getAttribute("tastyID") != null){
		tastyID = (String) session.getAttribute("tastyID");
	}
	
	
	int pageNumber = 1; //기본페이지
	if (request.getParameter("pageNumber") != null){
	 	pageNumber = Integer.parseInt(request.getParameter("pageNumber")); //파라미터는 꼭 이런식으로 바꿔줘야됨
	}
	%>

	<div class="container">
		<div class="board_list_wrap">
			<table class="board_list">
				<caption>자유 게시판</caption>
				<thead>
					<tr>
						<td>글번호</td>
						<td>제목</td>
						<td>카테고리</td>
						<td>번호</td>
						<td>작성일</td>
						<td>삭제여부</td>
					</tr>
				</thead>
				 <tbody>
                <%
                    TastyDAO tastyDAO = new TastyDAO();
                    ArrayList<Tasty> list = tastyDAO.getList2(pageNumber);
                    
                    {
                %>
	               	 <% for (Tasty f : list) { %>
				        <tr>
	   			            <td><%= f.getTastyID()%></td>
				      	    <td><%= f.getTastyTitle()%> </td>
				      	    <td><%= f.getTastyCategory()%> </td>
				      	    <td><%= f.getTastyTel()%> </td>
				            <td><%= f.getUserID()%> </td>
				            <td><%= f.getTastyDate()%></td>
				            <td>
		            <form method="post" name="adminDelete" action="/pr/tastyboard/adminTastyDeleteAction.jsp">
						 글번호 : <input type="text" name="tastyID" maxlength="1000" >
						<input type="submit" value="삭제" class="btn btn-outline-secondary">
					</form>
					</td>
				         </tr>
				    <% } %>
                <%
                    }
                %>
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
                <a href="tastyManagement.jsp?pageNumber=<%=pageNumber - 1 %>" class="btn btn-success btn-arrow-right"> << </a>
            <%
                } if (tastyDAO.nextPage(pageNumber + 1)) {
            %>
                <a href="tastyManagement.jsp?pageNumber=<%=pageNumber + 1 %>" class="btn btn-success btn-arrow-left"> >> </a>
            
            <%	
                }
            %>
	  		</div>
		</div>
	</div>
</body>
</html>