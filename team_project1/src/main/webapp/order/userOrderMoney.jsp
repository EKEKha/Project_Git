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


<title>회원별 구매금액</title>

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
	text-align:center;
	margin: 60px auto;
}

tr, th, td {
	padding: 5px;
	border: 1px solid;
	align: center;
}

.title{
margin:0 auto;
width:150px;
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



</head>
<body>

	<jsp:include page="../userHeader.jsp" />
<jsp:include page="../managerHeader.jsp" />


<div class="colorlib-partner">
	<div class="container">



			<div>
				<h2 class="title">회원조회</h2>
			
			</div>
				
			

			<c:if test="${userMoneyList !=null && pageInfo.listCount >0 }">
				
					<table class="colortable">
						
						<tr>
							<th>회원아이디</th>
			
							<th>총누적금액</th>
							
							<th>포인트</th>
			
							<th>회원등급</th>
							


						</tr>

					
						<c:forEach var="List" items="${userMoneyList}">
							<tr>
								
								<th>
								<a href="memberViewAction.me?mem_id=${List.mem_id }">${List.mem_id}</a>
								</th>
								<td>
								<fmt:formatNumber pattern="###,###,###원"
										value="${List.totalPrice}" />
										</td>
										
								<td>${List.mem_point }점</td>		
								<c:if test="${List.mem_grade eq '0'}">		
								<td>VIP</td>
								</c:if>
								<c:if test="${List.mem_grade eq '1'}">		
								<td>일반회원</td>
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

				
				
			</c:if>
		
		</div>
	</div>




<br><br>


	<c:if test="${pageInfo.listCount==0 }">

		<font size="6">주문이 없습니다.</font>
	</c:if>

</body>
</html>