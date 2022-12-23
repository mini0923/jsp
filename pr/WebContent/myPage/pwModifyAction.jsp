<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "user.UserDAO" %>
<%@ page import = "java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String userId = (String)session.getAttribute("userID");
		String oldPassword = request.getParameter("oldPassword");
		String newPassword = request.getParameter("newPassword");
		
		UserDAO udao = new UserDAO();
		
		int result = udao.pwModify(newPassword, userId, oldPassword);
		
		if(result == 1){
			PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('비밀번호가 변경되었습니다.')");
            script.println("location.href = '/pr/myPage/myPage.jsp'");    // 메인 페이지로 이동
            script.println("</script>");
		}else if(result == 0){
			PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('비밀번호가 일치하지 않습니다.')");
            script.println("history.back()");    // 메인 페이지로 이동
            script.println("</script>");
		}else{
			PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('db오류.')");
            script.println("location.href = '/pr/myPage.jsp'");
            script.println("</script>");
		}
	%>
</body>
</html>