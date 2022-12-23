<%@page import="java.util.ArrayList"%>
<%@page import="tastyboard.Tasty"%>
<%@page import="tastyboard.TastyLikeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- 관리자가 제공해주는 사이트에서 좋아요폼 -->
<meta charset="UTF-8">
<link rel="stylesheet" href="/pr/resources/css/userManagement.css">
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
					<thead>
						<tr>
							<td>번호</td>
							<td>제목</td>
							<td>작성자</td>
							<td>작성일</td>
						</tr>
					</thead>
					<tbody>
						<%
							TastyLikeDAO tastyLikeDAO = new TastyLikeDAO();
								ArrayList<Tasty> list = tastyLikeDAO.getList(userID, pageNumber);
							for(int i=0; i<list.size(); i++){
						%>
						<tr>
							<td><%= list.get(i).getTastyID() %></td>
							<td><a href="/pr/tastyView.jsp?tastyID=<%=list.get(i).getTastyID()%>
							&tastyID=<%= list.get(i).getTastyID() %>"><%= list.get(i).getTastyTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">","&gt;").replaceAll("\n","<br>") %></a></td>
							<td><%= list.get(i).getUserID() %></td>
							<td><%= list.get(i).getTastyDate().substring(0,11) + list.get(i).getTastyDate().substring(11,13) + "시" + list.get(i).getTastyDate().substring(14,16) + "분" %></td>
						</tr>
						</tr>
						<%
							}
						%>
					</tbody>
				</table>
			</div>
</body>
</html>