<%@page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- 자유게시판 글 쓰기-->
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>여기쩔더라</title>
<link rel="stylesheet" href="resources/css/index.css?after">
<link rel="stylesheet" href="resources/css/community.css">
<link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
   rel="stylesheet"
   integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
   crossorigin="anonymous">
   <script type="text/javascript">
      function check(){
         var title = document.board.boardTitle;
         var content = document.board.boardContent;
         
         if(title.value == ""){
            alert("제목을 입력해주세요");
            title.focus();
            return false;
         }
         if(content.value == ""){
            alert("내용을 입력해주세요");
            content.focus();
            return false;
         }
         return true;
      }
   </script>
</head>
<body>
<%@include file ="header.jsp" %>

   <div class="container">
      <h4 class="mb-3">게시판글작성</h4>
      <form method="post" name="board" action="board/writeAction.jsp" enctype="multipart/form-data" onsubmit="return check()">
         <div>
            <div class="col-12">
               <label for="title" class="form-label">제목</label> <input type="text"
                  class="form-control" placeholder="글 제목" name="boardTitle" maxlength="20">
            </div><br>
            <div class="col-12">   
               <label for="content" class="form-label">내용</label> <textarea
                  type="text" class="form-control" name="boardContent" maxlength="2048"
                  style="height: 400px; resize : none;"></textarea>
            </div>
            <div class="col-12">
               <label for="content" class="form-label">사진</label> <input
                  type="file" class="form-control" name="boardImage" accept="image/png, image/jpeg">
            </div>
            <hr class="my-4">

            <button class="w-100 btn btn-secondary btn-lg" type="submit">글작성</button>
         </div>
      </form>

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
   <script
      src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"
      integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB"
      crossorigin="anonymous"></script>
   <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"
      integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13"
      crossorigin="anonymous"></script>
</body>
</html>