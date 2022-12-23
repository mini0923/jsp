<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="tastyboard.TastyLikeDAO"%>
<%@ page import="tastyboard.Tasty"%>
<%@ page import="tastyboard.TastyLike"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.ArrayList"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="tastyboard" class="tastyboard.TastyLike" scope="page" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>맛집 게시판</title>
</head>
<body>
	<%
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		if (userID == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 해주세요.')");
			script.println("location.href = '/pr/login.jsp'");
			script.println("</script>");
		} else {
			int tastyID = 0;
			if (request.getParameter("tastyID") != null) {
				tastyID = Integer.parseInt(request.getParameter("tastyID"));
			}
			if (tastyID == 0) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('유효하지 않은 글입니다 action.')");
				script.println("location.href = '/pr/login.jsp'");
				script.println("</script>");
			}
			TastyLikeDAO tastylikeDAO = new TastyLikeDAO();
			
			ArrayList<TastyLike> list = tastylikeDAO.gettastyLike(userID, tastyID);
			
			int result = 0;
			
			if (list.isEmpty()) {
				result = tastylikeDAO.write(userID, tastyID);
			} else {
				result = tastylikeDAO.delete(userID, tastyID);
			}
			if (result == -1) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('평가를 실패했습니다.')");
				script.println("history.back()");
				script.println("</script>");
			}

			else {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href=document.referrer;");
				script.println("</script>");
			}
		}
	%>
</body>
</html>