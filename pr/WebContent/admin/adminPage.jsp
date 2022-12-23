<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>여기쩔더라</title>
	<link rel="stylesheet" href="/pr/resources/css/index.css">
	<link rel="stylesheet" href="/pr/resources/css/adminPage1.css" type="text/css">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
	
</head>
<body>
 
	<%@include file ="adminHeader.jsp" %>	
         <%
         String select = request.getParameter("pageChange");
         if (select == null) {
             select = "userManagement.jsp";
         }
    	 %>


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