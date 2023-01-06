<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>


<link rel="stylesheet" type="text/css" href="css/loginform.css">



</head>
<body>
	<%@include file="userHeader.jsp"%>



<div class="colorlib-partner">
	<div class="container">
		<div class="row">




			<div class="login-wrapper">
					<h2>Login</h2>
					<form method="post" action="login" id="login-form">
						<input type="text" name="mem_id" placeholder="Id"> <input
							type="password" name="mem_pwd" placeholder="Password"> <input
							type="submit" value="Login"> <label for="remember-check">
							<a href="memberIdFindForm.me"> 아이디 찾기 /</a>
						</label> <label for="remember-check"> <a
							href="memberPwFind.jsp"> 비밀번호 찾기 </a>
						</label>
					</form>
				</div>



		</div>
	</div>
</div>





	
	
	<%@include file="footer.jsp"%>
</body>
</html>