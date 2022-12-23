<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="board.LikeListDAO"%>
<%@ page import="board.LikeList"%>
<%@ page import="board.Board"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.ArrayList"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="board" class="board.LikeList" scope="page" />
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
			int boardID = 0;
			if (request.getParameter("boardID") != null) {
				boardID = Integer.parseInt(request.getParameter("boardID"));
			}
			if (boardID == 0) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('유효하지 않은 글입니다.')");
				script.println("location.href = '/pr/login.jsp'");
				script.println("</script>");
			}
			LikeListDAO likeListDAO = new LikeListDAO();
			ArrayList<LikeList> list = likeListDAO.getlikeList(userID, boardID);
			int result = 0;
			if (list.isEmpty()) {
				result = likeListDAO.write(userID, boardID);
			} else {
				result = likeListDAO.delete(userID, boardID);
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