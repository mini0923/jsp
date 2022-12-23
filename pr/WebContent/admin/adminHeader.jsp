<%@page import="java.io.PrintWriter"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <meta http-equiv="X-UA-Compatible" content="ie=edge">
   <title>여기쩔더라</title>
   
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Gamja+Flower&family=Hahmlet:wght@200&display=swap" rel="stylesheet">
   <script src="https://kit.fontawesome.com/bd0f83fb2e.js" crossorigin="anonymous"></script>
</head>
<body>
 
        <%
           String userID = null;
           if(session.getAttribute("userID") != null){
              userID = (String) session.getAttribute("userID");
           }
        %>
        
<div class="container">
  <header class="blog-header py-3">
    <div class="row flex-nowrap justify-content-around align-items-center">
      <div class="col-4">
        <a class="search link-secondary" href="#">어드민 페이지</a>
      </div>
      <div class="col-4 text-center">
      <a  href="/pr/index.jsp">
        <img src="/pr/resources/logo/0537.png" alt="" width="200"
				height="110">
				<!-- 로고 하이퍼링크넣기 -->
				</a>
      </div>
      <div class="col-4 d-flex justify-content-end align-items-center">
        
        <%
        	if(userID == null){
        %>
        <a class="btn btn-sm mx-1 btn-outline-secondary" href="/pr/login.jsp">로그인</a>&nbsp;
        <a class="btn btn-sm mx-1 btn-outline-secondary" href="/pr/join.jsp">회원가입</a>
        <%
        	}else{
        %>
         <%=session.getAttribute("userID") %>님 환영합니다.
         <a class="btn btn-sm mx-1 btn-outline-secondary" href="/pr/user/logoutAction.jsp">로그아웃</a>
         
        <% 
        	}
        %>
        
      </div>
    </div>
  </header>
	<div class="container">
		<div class="nav-scroller py-1 mb-2">
			<nav class="nav d-flex justify-content-between">
				<a	class="p-2 link-secondary" href="#">Culture</a>
				<a class="p-2 link-secondary" href="/pr/restaurant.jsp">Restaurant</a> 
				<a class="p-2 link-secondary" href="/pr/pub.jsp">Pub</a> 
				<a class="p-2 link-secondary" href="/pr/cafe.jsp">Cafe</a> 
				<a class="p-2 link-secondary" href="/pr/community.jsp">Community</a> 
			</nav>
		</div>
	</div>

	<nav>
			<ul class="menu fieldset">
				<li><a href="?pageChange=userManagement.jsp">회원조회</a></li>
				<li><a href="#">게시글관리</a>
					<ul class="submenu">
						<li><a href="?pageChange=communityManagement.jsp">커뮤니티 관리</a></li>
						<li><a href="?pageChange=tastyManagement.jsp">맛집 관리</a></li>
					</ul></li>
				<li><a href="?pageChange=tastyWrite.jsp">글작성</a></li>
			</ul>
	</nav>
