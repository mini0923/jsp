<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "user.UserDAO" %>
<!DOCTYPE html>
<html>
<head>
<!-- 아이디 중복확인 -->
<meta charset="UTF-8">
<link rel="stylesheet" href="/pr/resources/css/pwModify.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"rel="stylesheet">
<title>아이디 중복 확인</title>
	<script type="text/javascript">
	function valueCheck(){
		var form = document.idCheck.userID;
		var kor =  /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
		var reg = /[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]/g;
		
		/*if(!form.value){
			alert("아이디를 입력해주세요");
			form.userID.focus();
			return false;
		}		*/
		
		//한글 제한
		if(kor.test(form.value)){
			alert("아이디에 한글을 포함할수없습니다.");
			form.focus();
			return false;
		}
		
		//특수문자 제한
		if(reg.test(form.value)){
			alert("아이디에 특수문지을 포함할수없습니다.");
			form.focus();
			return false;
		}
		
		//공백 제한
		if(form.value.search(/\s/) != -1){
        	alert("아이디에 공백을 포함할수없습니다.");
        	form.focus();
        	return false;
        }
		
		//글수 제한
		 if(form.value.length < 3 || form.value.length > 17){
	        	alert("3자리 ~ 20자리 이내로 입력해주세요.");  
	        	form.focus();
	        	return false; 
	        }
			return true;
		}
	</script>
</head>
<body>	
<div id="aa" class="container">
		<form action="idChecked.jsp" method="post" name="idCheck" onsubmit="return valueCheck()">
			ID : <input class="btn btn-outline-secondary" type="text" name="userID" maxlength="16">
				<input class="btn btn-secondary" type="submit" value="중복 확인">	 
		</form>
</div>
</fieldset>
</body>
</html>