<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Sign Up</title>
<link href="resources/css/signup.css" rel="stylesheet">  <link rel="stylesheet" href="resources/css/index.css">
   <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
      crossorigin="anonymous">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Gamja+Flower&family=Hahmlet:wght@200&display=swap" rel="stylesheet">
   <script src="https://kit.fontawesome.com/bd0f83fb2e.js" crossorigin="anonymous"></script>
   <script>
      function valueCheck(){
         var form = document.userInfo;
         var name = document.userInfo.userName.value;
         
         var date = document.userInfo.userDate.value;
         var year = Number(date.substr(0,4));
         var month = Number(date.substr(4,2));
         var day = Number(date.substr(6,2));
         var today = new Date();
         var yearNow = today.getFullYear();
         
         var pw =document.getElementById('pw').value;
         var pw2 = document.getElementById('pw2').value;
         
         var pattern1 = /[0-9]/; //숫자
           var pattern2 = /[a-zA-Z]/; // 영어대소문자
           var pattern3 = /[~!@\#$%<>^&*]/; //특수문자
           var kor =  /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/; //한글
           var kor1 =  /[가-힣]/; //이름 한글
         
         if(!form.userName.value){
            alert("이름을 입력해주세요");
            form.userName.focus();
            return false;
         }
         
         if(pattern1.test(name)||pattern2.test(name)||pattern3.test(name)||!kor1.test(name)){
            alert("이름에 한글만 입력해주세요");
            form.userName.focus();
            return false;
         }
         
         if(!form.userDate.value){
            alert("생년월일을 입력해주세요");
            form.userDate.focus();
            return false;
         }
         
         if(!pattern1.test(date)||pattern2.test(date)||pattern3.test(date)||kor.test(date)){
            alert("생년월일에 숫자만 입력해주세요");
            form.userDate.focus();
            return false;
         }
         
         if(date.length == 8){
            if(1900 > year || year > yearNow){
               alert("생녕월일을 올바르게 입력하세요.");
               form.userDate.focus();
               return false;   
            }else if (month < 1 || month > 12) {
               alert("생녕월일을 올바르게 입력하세요.");
               form.userDate.focus();
               return false;
            } else if (day < 1 || day > 31) {
               alert("생녕월일을 올바르게 입력하세요.");
               form.userDate.focus();
               return false;
            } else if ((month==4 || month==6 || month==9 || month==11) && day==31) {
               alert("생녕월일을 올바르게 입력하세요.");
               form.userDate.focus();
               return false;
            } else if (month == 2) {
               var isleap = (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0));
               if (day>29 || (day==29 && !isleap)) {
                  alert("생녕월일을 올바르게 입력하세요.");
                  form.userDate.focus();
                  return false;
               }         
            }
         }else{
            alert("8글자로 입력해주세요");
            form.userDate.focus();
            return false;
         }
         
         if(!form.userID.value){
            alert("아이디 중복 확인해주세요");
            return false;
         }
         if(!form.userPassword.value){
            alert("비밀번호를 입력해주세요");
            form.userPassword.focus();
            return false;
         }
         if(!form.userPasswordCk.value){
            alert("비밀번호 확인을 입력해주세요");
            form.userPasswordCk.focus();
            return false;
         }
          
           if(pw.length < 8 || pw.length > 17){
                alert("8자리 ~ 16자리 이내로 입력해주세요.");  
              form.userPassword.focus();
              return false; 
           }
          
          if(!pattern1.test(pw)||!pattern2.test(pw)){
               alert("영문,숫자으로 구성하여야 합니다.");
              //alert("영문, 숫자, 특수문자로 구성해주세요.");
               form.userPassword.focus();
               return false;
           }
           
           if(pattern3.test(pw)){
              alert("비밀번호를 특수문자를 포함할수없습니다.");
              form.userPassword.focus();
              return false;
           }
           
           if(kor.test(pw)){
              alert("비밀번호를 한글를 포함할수없습니다.");
              form.userPassword.focus();
              return false;
           }

           if(pw.search(/\s/) != -1){
              alert("비밀번호에 공백을 포함할수없습니다.");
              form.userPasswordCk.focus();
              return false;
           }
         
         if(pw != pw2){
            alert("비밀번호가 동일하지 않습니다.");
            form.userPasswordCk.focus();
            return false;
         }
         
         if(!form.userEmail.value){
            alert("이메일을 입력해주세요");
            form.userEmail.focus();
            return false;
         }
         return true;
      }
   
   
   </script>
   <script>
        function idCheck(){     
         window.open("idCheck.jsp", "idCheck", "width=500, height=200 top=300 left=500");
        }
       
    </script>
