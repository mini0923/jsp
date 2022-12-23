<%@page import="java.io.PrintWriter"%>
<%@page import="tastyboard.TastyLike"%>
<%@page import="tastyboard.TastyLikeDAO"%>
<%@page import="tastyboard.Tasty"%>
<%@page import="tastyboard.TastyImage"%>
<%@page import="java.util.ArrayList"%>
<%@page import="tastyboard.TastyDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- 술집 -->
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>여기쩔더라</title>
<link rel="stylesheet" href="resources/css/index.css">
<link rel="stylesheet" href="resources/css/bestList.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
<script src="https://kit.fontawesome.com/bd0f83fb2e.js"
	crossorigin="anonymous"></script>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%@include file ="header.jsp" %>
	<%
        
       		
	       	TastyDAO tastyDAO = new TastyDAO();
			Tasty tasty1 = tastyDAO.best1();
	        TastyImage tastyimage1 = tastyDAO.bestImage1();
	        Tasty tasty2 = tastyDAO.best2();
	        TastyImage tastyimage2 = tastyDAO.bestImage2();
	        Tasty tasty3 = tastyDAO.best3();
	        TastyImage tastyimage3 = tastyDAO.bestImage3();
        %>

	<div class="container">
	
		<div class="row">
		<div align="center" text-weight="bold"><h1>베스트 게시판</h1></div><hr>
		<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
							<!-- Restaurant베스트 게시글 -->
							
							<div id="card" class="col mb-5">
							<div class="text-center">
							<p class="www"><img class="crown" src="resources/image/crown.png" alt="...">Restaurant</p>
							</div>
								<div class="card h-100">
									<input type="image" class="card-img-top"
										src="tastyImage/<%=tastyimage1.getTiName() %>" alt="..." />
									<div class="card-body p-4">
										<div class="text-center">
											<h5 class="fw-bolder"><%=tasty1.getTastyTitle() %></h5>
											<%=tasty1.getTastyLocation() %>
										</div>
									</div>
									<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
										<div class="text-center">
											<a id="btn1" class="btn btn-outline-dark mt-auto"
												href="tastyView.jsp?tastyID=<%=tasty1.getTastyID()%>">
												자세히 보기</a>
										</div>
									</div>
								</div>
							</div>
							
							<!-- Pub베스트 게시글 -->
							
							<div id="card" class="col mb-5">
							<div class="text-center">
							<p class="www"><img class="crown" src="resources/image/crown.png" alt="..." >Pub</p>
							</div>
								<div class="card h-100">
									<input type="image" class="card-img-top"
										src="tastyImage/<%=tastyimage2.getTiName() %>" alt="..." />
									<div class="card-body p-4">
										<div class="text-center">
											<h5 class="fw-bolder"><%=tasty2.getTastyTitle() %></h5>
											<%=tasty2.getTastyLocation() %>
										</div>
									</div>
									<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
										<div class="text-center">
											<a id="btn1" class="btn btn-outline-dark mt-auto"
												href="tastyView.jsp?tastyID=<%=tasty2.getTastyID()%>">
												자세히 보기</a>
										</div>
									</div>
								</div>
							</div>
							
							<!-- Cafe베스트 게시글 -->
							
							<div id="card" class="col mb-5">
							<div class="text-center">
							<p class="www"><img class="crown" src="resources/image/crown.png" alt="...">Cafe</p>
							</div>
								<div class="card h-100">
									<input type="image" class="card-img-top"
										src="tastyImage/<%=tastyimage3.getTiName() %>" alt="..." />
									<div class="card-body p-4">
										<div class="text-center">
											<h5 class="fw-bolder"><%=tasty3.getTastyTitle() %></h5>
											<%=tasty3.getTastyLocation() %>
										</div>
									</div>
									<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
										<div class="text-center">
											<a id="btn1" class="btn btn-outline-dark mt-auto"
												href="tastyView.jsp?tastyID=<%=tasty3.getTastyID()%>">
												자세히 보기</a>
										</div>
									</div>
								</div>
							</div>
							
			</div>	
	</div>
					
						
	<!-- footer -->
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
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>