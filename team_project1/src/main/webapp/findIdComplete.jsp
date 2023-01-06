<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기 결과</title>

<link rel="stylesheet" type="text/css" href="css/loginform.css">
</head>
<body>
	<%@include file="userHeader.jsp"%>
	

	
	
	

<div class="colorlib-partner">
	<div class="container">
		<div class="row">




			<div class="login-wrapper">
					<form method="post" name="f" action="memberJoinAction.me"  id="login-form">
					<h2>고객님의 아이디   ${mem_id }</h2>
					<input type="button" onclick="location.href='loginForm.jsp'"  style="width:150px;" value="로그인">
						<input type="button" onclick="location.href='memberPwFindForm.me'"  style="width:150px;" value="비밀번호찾기">
						
					</form>
				</div>



		</div>
	</div>
</div>
	
	
	
	
	
	
	
	
	
		<%@include file="footer.jsp"%>
	
</body>
</html>