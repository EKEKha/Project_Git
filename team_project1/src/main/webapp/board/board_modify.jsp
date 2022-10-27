<%@page import="vo.BoardBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	BoardBean article = (BoardBean)request.getAttribute("article");
    String loginID = (String)session.getAttribute("mem_id"); //세션에 있는 ID불러오기
%>

<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.js"></script> 
<meta charset="UTF-8"> 
	<title>MVC 게시판</title>
	<script type="text/javascript">
	function modifyboard(){
		modifyform.submit();
	}
	</script>
	<style type="text/css">
   #registForm{
      width: 500px;
      height: 600px;
      border : 1px solid red; 
      margin:auto; 
   }   
   h2{
      text-align: center;
   }
   table{
      margin:auto;
      width: 450px;
      }
   .td_left{
      width: 150px;
      background:skyblue;
      text-align: center;
   }
   .td_right{
      width: 300px;

   }
   #commandCell{
      text-align: center;
      
   }
</style>
</head>
<body>
<!-- 게시판 등록 -->

<section id = "writeForm">
<h2>게시판글수정</h2>
<form action="boardModifyPro.bo" method="post" name = "modifyform"
>
<input type = "hidden" name = "BOARD_NUM" value = "<%=article.getBOARD_NUM()%>"/>
<table border="1">

   
	<tr>
		<td class="td_left">
			<label for = "BOARD_NAME">작성자 ID</label>
		</td>
		<td class="td_right">
			<input type = "text" name="BOARD_NAME" id = "BOARD_NAME" value = "<%=article.getMEM_ID()%>"/>
		</td>
	</tr>

	<tr>
		<td class="td_left">
			<label for = "BOARD_SUBJECT">제 목</label>
		</td>
		<td class="td_right">
			<input name="BOARD_SUBJECT" type="text" id = "BOARD_SUBJECT" value = "<%=article.getBOARD_SUBJECT()%>"/>
		</td>
	</tr>
	

	
	<tr>
		<td class="td_left">
			<label for = "BOARD_CONTENT">내 용</label>
		</td>
		<td>
			<textarea id = "BOARD_CONTENT" name="BOARD_CONTENT" cols="40" rows="15"><%=article.getBOARD_CONTENT()%></textarea>
		</td>
	</tr>
	
	        <%if(!(article.getBOARD_PLACELA().equalsIgnoreCase("NULL"))){ %>
	       <tr>
				<td class="td_left">모임 장소</td>
				<td>
					<input type="text" name="detailAddress" id="address"size="30" >
					<button type="button" id="searchBtn" >주소입력</button>
				</td>
					
				</tr>
				
				<tr>
				 <td colspan="2">
						<div id="map" style="width:100%;height:300px;"></div>
				 </td>
		 </tr>
		 
		  <%}else if(article.getBOARD_PLACELA().equalsIgnoreCase("NULL")){ %>
		  
		  <%} %>
	 
	 

</table>
	<section id = "commandCell">
	         <%if(loginID.equalsIgnoreCase(article.getMEM_ID()) ){ %>
			<a href="javascript:modifyboard()">[수정]</a>&nbsp;&nbsp;
			<%}else if(!(loginID.equalsIgnoreCase(article.getMEM_ID())) ){ %>
			
			<%} %>
			
			<a href="javascript:history.go(-1)">[뒤로]</a>
	</section>
	
	<input type="hidden" id="BOARD_PLACELA" name="BOARD_PLACELA" value="">
    <input type="hidden" id="BOARD_PLACEMA" name="BOARD_PLACEMA" value="">
    
 
</form>
     





	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4b4a735c0046067425af367f34003e43&libraries=services"></script>
	<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(35.931692346116584,128.54664831044244 ), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };  
	
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	$('#searchBtn').click(function(){
		// 버튼을 click했을때
		
		// 지도를 생성합니다    

		
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();
		
		// 주소로 좌표를 검색합니다
		geocoder.addressSearch($('#address').val(), function(result, status) {
	
		    // 정상적으로 검색이 완료됐으면 
		     if (status === kakao.maps.services.Status.OK) {
		        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
		
		        // 추출한 좌표를 통해 도로명 주소 추출
		        let lat = result[0].y;
		        let lng = result[0].x;
		        getAddr(lat,lng);
		        function getAddr(lat,lng){
		            let geocoder = new kakao.maps.services.Geocoder();
	
		            let coord = new kakao.maps.LatLng(lat, lng);
		            let callback = function(result, status) {
		                if (status === kakao.maps.services.Status.OK) {
		                	// 추출한 도로명 주소를 해당 input의 value값으로 적용
		                    $('#address').val(result[0].road_address.address_name);
		                }
		            }
		            geocoder.coord2Address(coord.getLng(), coord.getLat(), callback);
		        }
		        
		        // 결과값으로 받은 위치를 마커로 표시합니다
		        var marker = new kakao.maps.Marker({
		            map: map,
		            position: coords
		        });
	
		        // 인포윈도우로 장소에 대한 설명을 표시합니다
		        var infowindow = new kakao.maps.InfoWindow({
		            content: '<div style="width:150px;text-align:center;padding:6px 0;">테니스 모임 장소</div>'
		        });
		        infowindow.open(map, marker);
	
		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
		        
		        BOARD_PLACELA.value=result[0].y;
	            BOARD_PLACEMA.value=result[0].x;
		 
		    } 
		});  
	});
	  
	</script>


</section>
</body>
</html>
