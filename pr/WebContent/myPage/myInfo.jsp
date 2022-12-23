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

   </script>
   <div class="dddd">
   <div class="board_list_wrap">
      <table class="board_list">
         <caption>회원정보</caption>
         <tbody>
            <%
                   UserDAO userDAO = new UserDAO();
                   List<User> List = userDAO.Info(userID, pageNumber);
                   
               %>
            <% for (User f : List) { %>
            <tr>
               <td>이름</td>
               <td><%= f.getUserName() %> </td>
            </tr>
            <tr>
               <td>생년월일</td>
               <td><%= f.getUserDate() %></td>
            </tr>
            <tr>
               <td>아이디</td>
               <td><%= f.getUserID() %></td>
            </tr>
            <tr>
               <td>패스워드</td>
               <td><%= f.getUserPassword() %></td>
            </tr>
            <tr>
               <td>이메일</td>
               <td><%= f.getUserEmail() %></td>
            </tr>
            
            <% } %>
         </tbody>
      </table>
   </div>
   </div>
</body>
</html>