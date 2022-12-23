<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- 마이페이지 -->
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>여기쩔더라</title>
<link rel="stylesheet" href="/pr/resources/css/index.css">
<link rel="stylesheet" href="/pr/resources/css/adminPage.css"
	type="text/css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
</head>
<body>
 
        <%
         String select = request.getParameter("pageChange");
         if (select == null) {
             select = "myInfo.jsp";
         }
         
    	 %>
	        
	<%@include file ="myPageHeader.jsp" %>

	<div class="container">
	
	<nav>
			<ul class="menu fieldset">
				<li><a href="?pageChange=myInfo.jsp">회원정보</a>
				<ul class="submenu">
						<li><a href="?pageChange=pwModify.jsp">비밀번호 변경</a></li>
						<li><a href="?pageChange=userDelete.jsp">회원 탈퇴</a></li>
					</ul></li>
				<li><a href="#">좋아요</a>
					<ul class="submenu">
						<li><a href="?pageChange=likeList.jsp">커뮤니티 좋아요</a></li>
						<li><a href="?pageChange=tastyLike.jsp">맛집 좋아요</a></li>
					</ul></li>
				<li><a href="?pageChange=myBoard.jsp">자신이 쓴 게시글</a>
				<li><a href="?pageChange=myComment.jsp">자신이 쓴 댓글</a>
			</ul>
	</nav>
	<jsp:include page="<%=select%>" flush="false" />
</div>
	<div class="container">
		<footer class="py-5">
			<div class="d-flex justify-content-between py-4 my-4 border-top">
				<p>© 2022 우당탕탕 남매들, Inc. All rights reserved.</p>
				<ul class="list-unstyled d-flex">
					<li class="ms-3"><a class="top" href="#">Back to Top</a></li>
				</ul>
			</div>
		</footer>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>