<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- 아이디 폼 -->
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>로그인</title>
<link href="resources/css/loginForm.css" rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body class="text-center">
	<div class="container">
		<main id="aa" class="form-signin">
		<form method="post" action="user/loginAction.jsp">
			<img class="mb-4" src="resources/logo/0537.png" alt="" width="200"
				height="110">
			<h1 class="h3 mb-3 fw-normal">로그인 페이지</h1>

			<div class="form-floating">
				<input type="text" class="form-control" id="floatingInput"
					placeholder="ID" maxlength="16"
					oninput="loginFormCheck(this)"name="userID"> <label for="floatingInput">ID</label>
			</div>
			<div class="form-floating">
				<input type="password" class="form-control" id="floatingPassword"
					placeholder="Password" maxlength="16"
					oninput="loginFormCheck(this)"name="userPassword"> <label
					for="floatingPassword">Password</label>
			</div>
			<br>
				<button class="w-50 btn btn-lg btn-secondary" type="submit">로그인</button>
				<br><br>
				<p>회원이 아닌신가요?</p>
				<a class="btn btn-sm mx-1 btn-outline-secondary" href="join.jsp">회원가입</a>
			<p class="mt-5 mb-3 text-muted">© 우당탕탕남매들 2022-</p>
		</form>
		</main>
	</div>
	<script type="text/javascript" src="resources/js/form.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>