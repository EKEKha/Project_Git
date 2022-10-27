<%@page import="dao.ReviewDAO" %>
<%@page import="vo.ReviewBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"
 isELIgnored="false"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<!DOCTYPE HTML>
<html>
	<head>
	<title>후기상세</title>
   <meta charset="utf-8">
   <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,600,700" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Rokkitt:100,300,400,700" rel="stylesheet">
	
	<!-- Animate.css -->
	<link rel="stylesheet" href="css/animate.css">
	<!-- Icomoon Icon Fonts-->
	<link rel="stylesheet" href="css/icomoon.css">
	<!-- Ion Icon Fonts-->
	<link rel="stylesheet" href="css/ionicons.min.css">
	<!-- Bootstrap  -->
	<link rel="stylesheet" href="/css/bootstrap.min.css">

	<!-- Magnific Popup -->
	<link rel="stylesheet" href="/css/magnific-popup.css">

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
.review_img  {
 width:100%;
 height:100%;
 object-fit:cover;}
 
 .img-fluid{
  width:100%;
 height:100%;
 object-fit:cover;
 
 }

</style>
<script type="text/javascript">
function delet(){
	confirm("삭제하시겠습니까?");
}
</script>

	</head>
	<body>
		<jsp:include page="/userHeader.jsp"></jsp:include>


	
		<div class="colorlib-about">
			<div class="container">
				<div class="row row-pb-lg"> <!-- --- -->
					<div class="col-sm-6 mb-3">
					
						<div class="video colorlib-video" >
							
							<c:choose>
									<c:when test="${article.rev_fileName!=null}">
										<img src="reviewUpload/${article.rev_fileName}" class="img-fluid"/>
										</c:when>
									<c:otherwise>
										<img src="image/noimg_fac.gif" class="img-fluid" />
									</c:otherwise>
								
								</c:choose>
						
						</div>
					
					</div>
					<div class="col-sm-6">
						<div class="about-wrap">
							
							
								 <h2>${article.rev_score}</h2>
							
							
							 <p></p>
							<p>${requestScope.article.rev_content}</p>
						</div>
						
					</div>
				</div>
					<!--후기상세페이지는 목록을 타고 들어와야하므로... -->
					<input type="button" value="후기목록" onclick="location.href='rev_boardList.do'">
					
					<!-- 로그인한 사람과 글작성자가 같을시 나오는 버튼  -->
					<c:if test="${article.mem_id==sessionScope.mem_id }"><!-- update같은경우 글작성view를 가져오고 한번더 처리, 삭제는 바로처리 -->
						<input type="button" value="수정" onclick="delet(); location.href='revUpdateForm.do?board_no=${article.board_no}'" >
						<input type="button" value="삭제" onclick="location.href='revDeletePro.do?board_no=${article.board_no}'">
					</c:if>
					
			</div>
		
		</div>

	
	
	
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

