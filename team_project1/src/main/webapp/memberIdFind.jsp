<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 비밀번호 찾기</title>

<link rel="stylesheet" type="text/css" href="css/loginform.css">

</head>
<body>

	

		
<div class="colorlib-partner">
	<div class="container">
		<div class="row">




			<div class="login-wrapper">
					<h2>Find ID</h2>
					<form method="post" action="memberIdFindAction.me" id="login-form">
						<input type="text" name="mem_email" placeholder="이메일입력" required="required"> 
						<input type="submit" value="아이디찾기"> 
				
					</form>
				</div>



		</div>
	</div>
</div>

	<%@include file="footer.jsp"%>

		
</body>
</html>