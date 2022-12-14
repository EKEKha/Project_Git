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

<!-- <script type="text/javascript" src="./resources/js/validation.js"></script> -->


<title>매출관리</title>

<style>
.form-horizontal {
	margin: 0 atuo;
}

ul li {
	
 display: inline;
  justify-content: center;
  align-items: center;
}

.colortable {
	height: 100%;
	width: 80%;
	margin: 60px auto;
	text-align:center;
}

tr, th, td {
	padding: 5px;
	border: 1px solid;
	align: center;
}

.title{
margin:0 auto;
width:160px;
}

#page3{
 width: 100%;
   text-align: center;
}
</style>
<script type="text/javascript">
	function orderStatus2() {
		let o_status = document.getElementById("process").value;
		let order_id = document.getElementById("order_id").innerText;

		location.href = "updateOrderStatus.od?o_status=" + o_status
				+ "&order_id=" + order_id;

	}
</script>

 <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
google.charts.load('current', {packages: ['corechart', 'bar']});

google.charts.setOnLoadCallback(drawBasic);

 

function drawBasic() {

var data = new google.visualization.DataTable();

data.addColumn('string', '요일');

data.addColumn('number', '방문자수(명)');

 

data.addRows([

['1', 200000],

['2', 2],

['3', 3],

['4', 4],

['5', 5],

['6', 6],

['7', 7],
['8', 8],
['9', 9],
['10', 10],
['11', 11],
['12', 12],

]);

 

var options = {

title: '이번주 일별 방문자 현황',

hAxis: {

title: '년도',

viewWindow: {

min: [7, 30, 0],

max: [17, 30, 0]

}

},

vAxis: {

title: '월별매출조회'

}

};

 

var chart = new google.visualization.ColumnChart(

document.getElementById('chart_div'));

 

chart.draw(data, options);

}

</script>

 


</head>
<body>

	<jsp:include page="../userHeader.jsp" />
	<jsp:include page="../managerHeader.jsp" />




<div class="colorlib-partner">
		<div class="container">

			<div>
					<h2 class="title">주문관리</h2>
			
			</div>
				  
  <div id="chart_div"></div>
      

			<c:if test="${manageOrderList !=null && pageInfo.listCount >0 }">
				<div>
					<table class="colortable">
						<tr style="height:80px;">
						<th colspan="7">
						 당일 매출(주문대기기준) 
						 <fmt:formatNumber pattern="###,###,###원" value="${dayTotal}" />
						</th>
						
						</tr>
						<tr>
							<th>주문번호</th>
							<!-- 주문번호를 누르면 해당 주문번호 상세주문 페이지로 넘어가게함 -->
							<th>회원아이디</th>
							<!-- 세션에서 얻을 것 -->


							<th>총가격</th>
							<th>포인트사용</th>
							<th>실구매가</th>
							<th>주문날짜</th>
							<th>주문상태</th>
							


						</tr>

						<c:forEach var="list" items="${manageOrderList}"
							varStatus="status">
							<tr>
								<th id="order_id"><a
									href="userOrderDetail.od?order_id=${list.order_id}">
										${list.order_id} </a></th>
								<td>${list.mem_id}</td>

								<td><fmt:formatNumber pattern="###,###,###원"
										value="${list.totalPrice}" /></td>
								<td id="usePoint">${list.usePoint}</td>
								
								<td><fmt:formatNumber pattern="###,###,###원"
										value="${list.totalPrice-list.usePoint}" /></td>
							
								<td>${list.o_date}</td>
								<c:if test="${list.o_status eq '취소요청'}">
									<td>${list.o_status}
									<input type="button" value="취소" 
									onclick="location.href='orderDelete.od?order_id=${list.order_id}&totalPrice=${list.totalPrice}&mem_id=${list.mem_id }'"/>
									</td>
								</c:if>
								<c:if test="${list.o_status !=  '취소요청'}">
								<td>${list.o_status}</td>
								</c:if>
								
							</tr>
						</c:forEach>

					</table>

					<ul id="page3">
						<!-- 페이지 이전 버튼 -->
						<c:choose>
							<c:when test="${pageInfo.page<=1}">
								<li></li>
								<!-- 1보다 작으면 a태그걸지않는다. -->
							</c:when>
							<c:otherwise>
								<li><a href="manageOrderList.od?page=${pageInfo.page-1 }"><i>이전</i></a></li>
							</c:otherwise>
						</c:choose>

						<!-- 페이지번호 처리 -->
						<c:forEach var="i" begin="${pageInfo.startPage }"
							end="${pageInfo.endPage }" step="1">


							<c:choose>
								<c:when test="${pageInfo.page==i}">
									<li><span>${i}</span></li>
									<!-- a 태그 걸지 않고 active 상태  -->
								</c:when>
								<c:otherwise>
									<li><a href="manageOrderList.od?page=${i}">${i}</a></li>
								</c:otherwise>
							</c:choose>

						</c:forEach>

						<!-- 페이지 다음 버튼 -->


						<c:choose>
							<c:when test="${pageInfo.page==pageInfo.maxPage}">
								<li></li>
								<!-- 현재페이지가 마지막페이지면 a태그걸지않는다. -->
							</c:when>
							<c:otherwise>
								<li><a href="manageOrderList.od?page=${pageInfo.page+1 }"><i>다음</i></a></li>
							</c:otherwise>
						</c:choose>

					</ul>

				</div>
				
			</c:if>
			</div>
		</div>
<br><br>


	<c:if test="${pageInfo.listCount==0 }">

		<font size="6">주문이 없습니다.</font>
	</c:if>

</body>
</html>