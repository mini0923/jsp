<%@page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- 관리자 제공 페이지 쓰는 폼 -->
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>여기쩔더라</title>
<link rel="stylesheet" href="resources/css/index.css">
<link rel="stylesheet" href="resources/css/tastyWrite.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
   <script type="text/javascript">
      function check(){
         var form = document.tasty;
         
         if(form.tastyTitle.value == ""){
            alert("제목을 입력해주세요");
            form.tastyTitle.focus();
            return false;
         }
         
         if(form.tastyLocation.value == ""){
            alert("장소를 입력해주세요");
            form.tastyLocation.focus();
            return false;
         }
         
         if(form.tastyTel.value == ""){
            alert("번호를 입력해주세요");
            form.tastyTel.focus();
            return false;
         }
         
         if(form.tastyCategory.value == "null"){
            alert("카테고리를 선택해주세요");
            form.tastyCategory.focus();
            return false;
         }
         
         if(form.tastyHour.value == ""){
             alert("영업시간을 입력해주세요");
             form.tastyHour.focus();
             return false;
          }
         
         if(form.tastyContent.value == ""){
            alert("내용을 입력해주세요");
            form.tastyContent.focus();
            return false;
         }
         
         if(form.tastyImage.value == ""){
            alert("썸네일을 업로드해주세요");
            form.tastyImage.focus();
            return false;
         }
         
         if(form.tastyImage0.value == ""){
            alert("사진1을 업로드해주세요");
            form.tastyImage0.focus();
            return false;
         }
         
         if(form.tastyImage1.value == ""){
            alert("사진2을 업로드해주세요");
            form.tastyImage1.focus();
            return false;
         }
         
         if(form.tastyImage2.value == ""){
            alert("사진3을 업로드해주세요");
            form.tastyImage2.focus();
            return false;
         }
         
         
         return true;
      }
   </script>
</head>
<body>
         
    <div class= "container">
       <div class= "row">
          <form method="post" name="tasty" action="/pr/tastyboard/tastyWriteAction.jsp"  enctype="multipart/form-data" onsubmit="return check()">
               <div class="row">
                  <div class="col-6">
                  <label for="title" class="form-label">제목</label>
                  <input
                      type="text" class="form-control" placeholder="글 제목"
                     name="tastyTitle" maxlength="20">
                     </div>
                     <div class="col-6">
                  <label for="location" class="form-label">장소</label>
                  <input type="text" class="form-control" name="tastyLocation"
                     maxlength="100">
               </div>
               </div>
               <div class="row">
               <div class="col-6">
                  <label for="tel" class="form-label">번호</label>
                  <input type="text" class="form-control" name="tastyTel" maxlength="20">
               </div>
               <div class="col-6">
                  <label for="category" class="form-label">카테고리</label><br>
                  <select class="form-select" aria-label="Default select example" name ="tastyCategory">
                       <option value = "null" selected>카테고리를 고르시오</option>
                       <option value="Restaurant">Restaurant</option>
                       <option value="Pub">Pub</option>
                       <option value="Cafe">Cafe</option>
                     </select>
               </div>
               
               </div>
                <div class="row">
                <div class="col-12">  
               		<label for="content" class="form-label">영업 시간</label> <textarea
                  type="text" class="form-control" name="tastyHour" maxlength="1000"
                  style="height: 100px"></textarea>
               </div>
               </div>
              
               	
               <hr>
            <div class="col-12">   
               <label for="content" class="form-label">내용</label> <textarea
                  type="text" class="form-control" name="tastyContent" maxlength="2048"
                  style="height: 400px; resize : none;"></textarea>
            </div>
            <hr>
            <div class="col-12">
               <label for="content" class="form-label">썸네일 사진</label> <input
                  type="file" class="form-control" name="tastyImage" accept="image/png, image/jpeg">
            
               <label for="content" class="form-label">사진1</label> <input
                  type="file" class="form-control" name="tastyImage0" accept="image/png, image/jpeg">
                  
               <label for="content" class="form-label">사진2</label> <input
                  type="file" class="form-control" name="tastyImage1" accept="image/png, image/jpeg">
                  
               <label for="content" class="form-label">사진3</label> <input
                  type="file" class="form-control" name="tastyImage2" accept="image/png, image/jpeg">
            
            </div> 
            <br>
              <button class="w-100 btn btn-secondary btn-lg" type="submit">글작성</button>
          </form>
           </div>
    </div>
    
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>