<%@page import="java.io.PrintWriter"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <meta http-equiv="X-UA-Compatible" content="ie=edge">
   <title>여기쩔더라</title>
   <link rel="stylesheet" href="resources/css/index.css">
   <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
      crossorigin="anonymous">
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
      </div>
      <div class="col-4 text-center">
      <a  href="index.jsp">
        <img src="resources/logo/0537.png" alt="" width="200"
            height="110"></a>
            <!-- 로고 하이퍼링크넣기 -->
      </div>
      <div class="col-4 d-flex justify-content-end align-items-center">
        
        <%
           if(userID == null){
        %>
        <a class="btn btn-sm mx-1 btn-outline-secondary" href="login.jsp">로그인</a>&nbsp;
        <a class="btn btn-sm mx-1 btn-outline-secondary" href="join.jsp">회원가입</a>
        
       <% }else if(userID != null){
            if(userID.equals("admin")){ %>
          <%=session.getAttribute("userID") %>님 환영합니다.
         <a class="btn btn-sm mx-1 btn-outline-secondary" href="/pr/admin/adminPage.jsp">어드민페이지</a>
         <a class="btn btn-sm mx-1 btn-outline-secondary" href="user/logoutAction.jsp">로그아웃</a>
         
            
        <%
        
           }else{
        %>
         <%=session.getAttribute("userID") %>님 환영합니다.
         <a class="btn btn-sm mx-1 btn-outline-secondary" href="myPage/myPage.jsp">마이페이지</a>
         <a class="btn btn-sm mx-1 btn-outline-secondary" href="user/logoutAction.jsp">로그아웃</a>
        <% 
           }
        %>
        <%
        }
        %>
        
      </div>
    </div>
  </header>

  <div class="nav-scroller py-1 mb-2">
    <nav class="nav d-flex justify-content-between">
       <a class="p-2 link-secondary" href="culture.jsp">만든이</a>
      <a class="p-2 link-secondary" href="restaurant.jsp">Restaurant</a>
      <a class="p-2 link-secondary" href="pub.jsp">Pub</a>
      <a class="p-2 link-secondary" href="cafe.jsp">Cafe</a>
      <a class="p-2 link-secondary" href="community.jsp">Community</a>
      
    </nav>
  </div>
</div>