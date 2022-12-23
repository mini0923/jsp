<%@page import="tastyboard.TastyDAO"%>
<%@page import="tastyboard.Tasty"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <%
	   		 
 String tastyID = request.getParameter("tastyID");
	
	TastyDAO tdao = new TastyDAO();
	int result = tdao.adminDelete(tastyID);

	if(result == 1){
	 	PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('게시글이 삭제 되었습니다.')");
        script.println("location.href = '/pr/admin/adminPage.jsp'");    // 메인 페이지로 이동
        script.println("</script>");
        
	}else if(result == 0){
		PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('게시글이 없습니다.')");
        script.println("history.back()");    
        script.println("</script>");
	}
	else{
		PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('db오류.')");
        script.println("</script>");
	}
%>
</body>
</html>