<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/pr/resources/css/pwModify.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"rel="stylesheet">
<title>비밀번호 변경</title>
	<script type="text/javascript">
	
		function pwModify(){
			var pw =document.getElementById('pw').value;
			var pw2 =document.getElementById('pw2').value;
			var pw3 =document.getElementById('pw3').value;
			
			var pattern1 = /[0-9]/; //숫자
	        var pattern2 = /[a-zA-Z]/; // 영어대소문자
	        var pattern3 = /[~!@\#$%<>^&*]/; //특수문자
	        var kor =  /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/; //한글
			
			if(!pw){
				alert("현재 비밀번호를 입력해주세요");
				return false;
			}
			
			if(!pw2){
				alert("새 비밀번호를 입력해주세요");
				return false;
			}
			
			if(!pw3){
				alert("새 비밀번호 확인를 입력해주세요");
				return false;
			}
			
			if(pw == pw2){
				alert("기존 비밀번호와 일치합니다.");
				return false;
			}
			
			if(pw2 != pw3){
				alert("새 비밀번호가 일치하지 않습니다.");
				return false;
			}
			
			if(pw.length < 3 || pw.length > 20){
        	  	alert("3자리 ~ 20자리 이내로 입력해주세요.");  
        		return false; 
	        }
	       
	        if(!pattern1.test(pw2)||!pattern2.test(pw2)){
	        	 alert("영문,숫자으로 구성하여야 합니다.");
	        	//alert("영문, 숫자, 특수문자로 구성해주세요.");
	        	 return false;
	        }
	        
	        if(pattern3.test(pw2)){
	        	alert("비밀번호를 특수문자를 포함할수없습니다.");
	        	return false;
	        }
	        
	        if(kor.test(pw2)){
	        	alert("비밀번호를 한글를 포함할수없습니다.");
	        	return false;
	        }
	
	        if(pw2.search(/\s/) != -1){
	        	alert("비밀번호에 공백을 포함할수없습니다.");
	        	return false;
	        }
				return true;
			}
	</script>
</head>
<body>
<div id="aa" class="container">
	<form  method="post" action="pwModifyAction.jsp" onsubmit="return pwModify()">
		<input class="btn btn-outline-secondary" type="password" name="oldPassword" id="pw"  placeholder="현재 비밀번호"><br><br>
		<input class="btn btn-outline-secondary" type="password" name="newPassword" id="pw2"  placeholder="새 비밀번호"><br><br>
		<input class="btn btn-outline-secondary" type="password" name="newPasswordCk" id="pw3"  placeholder="새 비밀번호 확인"><br><br>
		<input class="btn btn-secondary" type = "submit" value="비밀번호 변경">
	</form>
	</div>
</body>
</html>