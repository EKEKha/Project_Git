<%@page import="org.eclipse.jdt.internal.compiler.lookup.IQualifiedTypeResolutionListener"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header 부분</title>
<link rel="stylesheet" type="text/css" href="style.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="style.css">


<script type="text/javascript">
	var imgArray = new Array();
	imgArray[0] = "image/home1.jpg";
	imgArray[1] = "image/home2.jpg";
	imgArray[2] = "image/home3.jpg";

	function showImage() {
		var imgNum = Math.round(Math.random() * 2);
		var objImg = document.getElementById("introing");
		objImg.src = imgArray[imgNum];
		setTimeout(showImage, 2000);
	}
</script>

<style>
*{font-family: 'Gowun Dodum', sans-serif;}
</style>
<%-- link rel : 현재문서와 외부리소스 사이의 연관관계--%>
</head>
<body>
	<header>
		<nav class="header-menu">
			<ul class="header-menu1">
			
			<%
				String id = (String)session.getAttribute("mem_id");
    
   				 if(id == null){
			%>
				<li><a href = "loginForm.jsp">[ Login ]</a></li>
				<li><a href="joinForm.jsp">[ 회원가입 ]</a></li>
			<%
    			}else{
    				if(id.equals("tss123")){
			%>
						<li>관리자님 환영합니다.</li>
						<li><a href = "managerHeader.jsp"> [ 관리자 창으로 ] </a></li>
						<li><a href = "main.jsp"> [ 유저 창으로 ] </a></li>
						<li><a href = "logout"> [ 로그아웃 ] </a></li>
			<%
    				}else{
			%>
				<li><%=id %>님 환영니다.</li>
				<li><a href = "logout"> [ 로그아웃 ] </a></li>
				<li><a href=""> [ 장바구니 ] </a></li>
			<%
						}
    				}
			%>
			
			</ul>
		</nav>

		<div class="header-logo">
			<a href="main.jsp"><img src="image/logo.jpg" height="100%"
				width="100%"></a>
		</div>

		<nav class="header-menu">
			<ul class="header-menu2">
				<li><a href="">Supplies</a></li>
				<li><a href="rev_boardList.do">Review</a></li>
				<li><a href="">Q&A</a></li>
				<li><a href="boardList.bo">Community</a></li>
			</ul>
		</nav>
		<div class="header-notice" style="padding: 20px;">
			<marquee> ※ 안녕하세요? Tennis Supplies Shop 입니다. 메뉴속 Community를
				통해 유익한 정보를 얻고 동내, 주변 사람들과 즐거운 테니스 경기 약속을 잡아보세요!!! </marquee>
		</div>
	</header>
</body>
</html>