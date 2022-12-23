<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/pr/resources/css/pwModify.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"rel="stylesheet">
<title>Insert title here</title>
   <script type="text/javascript">
      function checkValue(){
         var pw = document.userDelete.userPassword.value;
         
         if(!pw){
            alert("비밀번호를 입력해주세요");
            return false;
         }
         return true;
      }
   </script>
</head>
<body>
   <div id="aa" class="container">
      <h5 id="bb">회원탈퇴</h5>
      <div>
         <form method="post" name="userDelete" action="../user/deleteAction.jsp" onsubmit="return checkValue()">
            비밀번호 : <input class="btn btn-outline-secondary" type="password" name="userPassword" maxlength="17"> <input class="btn btn-secondary" type="submit" value="탈퇴">
         </form>
      </div>
   </div>
</body>
</html>