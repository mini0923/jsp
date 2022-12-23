<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>여기쩔더라</title>
<link rel="stylesheet" href="resources/css/index.css?after">
<link href="resources/css/style.css" rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
</head>
<body>
<div class="container">
  <header class="blog-header py-3">
    <div class="row flex-nowrap justify-content-around align-items-center">
      <div class="col-4 pt-1">
        <a class="link-secondary" href="#">추후 삭제</a>
      </div>
      <div class="col-4 text-center">
        <a class="blog-header-logo text-dark" href="index.jsp">It's Crazy Here</a>
      </div>
      <div class="col-4 d-flex justify-content-end align-items-center">
        <a class="link-secondary" href="#" aria-label="Search">
          <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="mx-3" role="img" viewBox="0 0 24 24"><title>Search</title><circle cx="10.5" cy="10.5" r="7.5"></circle><path d="M21 21l-5.2-5.2"></path></svg>
        </a>
        <a class="btn btn-sm btn-outline-secondary" href="loginForm.jsp">Log in</a>&nbsp;
        <a class="btn btn-sm btn-outline-secondary" href="signupForm.jsp">Sign up</a>
      </div>
    </div>
  </header>

  <div class="nav-scroller py-1 mb-2">
    <nav class="nav d-flex justify-content-between">
	      <a class="p-2 link-secondary" href="restaurant.jsp">Restaurant</a>
	      <a class="p-2 link-secondary" href="pub.jsp">Pub</a>
	      <a class="p-2 link-secondary" href="cafe.jsp">Cafe</a>
	      <a class="p-2 link-secondary" href="community.jsp">Community</a>
	      <a class="p-2 link-secondary" href="#">Culture</a>
    </nav>
  </div>
</div>
</body>
</html>