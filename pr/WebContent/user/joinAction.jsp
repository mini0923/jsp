<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "user.UserDAO" %>
<%@ page import = "java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
 
<jsp:useBean id="user" class="user.User" scope="page"></jsp:useBean>
<jsp:setProperty name="user" property="userName"/>
<jsp:setProperty name="user" property="userDate"/>
<jsp:setProperty name="user" property="userID"/>
<jsp:setProperty name="user" property="userPassword"/>
<jsp:setProperty name="user" property="userEmail"/>
 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP BBS</title>
</head>
<body>
    <%
    	String userID = null;
    	if (session.getAttribute("userID") != null){
            userID = (String) session.getAttribute("userID");
    	}
    	if (userID != null){
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('이미 로그인되었습니다.')");
            script.println("location.href = '/pr/main.jsp'");    // 메인 페이지로 이동
            script.println("</script>");
    	}
    		UserDAO userDAO = new UserDAO();
            int result = userDAO.join(user);
            if (result == 1){ 
                 // 회원가입 성공시
            	session.setAttribute("userID", user.getUserID()); // 추가
                PrintWriter script = response.getWriter();
                script.println("<script>");
                script.println("location.href = '/pr/main.jsp'");    // 메인 페이지로 이동
                script.println("</script>");
            }
    %>
 
</body>
</html>