<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 메인 페이지 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>여기쩔더라</title>
<link rel="stylesheet" href="resources/css/main.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"rel="stylesheet">
</head>
<body>
<%@include file ="header.jsp" %>

<main class="container">
<div class="row">
   <div class="col-9">
      <div id="carouselExampleCaptions" class="carousel slide"
         data-bs-ride="carousel">
         <div class="carousel-inner">
            <div class="carousel-item active" data-bs-interval="2500">
               <img src="resources/carousel/Caprese Basil Salad.jpg"
                  class="d-block w-100" alt="...">

            </div>
            <div class="carousel-item" data-bs-interval="2500">
               <img src="resources/carousel/Mad for Garlic Dome Salad.jpg"
                  class="d-block w-100" alt="...">

            </div>
            <div class="carousel-item" data-bs-interval="2500">
               <img src="resources/carousel/Spicy Myeongran Oil Pasta.jpg"
                  class="d-block w-100" alt="...">

            </div>
            <div class="carousel-item" data-bs-interval="2500">
               <img src="resources/carousel/Pumpkin Spicy Cream Pizza.jpg"
                  class="d-block w-100" alt="...">

            </div>
            <div class="carousel-item" data-bs-interval="2500">
               <img src="resources/carousel/Triple Garlic Pasta.jpg"
                  class="d-block w-100" alt="...">
            </div>
         </div>
      </div>
   </div>
   <div class="col-3">
   <a  href="bestList.jsp" style="text-decoration: none; color: black;">
      <div class="tbox">
                   <p>실시간으로 맛집들이 궁금하다면?</p>
                   <h1>BEST 게시글로 들어와보세요!</h1>
                   <div class="line"></div>
               </div>
               </a>
         <img class="image" src="resources/image/image1.jpg" alt="...">
      

   </div>
</div>
   <div class="row">
      <div class="col-4">
         <img class="image1" src="resources/image/image2.jpg" alt="...">
      </div>
      <div class="col-4">
         <img class="image2" src="resources/image/image3.jpg" alt="...">
      </div>
      <div class="col-4">
         <img class="image3" src="resources/image/image4.jpg" alt="...">
      </div>
   </div>
</main>


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