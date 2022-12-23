<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="tastyboard.TastyDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%
	request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="tasty" class="tastyboard.Tasty" scope="page"></jsp:useBean>
<jsp:setProperty name="tasty" property="tastyTitle" />
<jsp:setProperty name="tasty" property="tastyLocation" />
<jsp:setProperty name="tasty" property="tastyTel" />
<jsp:setProperty name="tasty" property="tastyCategory" />
<jsp:setProperty name="tasty" property="tastyContent" />

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP Board</title>
</head>
<body>
	<%
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		
		int size = 10 * 1024 * 1024;
		String path = request.getServletContext().getRealPath("tastyImage");
		MultipartRequest multi = new MultipartRequest(request, path, size, "utf-8", new DefaultFileRenamePolicy());
		
		
		
		String title = multi.getParameter("tastyTitle");
		String local = multi.getParameter("tastyLocation");
		String tel = multi.getParameter("tastyTel");
		String cate = multi.getParameter("tastyCategory");
		String cont = multi.getParameter("tastyContent");
		String hour = multi.getParameter("tastyHour");
		
		String tiname = multi.getOriginalFileName("tastyImage");
		String tipath = multi.getFilesystemName("tastyImage");
		String tuname = multi.getOriginalFileName("tastyImage0");
		String tupath = multi.getFilesystemName("tastyImage0");
		String tuname1 = multi.getOriginalFileName("tastyImage1");
		String tupath1 = multi.getFilesystemName("tastyImage1");
		String tuname2 = multi.getOriginalFileName("tastyImage2");
		String tupath2 = multi.getFilesystemName("tastyImage2");
		
		
		if (userID == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인하세요.')");
			script.println("location.href = '/pr/login.jsp'"); // 메인 페이지로 이동
			script.println("</script>");
		} else {
			/* if (tasty.getTastyTitle() == null || tasty.getTastyLocation() == null || tasty.getTastyTel() == null 
					|| tasty.getTastyCategory() == null || tasty.getTastyContent() == null ) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('모든 문항을 입력해주세요.')");
				script.println("history.back()"); // 이전 페이지로 사용자를 보냄
				script.println("</script>");
			} else { */
				TastyDAO tastyDAO = new TastyDAO();
				int result = tastyDAO.write(title, local, cate,  userID, tel,
						cont,tasty.getTastyCount(), tasty.getTastyLikeCount(), hour, tasty.getTastyDate(), tiname, tipath, tuname, tupath, tuname1, tupath1, tuname2, tupath2);
				if (result == -1) { // 글쓰기 실패시
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글쓰기에 실패했습니다.')");
					script.println("history.back()"); // 이전 페이지로 사용자를 보냄
					script.println("</script>");
				} else { // 글쓰기 성공시
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("location.href = '/pr/main.jsp'"); // 메인 페이지로 이동
					script.println("</script>");
				}
			}
		//}
	%>

</body>
</html>