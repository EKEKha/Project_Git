<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"
 isELIgnored="false"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@page import="vo.ProductBean"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

<script type="text/javascript" src="./resources/js/validation.js"></script>

<script type="text/javascript">
function CheckAddProduct(){
	
	
	if(p.prod_name.value==""){
		alert("상품명을 입력해주세요");
		return p.prod_name.focus();
	}
	if(!(p.prod_kind.value=="racket"||p.prod_kind.value=="acc")){
		alert("상품분류를 선택해주세요");
		
	}
	if(p.prod_price.value==""){
		alert("상품가격을 입력해주세요");
		return p.prod_price.focus();
	}
	if(p.prod_amount.value==""){
		alert("재고 수를 입력해주세요");
		return p.prod_amount.focus();
	}
	if(p.prod_content.value==""){
		alert("상품설명을 입력해주세요");
		return p.prod_content.focus();
	}
	 if(p.prod_image.value==""){
		alert("상품이미지를 첨부해주세요");
		return p.prod_image.focus();
	 }

	p.submit();

	
	
	
}


</script>
<title>상품 등록</title>

<style>


ul li{

display:inline-block;

}


.title{
margin:0 auto;
width:150px;
}


</style>
</head>
<body>

	<jsp:include page="../userHeader.jsp"/>
	<jsp:include page="../managerHeader.jsp" />
	
	<div class="colorlib-partner">
	<div class="container" >
	
	
			<div>
				<h2 class="title">상품등록</h2>
			
			</div>
				
	
	
	<!-- 해당요청 폼이 등록되면  -->
	
		<div style="width:60%; height:50%; margin:60px auto;">
		<div class="contact-wrap">
		<form name="p" action="prodInsertPro.po" class="contact-form" method="post" 
		enctype="multipart/form-data">
	
			
			
			<div class="form-group row">
				<label class="col-sm-2">상품 이름</label>
				<div class="com-sm-3">
					<input type="text" id="name" name="prod_name" class="form-control">
				</div>
			</div>
			
			
								<div class="form-group row">
				<label class="col-sm-2">상품 분류</label>
				<div class="com-sm-5">
					<input type="radio" name="prod_kind" value="racket"> 테니스라켓&nbsp;
					<input type="radio" name="prod_kind" value="acc"> Acc

				</div>
			</div>
			
			
			<div class="form-group row">
				<label class="col-sm-2">가격</label>
				<div class="com-sm-3">
					<input type="text" id="unitPrice" name="prod_price" class="form-control">
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">재고 수</label>
				<div class="com-sm-3">
					<input type="text" id="unitsInStock" name="prod_amount" class="form-control">
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">상품 설명</label>
				<div class="com-sm-5">
					<textarea name="prod_content" cols="50" rows="5" class="form-control"></textarea>
				</div>
			</div>
			
				<div class="form-group row">
				<label class="col-sm-2">판매 상태</label>
				<div class="com-sm-5">
					<input type="radio" name="prod_status" value="y"> 판매 &nbsp;
					<input type="radio" name="prod_status" value="n" checked> 대기

				</div>
			</div>
			
			
			<div class="form-group row">
				<label class="col-sm-2">상품 이미지</label>
				<div>
					<div class="com-sm-5">
					<input type="file" name="prod_image" class="form-control">
					</div>
				</div>
			</div>
				
			<div class="form-group row">
				<div class="col-md-12 text-center">
				<!-- 등록이 완료되면 메뉴리스트 보기 요청하기 -->
					<input type="submit" class="btn btn-primary" value="등록" onclick="CheckAddProduct(); return false;">
				</div>
			</div>
		
		</form>
		</div>
	</div>
	</div>
	</div>
</body>
</html>