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
<style>
*{font-family: 'Gowun Dodum', sans-serif;}
</style>
</head>
<body>
	<header>
		<nav class="header-menu">
			<ul class="header-menu1">
						<li>관리자님 환영합니다.</li>
						<li><a href=""> [ 관리자 창으로 ] </a></li>
						<li><a href= "main.jsp"> [ 유저 창으로 ] </a></li>
			</ul>
		</nav>

		<div class="header-logo">
			<img src="image/logo.jpg" height="100%" width="100%">
		</div>

		<nav class="header-menu">
			<ul class="header-menu2">
				<li><a href="">메뉴1</a></li>
				<li><a href="">메뉴2</a></li>
				<li><a href="">메뉴3</a></li>
				<li><a href="">메뉴4</a></li>
			</ul>
		</nav>
		<div class="header-notice" style="padding: 20px;">
			<marquee> ※관리자님!!! 오늘 하루도 화이팅 입니다!!! </marquee>
		</div>
	</header>
</body>
</html>