<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
<link rel="stylesheet"
	href="<c:url value="resources/css/login.css"></c:url>" >
	<script type="text/javascript">
	   window.onload=function(){
		 sessionStorage.clear();
		 localStorage.clear();
	   };
	</script>
</head>
<body>
	<div class="box">
		<div class="Login">
			<span>${msg}</span>
			<form action="log" method="post">
				<h2>Login</h2>
				<h4>
					Doesn't have an account yet? <a href="signup">SignUp</a>
				</h4>
				<label for="lblun">Enter UserName</label> <input type="text"
					name="username" value="" id="lblun" placeholder="User Name"><br>
				<label for="lblpass">Enter Password <a href="#">Forgot
						password</a>
				</label> <input type="password" name="password" value="" id="lblpass"
					placeholder="Enter Password"><br> <input type="checkbox"><label
					for="">Remember me</label> <input type="submit" name="submit"
					value="Login"><br><span>${mass}</span>

				<h3>------------- or login with -------------</h3>

				<input type="submit" id="goog" value="Google"> <input
					type="submit" id="face" value="FaceBook">
			</form>
		</div>
		<div class="image">
			<img src="<c:url value='/resources/images/slide1.jpg'/>" alt="">
		</div>
	</div>
</body>
</html>