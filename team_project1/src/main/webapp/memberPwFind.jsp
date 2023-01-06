<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>


<link rel="stylesheet" type="text/css" href="css/loginform.css">



</head>
<body>
	<%@include file="userHeader.jsp"%>
	


<div class="colorlib-partner">
	<div class="container">
		<div class="row">




			<div class="login-wrapper">
					<h2>Find PassWord</h2>
					
					
					<form method="post" action="memberPwFindAction.me" id="login-form">
						
						
						아이디:<input type="text" name="mem_id" placeholder="Id입력">
						 이메일:<input type="text" name="mem_email" placeholder="Email입력"> 
						 <input	type="submit" value="Find"> 
						 
						 
						 
					</form>
				</div>



		</div>
	</div>
</div>




	
	<%@include file="footer.jsp"%>
</body>
</html>