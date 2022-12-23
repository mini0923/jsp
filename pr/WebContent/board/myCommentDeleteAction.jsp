<%@page import="board.CommentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.BoardDAO" %>
<%@ page import="board.Board" %>
<%@ page import = "java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP board</title>
</head>
<body>
   <%
   
   String commentID = request.getParameter("commentID");
   
   	CommentDAO cdao = new CommentDAO();
	int result = cdao.adminDelete(commentID);

	if(result == 1){
	 	PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('댓글이 삭제 되었습니다.')");
        script.println("location.href = '/pr/myPage/myPage.jsp'");    // 메인 페이지로 이동
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