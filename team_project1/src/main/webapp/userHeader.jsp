<%@page
	import="org.eclipse.jdt.internal.compiler.lookup.IQualifiedTypeResolutionListener"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="vo.Cart"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   <%
         
            ArrayList<Cart> cartList = (ArrayList<Cart>) session.getAttribute("cartList");


            %>


<!DOCTYPE html>
</html>
<head>
<meta charset="UTF-8">
<title>header 부분</title>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap"
	rel="stylesheet">

<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,600,700"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Rokkitt:100,300,400,700"
	rel="stylesheet">

<!-- Animate.css -->
<link rel="stylesheet" href="css/animate.css">
<!-- Icomoon Icon Fonts-->
<link rel="stylesheet" href="css/icomoon.css">
<!-- Ion Icon Fonts-->
<link rel="stylesheet" href="css/ionicons.min.css">
<!-- Bootstrap  -->
<link rel="stylesheet" href="css/bootstrap.min.css">

<!-- Magnific Popup -->
<link rel="stylesheet" href="css/magnific-popup.css">

<!-- Flexslider  -->
<link rel="stylesheet" href="css/flexslider.css">

<!-- Owl Carousel -->
<link rel="stylesheet" href="css/owl.carousel.min.css">
<link rel="stylesheet" href="css/owl.theme.default.min.css">

<!-- Date Picker -->
<link rel="stylesheet" href="css/bootstrap-datepicker.css">
<!-- Flaticons  -->
<link rel="stylesheet" href="fonts/flaticon/font/flaticon.css">

<!-- Theme style  -->
<link rel="stylesheet" href="css/style.css">





<style>
* {
	font-family: 'Gowun Dodum', sans-serif;
}
</style>
<%-- link rel : 현재문서와 외부리소스 사이의 연관관계--%>


</head>
<body>
			
	
    <!-- Carousel Start -->
    
		
	<div class="colorlib-loader"></div>

	<div id="page">
		<nav class="colorlib-nav" role="navigation">
			<div class="top-menu">
				<div class="container">
					<div class="row">
						<div class="col-sm-7 col-md-9">
							<div id="colorlib-logo"><a href="index.jsp">TENNIS SHOP</a></div>
						</div>
						
						<div class="col-sm-5 col-md-3">
						
						
			            <!-- <form action="#" class="search-wrap	">
			               <div class="form-group">
			                  <input type="search" class="form-control search" placeholder="Search">
			                  <button class="btn btn-primary submit-search text-center" type="submit"><i class="icon-search"></i></button>
			               </div>
			            </form> -->
			         </div>
		         </div>
					<div class="row">
						<div class="col-sm-12 text-left menu-1">
							<ul>
								<li><a href="index.jsp">Home</a></li>
								<li class="has-dropdown">
									<a href="#">Items</a>
									<ul class="dropdown">
										<li><a href="productListView.po?prod_kind=racket">Racket</a></li>
										<li><a href="productListView.po?prod_kind=acc">ACC</a></li>
								
									</ul>
								</li>
								<li ><a href="rev_boardList.do">Review</a></li>
								<li><a href="qboardList.qna">QNA</a></li>
								<li><a href="tboardList.bo">Community</a></li>
								
								<c:if test="${mem_id==null }">
								<li class="cart"><a href="cart.jsp"><i class="icon-shopping-cart"></i> Cart [0]</a></li>
								<li class="cart"><a href="joinForm.jsp">회원가입</a></li>
								<li class="cart"><a href="loginForm.jsp"> 로그인</a></li>
								</c:if>
								
								
								<c:if test="${mem_id!=null&&mem_grade eq '2' }">
								<%
								 if (cartList == null) {
									 %>
         					   <li class="cart"><a href="cart.jsp"><i class="icon-shopping-cart"></i> Cart[0]</a></li>
					            <%
					            } else {
					            %>
					            <li class="cart"><a href="cartList.od"><i
					                  class="icon-shopping-cart"></i> Cart[<%=cartList.size()%>]</a></li>
								<%} %>
						
								<li class="cart"><a href="logout"> 로그아웃</a></li>
					
							
									<li><a href="userView.me">[관리자님 환영합니다.]</a>
								<li><a href="manageOrderList.od">[관리자창]</a></li>
								
									
								</li>
								</c:if>
							
								
								
								<c:if test="${mem_id!=null && mem_grade !='2' }">
								<%
								 if (cartList == null) {
									 %>
         					   <li class="cart"><a href="cart.jsp"><i class="icon-shopping-cart"></i> Cart[0]</a></li>
					            <%
					            } else {
					            %>
					            <li class="cart"><a href="cartList.od"><i
					                  class="icon-shopping-cart"></i> Cart[<%=cartList.size()%>]</a></li>
								<%} %>
						
								<li class="cart"><a href="logout"> 로그아웃</a></li>
								
							
								<li class="has-dropdown">
									<a href="#">[${mem_id }님 환영합니다.]</a>
									<ul class="dropdown">
										<li><a href="userView.me">마이페이지</a></li>
										<li><a href="userOrderView.od">주문내역</a></li>
								
									</ul>
								</li>
								
								
								
								
								
								
								</c:if>
							
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="sale">
				<div class="container">
					<div class="row">
						<div class="col-sm-8 offset-sm-2 text-center">
							<div class="row">
								<div class="owl-carousel2">
									<div class="item">
										<div class="col">
											<h3><a href="index.jsp">Welcome!</a></h3>
										</div>
									</div>
									<div class="item">
										<div class="col">
											<h3><a href="index.jsp">Community를 통해 테니스약속을 잡아보세요.</a></h3>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</nav>

		



     



	<!-- jQuery -->
	<script src="js/jquery.min.js"></script>
	<!-- popper -->
	<script src="js/popper.min.js"></script>
	<!-- bootstrap 4.1 -->
	<script src="js/bootstrap.min.js"></script>
	<!-- jQuery easing -->
	<script src="js/jquery.easing.1.3.js"></script>
	<!-- Waypoints -->
	<script src="js/jquery.waypoints.min.js"></script>
	<!-- Flexslider -->
	<script src="js/jquery.flexslider-min.js"></script>
	<!-- Owl carousel -->
	<script src="js/owl.carousel.min.js"></script>
	<!-- Magnific Popup -->
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/magnific-popup-options.js"></script>
	<!-- Date Picker -->
	<script src="js/bootstrap-datepicker.js"></script>
	<!-- Stellar Parallax -->
	<script src="js/jquery.stellar.min.js"></script>
	<!-- Main -->
	<script src="js/main.js"></script>
</body>
</html>