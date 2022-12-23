<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/culture.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"rel="stylesheet">
<title>여기쩔더라</title>
</head>
<body>
<%@include file ="header.jsp" %>

	<div class="container">
                <div class="text-center">
                    <h2 class="heading">여기쩔더라</h2>
                    <h3 class="section-subheading text-muted">맛집 소개 사이트</h3>
                </div>
                <ul class="timeline">
                    <li>
                        <div class="timeline-image"><img class="rounded-circle img-fluid" src="resources/image/yuna.jpg" alt="..."></div>
                        <div class="timeline-panel">
                            <div class="timeline-heading">
                                <h4>우당탕탕 남매들</h4>
                            </div>
                            <div class="timeline-body"><p class="text-muted">정성민, 서재형, 문용현, 장예림, 하유나</p></div>
                        </div>
                    </li>
                    <li class="timeline-inverted">
                        <div class="timeline-image"><img class="rounded-circle img-fluid" src="resources/image/sm.jpg" alt="..."></div>
                        <div class="timeline-panel">
                            <div class="timeline-heading">
                                <h4>정성민</h4>
                                <h4 class="subheading">팀장 / 백엔드개발자</h4>
                            </div>
                            <div class="timeline-body"><p class="text-muted">팀장으로 팀을 잘 이끌면서, 백 기능 개발을 담당하였다.</p></div>
                        </div>
                    </li>
                    <li>
                        <div class="timeline-image"><img class="rounded-circle img-fluid" src="resources/image/jh.jpg" alt="..."></div>
                        <div class="timeline-panel">
                            <div class="timeline-heading">
                                <h4>서재형</h4>
                                <h4 class="subheading">백엔드 개발자</h4>
                            </div>
                            <div class="timeline-body"><p class="text-muted">팀장과 함께 백 기능 개발을 도와주었다.</p></div>
                        </div>
                    </li>
                    <li class="timeline-inverted">
                        <div class="timeline-image"><img class="rounded-circle img-fluid" src="resources/image/yh.jpg" alt="..."></div>
                        <div class="timeline-panel">
                            <div class="timeline-heading">
                                <h4>문용현</h4>
                                <h4 class="subheading">프론트엔드 개발자</h4>
                            </div>
                            <div class="timeline-body"><p class="text-muted">프론트 기본적인 레이아웃과 틀을 잡아 프론트 개발을 하였다.</p></div>
                        </div>
                    </li>
                    <li>
                        <div class="timeline-image"><img class="rounded-circle img-fluid" src="resources/image/yn.jpg" alt="..."></div>
                        <div class="timeline-panel">
                            <div class="timeline-heading">
                                <h4>하유나</h4>
                                <h4 class="subheading">프론트엔드 개발자</h4>
                            </div>
                            <div class="timeline-body"><p class="text-muted"> 기본 틀에서 세부적인 프론트엔드 개발을 하였다.</p></div>
                        </div>
                    </li>
                     <li class="timeline-inverted">
                        <div class="timeline-image"><img class="rounded-circle img-fluid" src="resources/image/yr.jpg" alt="..."></div>
                        <div class="timeline-panel">
                            <div class="timeline-heading">
                                <h4>장예림</h4>
                                <h4 class="subheading">디자인 / 자료수집</h4>
                            </div>
                            <div class="timeline-body"><p class="text-muted"> 기본적인 홈페이지 디자인과 자료수집을 하였고,<br>홍보영상을 만들었다.</p></div>
                        </div>
                    </li>
                    
                </ul>
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
   src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>