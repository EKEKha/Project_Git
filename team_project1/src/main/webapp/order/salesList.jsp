<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@page import="vo.ProductBean"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>




<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

<script type="text/javascript" src="./resources/js/validation.js"></script>


<title>매출관리</title>

<style>
.form-horizontal {
	margin: 0 atuo;
}

ul li {
	display: inline-block;
}

.colortable {
	height: 100%;
	width: 80%;
	margin: 60px auto;
}

tr, th, td {
	padding: 5px;
	border: 1px solid;
	align: center;
}

.selectB{
position:relative;

}

.selectC{
position:absolute;

}

.title{
margin:0 auto;
width:160px;
}
</style>
<script type="text/javascript">
	function getMonth() {
		let month = document.getElementById("month").value;
		let year = document.getElementById("year").value;
		location.href = "salesList.od?month=" + month
				+ "&year=" + year;

	}  
</script>



</head>
<body>

	<jsp:include page="../userHeader.jsp" />
	<jsp:include page="../managerHeader.jsp" />







<div class="colorlib-partner">
		<div class="container">
			
			
			
			<h2 class="title">매출조회</h2>
			<p class="title">(처리완료 기준)</p>
			
		
<%-- 
			<c:if test="${manageOrderList !=null && pageInfo.listCount >0 }"> --%>
				<div class="title">
				
			
				<div class="selectB">
				<select name="year" id="year">
				
					<option value="2022">2022</option>
					<option value="2021">2021</option>
			
				</select>
				<select name="month" id="month" onchange="getMonth()" >
					<option value="01">1</option>
					<option value="02">2</option>
					<option value="03">3</option>
					<option value="04">4</option>
					<option value="05">5</option>
					<option value="06">6</option>
					<option value="07">7</option>
					<option value="08">8</option>
					<option value="09"> 9</option>
					<option value="10">10</option>
					<option value="11">11</option>
					<option value="12">12</option>
				</select>
				</div>
				</div>
				<div class="selectB">
				<%-- <c:if test="${day_List!=null &&day_List.size()<0 }"> --%>
				
					<table class="colortable">
						<tr>
							<th>날짜</th>
							<th>월합계</th>
						</tr>
		<c:forEach var="List" items="${daySlaesList}">
					<tr>
						
						
						<td>${List.key}</td>
				

						<td><fmt:formatNumber pattern="###,###,###원"
								value="${List.value}" /></td>

					</tr>
			</c:forEach>
					<tr>	
					<th>
						월매출총액
					</th>
						<td>
						<fmt:formatNumber pattern="###,###,###원"
								value="${monthSales}" />
						</td>
					</tr>
					</table>
<%-- </c:if> --%>
				</div>
				</div>
				</div>
	</div>



</body>
</html>