</head>
<body>
<div class="container">
  <header class="blog-header py-3">
    <div class="row flex-nowrap justify-content-around align-items-center">
      <div class="col-4">
      </div>
      <div class="col-4 text-center">
        <img src="resources/logo/0537.png" alt="" width="200"
            height="110">
            <!-- 로고 하이퍼링크넣기 -->
      </div>
      <div class="col-4 d-flex justify-content-end align-items-center">

        <a class="btn btn-sm mx-1 btn-outline-secondary" href="login.jsp">로그인</a>&nbsp;
        <a class="btn btn-sm mx-1 btn-outline-secondary" href="main.jsp">메인으로</a>

      </div>
    </div>
  </header>
  </div>
   <div class="container">
      <div class="input-form-backgroud">
         <div class="aa input-form mx-auto">
            <h4 class="mb-3">회원가입</h4>
            <form  method="post" action="user/joinAction.jsp" class="validation-form"  name="userInfo"  onsubmit="return valueCheck()" novalidate>
               <div class="mb-3">
                  <label for="name">이름</label> <input type="text"
                     class="form-control" name="userName" placeholder="ex)홍길동" required
                     maxlength="5">
                  <div class="invalid-feedback">이름을 입력해주세요.</div>
               </div>
               
               <div class="mb-3">
                  <label for="date">생년월일</label> <input type="text"
                     class="form-control" name="userDate" placeholder="ex)20010101" required
                     maxlength="8">
                  <div class="invalid-feedback">생년월일를 입력해주세요.</div>
               </div>            
            
               <div class="mb-3">
                  <label for="id">아이디</label> <input type="text"
                     class="form-control" name="userID" placeholder="아이디 중복을 확인해주세요" readonly="readonly" required
                     maxlength="16">
                  <input class="btn btn-secondary btn-block" type="button" value="중복확인" onclick="idCheck()">
                  <div class="invalid-feedback">아이디를 입력해주세요.</div>
                  
               </div>

               <div class="mb-3">
                  <label for="password">비밀번호</label> <input type="password"
                     class="form-control" name="userPassword" id="pw" 
                     required maxlength="16" placeholder="영문, 숫자로  8~16글자로 구성해주세요">
                  <div class="invalid-feedback">Input Password</div>
               </div>

               <div class="mb-3">
                  <label for="password2">비밀번호 학인</label> <input type="password"
                     class="form-control" name="userPasswordCk" id="pw2"
                      required maxlength="16">
               </div>

               <!-- <div class="mb-3">
                  <label for="nickname">닉네임</label> <input type="text"
                     class="form-control" name="nickName" placeholder="홍길동" required
                     maxlength="16">
                  <div class="invalid-feedback">닉네임을 입력해주세요.</div>
               </div>  -->


               <div class="mb-3">
                  <label for="email">이메일</label> <input type="email"
                     class="form-control" name="userEmail" placeholder="you@example.com"
                     required maxlength="30">
                  <div class="invalid-feedback">이메일을 입력해주세요.</div>
               </div>
               <button class="btn btn-secondary btn-block" type="submit">가입  완료</button>
            </form>
         </div>
      </div>
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
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>