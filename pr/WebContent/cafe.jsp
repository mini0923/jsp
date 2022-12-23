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
<link rel="stylesheet" href="resources/css/pub.css">
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
          
            int pageNumber = 1; // 기본페이지 기본적으로 페이지 1부터 시작하므로
           if (request.getParameter("pageNumber") != null)
           {
               pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
           } 
            
        int tastyID = 1;
       	
       	if (request.getParameter("tastyID") != null) {
       		tastyID = Integer.parseInt(request.getParameter("tastyID"));
       	}
       	
       	if (tastyID == 0) {
       		PrintWriter script = response.getWriter();
       		script.println("<script>");
       		script.println("alert('유효하지 않은 글입니다')");
       		script.println("location.href = 'main.jsp'");
       		script.println("</script>");
       	}
       	
       	Tasty tasty = new TastyDAO().getTasty(tastyID);
        %>

	<div class="container">
		<div
			class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
			<%
			  TastyDAO tastyDAO = new TastyDAO();
			String tastyCategory = "Cafe";
            ArrayList<Tasty> list = tastyDAO.getList(tastyCategory, pageNumber);
    		ArrayList<TastyImage> list1 = tastyDAO.getList1(tastyCategory, pageNumber);
            for(int i = 0; i < list.size(); i++)
            {
                    	
						   %>
							<div id="card" class="col mb-5">
								<div class="card h-100">
									<input type="image" class="card-img-top"
										src="tastyImage/<%=list1.get(i).getTiName() %>" alt="..." />
									<div class="card-body p-4">
										<div class="text-center">
											<h5 class="fw-bolder"><%=list.get(i).getTastyTitle() %></h5>
											<%=list.get(i).getTastyLocation() %>
										</div>
									</div>
									<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
										<div class="text-center">
											<a id="btn1" class="btn btn-outline-dark mt-auto"
												href="tastyView.jsp?tastyID=<%=list.get(i).getTastyID()%>">
												자세히 보기</a>
												
											
										</div>
									</div>
								</div>
							</div>
							<%
				                    	}
				                    
				                %>

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