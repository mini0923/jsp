<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "user.UserDAO" %>
<%@ page import = "user.User" %>
<!DOCTYPE html>
<html>
<head>
<!-- 아이디 중복확인 2-->
<meta charset="UTF-8">
<link rel="stylesheet" href="/pr/resources/css/pwModify.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"rel="stylesheet">
<title>아이디 중복 확인</title>
</head>
<body>	
	<script type="text/javascript">
	function valueCheck(){
		var form = document.idChecked.userID;
		var kor =  /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
		var reg = /[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]/g;
		
		//한글 포함X
		if(kor.test(form.value)){
			alert("아이디에 한글을 포함할수없습니다.");
			location.href = "idCheck.jsp";
			return false;
		}
		
		//특수문자 포함x
		if(reg.test(form.value)){
			alert("아이디에 특수문지을 포함할수없습니다.");
			location.href = "idCheck.jsp";
			return false;
		}
		
		//공백 포함X
		if(form.value.search(/\s/) != -1){
        	alert("아이디에 공백을 포함할수없습니다.");
        	location.href = "idCheck.jsp";
        	return false;
        }
		
		//글수 제한
		 if(form.value.length < 3 || form.value.length > 17){
	        	alert("아이디를 3자리 ~ 20자리 이내로 입력해주세요.");  
	        	location.href = "idCheck.jsp";
	        	return false; 
	        }
			return true;
		}
	</script>
	<%//1. 한글처리 & 받아온 파라미터 변수화
		request.setCharacterEncoding("UTF-8");
		String userID = request.getParameter("userID");
		
		UserDAO udao = new UserDAO();
		%>
	<div id="aa" class="container">
	<fieldset>
		<form action="idChecked.jsp" method="post" name="idChecked" onsubmit="return valueCheck()">
			userID : <input class="btn btn-outline-secondary" type="text" name="userID" maxlength="16" value="<%=userID%>">
				<input class="btn btn-secondary" type="submit" value="중복 확인">	 
		</form>
	</fieldset>
	<br>
		<%
		if(userID != null){
			int result = udao.idCheck(userID);
			
			if (result == 1){
				out.print("사용가능한 아이디입니다");
				//5. 아이디사용하기버튼추가 => 동기방식사용 but 요즘은 비동기방식을 더 많이사용한다
				%>
				 <input class="btn btn-outline-secondary" type="button" value="아이디 사용하기" onclick="result();">
				<%
				
			}else if(result == 0){
				out.print("중복된 아이디입니다");
			}else{
				out.print("에러 발생!!!(-1)"); 
			}
			}
	%>
	 <script type="text/javascript">
	    function result(){
	    	if(document.idChecked.userID.value != ""){
			opener.document.userInfo.userID.value = document.idChecked.userID.value;
	    	window.close();
	    	}else {
	    		alert("아이디를 입력해주세요.");  
	        	location.href = "idCheck.jsp";
	    	}
	    }
	 
	 </script>
</fieldset>
</div>
</body>
</html>