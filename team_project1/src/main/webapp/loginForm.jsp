<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
</head>
<body>
	<%@include file="userHeader.jsp"%>
	<section id="loginFormArea">
		<div style="padding : 100px; font-family: mv Boli;">
			<div style="border: 1px solid gold; padding-top: 50px; padding-bottom: 50px;">
				<form action="login" method="POST">

					<b style="font-size: 40px; color: gold;">LOGIN</b>

					<div class="td_right" style="padding-top: 10px;">
						<input type="text" placeholder="아이디" name="mem_id" id="id"
							style="width: 250px; height: 35px; font-size: 20px; padding:5px"
							maxlength=20; />
					</div>

					<div class="td_right" style="padding-top: 5px;">
						<input type="password" placeholder="비밀번호" name="mem_pwd" id="passwd"
							style="width: 250px; height: 35px; font-size: 20px; padding:5px"
							maxlength="20" />
					</div>

					<div style="padding-top: 10px;">
						<input type="submit" value="로그인" id="selectButton"
							style="width: 100px; height: 35px; font-size: 20px;" />
					</div>
					
					<div style="padding-top: 5px;">	
						<input type="button" value="아이디/비밀번호 찾기" id=""
							style="width: 185px; height: 35px; font-size: 20px;" />
					</div>


				</form>
			</div>
		</div>
	</section>
	<%@include file="footer.jsp"%>
</body>
</html>