<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="board.BoardDAO"%>
<%@ page import="board.Board"%>
<%@ page import="java.io.PrintWriter"%>
<%
	request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP board</title>
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
			script.println("alert('로그인하세요.')");
			script.println("location.href = '/pr/login.jsp'"); // 메인 페이지로 이동
			script.println("</script>");
		}
		
		int boardID = 0;
		
		if (request.getParameter("boardID") != null) {
			boardID = Integer.parseInt(request.getParameter("boardID"));
		}
		Board board = new BoardDAO().getBoard(boardID);
		if (boardID == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다')");
			script.println("location.href = '/pr/community.jsp'");
			script.println("</script>");
		}
		
		
		
		
		if (!userID.equals(board.getUserID())) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("location.href = '/pr/community.jsp'");
			script.println("</script>");
		} else {
			if (request.getParameter("boardTitle") == null || request.getParameter("boardContent") == null
					|| request.getParameter("boardTitle").equals("")
					|| request.getParameter("boardContent").equals("")) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('모든 문항을 입력해주세요.')");
				script.println("history.back()"); // 이전 페이지로 사용자를 보냄
				script.println("</script>");
			} else {
				BoardDAO boardDAO = new BoardDAO();
				int result = boardDAO.update(boardID, request.getParameter("boardTitle"),
						request.getParameter("boardContent"));
				if (result == -1) { // 글수정 실패시
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글수정에 실패했습니다.')");
					script.println("history.back()"); // 이전 페이지로 사용자를 보냄
					script.println("</script>");
				} else { // 글쓰기 성공시
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("location.href = '/pr/community.jsp'"); // 메인 페이지로 이동
					script.println("</script>");
				}
			}
		}
	%>

</body>
</html>