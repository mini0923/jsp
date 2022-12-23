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
   
   String boardID = request.getParameter("boardID");
	
	BoardDAO bdao = new BoardDAO();
	int result = bdao.adminDelete(boardID);

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