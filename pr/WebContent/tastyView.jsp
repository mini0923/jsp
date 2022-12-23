<%@page import="tastyboard.TastyDAO"%>
<%@page import="tastyboard.Tasty"%>
<%@page import="tastyboard.TastyUpload"%>
<%@page import="tastyboard.TastyLike"%>
<%@page import="tastyboard.TastyLikeDAO"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- 관리자가 제공하는 상세페이지 -->
<meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>여기쩔더라</title>
        
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="resources/css/product.css" rel="stylesheet" />
        <link rel="stylesheet" href="resources/css/tastyView.css">
        <script src="https://kit.fontawesome.com/bd0f83fb2e.js" crossorigin="anonymous"></script>
		<link
			href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
			rel="stylesheet"
			integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
			crossorigin="anonymous">
</head>
<body>

	<%
	request.setCharacterEncoding("UTF-8");

	int tastyID = 0;
	
	if (request.getParameter("tastyID") != null) {
		tastyID = Integer.parseInt(request.getParameter("tastyID"));
	}
	
	int pageNumber = 1; // 기본페이지 기본적으로 페이지 1부터 시작하므로
    if (request.getParameter("pageNumber") != null)
    {
        pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
    }
	
	Tasty tasty = new TastyDAO().getTasty(tastyID);
	TastyUpload tastyupload = new TastyDAO().getUpload(tastyID);
	
	TastyDAO tastyDAO = new TastyDAO();
	
    tastyDAO.tastyCount(tastyID);
    

	%>

	<%@include file ="header.jsp" %>	
	
   <!-- Product section-->	
	<div class="container">
		<p class="p5">게시판 글 보기</p>
      <hr class="my-4">
      <div class="row">
         <div class="col-2">
            <p class="p1">제목</p>
           <div class="rad">
               <p class="p2"><%=tasty.getTastyTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;")
               .replaceAll("\n", "<br>")%></p>
            </div>
         </div>
         <div class="col-2">
            <p class="p1">매장번호</p>
            <div class="rad">
               <p class="p2"><%=tasty.getTastyTel().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;")
               .replaceAll("\n", "<br>")%></p>
            </div>
         </div>
         <div class="col-4">
            <p class="p1">주소</p>
            <div class="rad">
               <p class="p2"><%=tasty.getTastyLocation().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;")
                       .replaceAll("\n", "<br>") %></p>
            </div>
         </div>
         <div class="col-2">
            <p class="p1">조회수</p>
            <div class="rad">
               <p class="p2"><%=tasty.getTastyCount() %></p>
            </div>
         </div>
         <div class="col-2">
            <p class="p1">좋아요 수</p>
            <div class="rad">
               <p class="p2"><%=tasty.getTastyLikeCount()%></p>
            </div>
         </div>
         
      </div>
      <hr>
      <div class="row">
	      <div id="image" class="col-5">
				<div id="carouselExampleCaptions" class="carousel slide image"
					data-bs-ride="carousel">
					<div class="carousel-inner">
						<div class="carousel-item active" data-bs-interval="2500">
							<img class="d-block w-100"
								src="tastyImage/<%=tastyupload.getTuName()%>" alt="...">

						</div>
						<div class="carousel-item" data-bs-interval="2500">
							<img class="d-block w-100"
								src="tastyImage/<%=tastyupload.getTuName1()%>" alt="...">

						</div>
						<div class="carousel-item" data-bs-interval="2500">
							<img class="d-block w-100"
								src="tastyImage/<%=tastyupload.getTuName2()%>" alt="...">
						</div>
					</div>
					<button class="carousel-control-prev" type="button"
						data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
						<span class="carousel-control-prev-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Previous</span>
					</button>
					<button class="carousel-control-next" type="button"
						data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
						<span class="carousel-control-next-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Next</span>
					</button>
				</div>
			</div>
         <div class="col-7">
         <p class="p3">맛집 설명</p>
            <div class="rad">
               <p class="con">            
               <%=tasty.getTastyContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;")
               .replaceAll("\n", "<br>")%></p>
            </div>
			<div class="ddd">
 				<p class="p3">영업시간</p>
        					
             	 <p class="con"><%=tasty.getTastyHour().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></p>
            </div>
            

         
           <div>
						<%
							TastyLikeDAO tastyLikeDAO = new TastyLikeDAO();
							ArrayList<TastyLike> list2 = tastyLikeDAO.gettastyLike(userID, tastyID);
							if (list2.isEmpty()) {
						%>
								<td><button id="btnh1"
										class="btn"
										onclick="location.href='tastyboard/tastyLikeAction.jsp?tastyID=<%=tastyID%>'">
										<i class="fa-regular fa-heart"></i>
									</button></td>
								<%
							} else {
						%>
								<td><button id="btnh1"
										class="btn"
										onclick="location.href='tastyboard/tastyLikeAction.jsp?tastyID=<%=tastyID%>'">
										<i class="fa-solid fa-heart"></i>
									</button></td>
								<%
							}
						%>
						</div>
						</div>
       
      </div>
            

        <!-- Footer-->
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
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js">
	</script>
</body>
</html>