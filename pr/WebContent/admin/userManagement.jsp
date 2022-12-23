<%@page import="user.User"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="user.UserDAO"%>
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
			<caption>회원관리</caption>
			<thead>
				<tr>
					<td>이름</td>
					<td>생년월일</td>
					<td>아이디</td>
					<td>패스워드</td>
					<td>이메일</td>
					<td>삭제여부</td>
				</tr>
			</thead>
			<tbody>
				<%
					    UserDAO userDAO = new UserDAO();
					    List<User> List = userDAO.userList();
					    
					%>
				<% for (User f : List) { %>
				<tr>
					<td><%= f.getUserName() %> </td>
					<td><%= f.getUserDate() %></td>
					<td><%= f.getUserID() %></td>
					<td><%= f.getUserPassword() %></td>
					<td><%= f.getUserEmail() %></td>
			
					<td>
					
					<form method="post" name="adminDelete" action="/pr/user/adminUserDeleteAction.jsp">
					 아이디 : <input type="text" name="userID" maxlength="17" >
					<input type="submit" value="탈퇴" class="btn btn-outline-secondary">
					</form>
				</tr>
				<% } %>
			</tbody>
		</table>
	</div>
</body>
</html>