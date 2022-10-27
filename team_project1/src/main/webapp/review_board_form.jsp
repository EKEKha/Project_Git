<%@page import="vo.PageInfo"%>
<%@page import="vo.ReviewBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"
 isELIgnored="false"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>




<!DOCTYPE HTML>
<html>
	<head>
	<title>Tennis shop</title>
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
#myform fieldset{
    display: inline-block;
    direction: rtl;
    border:3px;
    width:75%;
    height:75%;
    margin:3%;
    
}
#myform input[type=radio]{
    display: none;
}
#myform label{
    font-size: 3em;
    color: transparent;
     text-shadow: 0 0 0 #553f3f;
}
#myform label:hover{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
#myform label:hover ~ label{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
#myform input[type=radio]:checked ~ label{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
.button {
    display: flex;
    justify-content: center;
}
label {
    cursor: pointer;
    font-size: 1em;
}

/* 못생긴 기존 input 숨기기 */
#chooseFile {
    visibility: hidden;
}
.image-upload {
    flex: 1;
    display: flex;
    flex-direction: column;
    justify-content: center;
}

.button {
    display: flex;
    justify-content: center;
}

label {
    cursor: pointer;
    font-size: 1em;
}

#chooseFile {
    visibility: hidden;
}

.fileContainer {
    display: flex;
    justify-content: center;
    align-items: center;
}

.fileInput {
    display: flex;
    align-items: center;
    border-bottom: solid 2px black;
    width: 60%;
    height: 30px;
}

#fileName {
    margin-left: 5px;
}

.buttonContainer {
    width: 15%;
    display: flex;
    justify-content: center;
    align-items: center;
    margin-left: 10px;
    background-color: black;
    color: white;
    border-radius: 30px;
    padding: 10px;
    font-size: 0.8em;

    cursor: pointer;
}

.image-show {
    z-index: -1;
    display: flex;
    justify-content: center;
    align-items: center;
    position: absolute;
    width: 100%;
    height: 100%;
}

.img {
    position: absolute;
}
</style>

<script type="text/javascript">
var submit = document.getElementById('submitButton');
submit.onclick = showImage;     //Submit 버튼 클릭시 이미지 보여주기

function showImage() {
    var newImage = document.getElementById('image-show').lastElementChild;
    newImage.style.visibility = "visible";
    
    document.getElementById('image-upload').style.visibility = 'hidden';

    document.getElementById('fileName').textContent = null;     //기존 파일 이름 지우기
}


function loadFile(input) {
    var file = input.files[0];

    var name = document.getElementById('fileName');
    name.textContent = file.name;

    var newImage = document.createElement("img");
    newImage.setAttribute("class", 'img');

    newImage.src = URL.createObjectURL(file);   

    newImage.style.width = "70%";
    newImage.style.height = "70%";
    newImage.style.visibility = "hidden";   //버튼을 누르기 전까지는 이미지 숨기기
    newImage.style.objectFit = "contain";

    var container = document.getElementById('image-show');
    container.appendChild(newImage);
};

</script>



</head>



	<body>
	<jsp:include page="userHeader.jsp"  />
	
	
	<form class="mb-3" name="myform" id="myform" method="post" action="revInsertPro.do"  enctype="multipart/form-data">	
			
			<div class="colorlib-loader"></div>
			<div id="page">
				
				<div class="colorlib-product">
					<div class="container">
						<div class="row">
						
						
							<div class="col-sm-8 offset-sm-2 text-center colorlib-heading">
								<h2>Review</h2><!-- css h2 fontfamily 7340 -->
								
							<input type="submit" value="등록" onclick="revForm_check(); return false;">
							<input type="reset" value="취소">
						
							</div>
							
						</div>
						
								
							
						
			
			<div class="button">
		        <label for="chooseFile">
		            👉 CLICK HERE! 👈
		        </label>
		    </div>
		 
			 <input type="hidden" name=mem_id value="${sessionScope.mem_id}"><!-- 값을 넘겨주지않아도 되지않나..세션이니까? -->	
		     <input type="file" id="chooseFile" name="reviewImage" accept="image/*" multiple onchange="loadFile(this)">
		 	
            <div class="fileContainer">
                <div class="fileInput">	
                    <p>FILE NAME: </p>
                    <p id="fileName"></p>
                </div>
                <!-- <div class="buttonContainer">
                    <div class="submitButton" id="submitButton">SUBMIT</div>
                </div> -->
            </div>
       
        
       	
  		 
			
			
			
			<div>
			<font size="4" strong>후기사진을 함께올려주세요	</font>
			</div>
			
			<fieldset>
			<div>
				<textarea class="col-auto form-control" name="rev_content" type="text" id="reviewContents" placeholder="상품평을 입력 해 주세요"
				cols="40" rows="15" required ></textarea>
			</div>
				<span class="text-bold">별점을 선택해주세요</span>
				<input type="radio" name="rev_score" value="1" id="rate1"><label
					for="rate1">★</label>
				<input type="radio" name="rev_score" value="2" id="rate2"><label
					for="rate2">★</label>
				<input type="radio" name="rev_score" value="3" id="rate3"><label
					for="rate3">★</label>
				<input type="radio" name="rev_score" value="4" id="rate4"><label
					for="rate4">★</label>
				<input type="radio" name="rev_score" value="5" id="rate5"><label
					for="rate5">★</label>
			</fieldset>
				</div>
			</div>
				
								
												
		</div>
							
					
					
			
			
</form>
	

	<div class="gototop js-top">
		<a href="#" class="js-gotop"><i class="ion-ios-arrow-up"></i></a>
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

