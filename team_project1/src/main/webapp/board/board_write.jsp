<%@ page language="java" contentType="text/html; charset=UTF-8"%>



<%String loginID = (String)session.getAttribute("mem_id"); //세션에 있는 ID불러오기 %>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.js"></script> 
<meta charset="UTF-8">
<title>MVC 게시판</title>
<style type="text/css">

h2 {
	text-align: center;
}

h4 {
	text-align: center;
}


table {
	margin: auto;
	width: 50%;
	hieght: 70%;
}

.td_left {
    text-align:center;
	background: skyblue;

}


.td_right {

	background: white;
}

#commandCell {
	text-align: center; 
}
#map{
 margin:0 auto;
}
p{text-align: center;}

#b1{background-color: skyblue;}




</style>
</head>
<body>

	<!-- 게시판 등록 -->

	<section id="writeForm">
		<h2>테니스 모임 게시판 글쓰기</h2>
		  <h4><a href="main.jsp">홈으로</a></h4>
		   	  
		<form action="boardWritePro.bo" method="post"
			enctype="multipart/form-data" name="boardform">
			<table border="1">
	   	        <tr>
	   	          <td class="td_left">작성자 ID</td>
	   	          <td class="td_right"><%=loginID %></td>	   	          
	   	        </tr>
	   	         <input type="hidden" id="loginID" name="loginID" value="<%=loginID%>">
				<tr>
					<td class="td_left"><label for="BOARD_SUBJECT">제목</label></td>
					<td class="td_right"><input name="BOARD_SUBJECT" type="text"
						id="BOARD_SUBJECT" required="required" size="67"/></td>
				</tr>
				<tr>
					<td class="td_left"><label for="BOARD_CONTENT">내용</label></td>
					<td><textarea id="BOARD_CONTENT" name="BOARD_CONTENT"
				cols="90" rows="15" required="required" >**********************************************
필수 작성란	 
모임날짜와 시간: 
상세장소 : 
모임최대인원 : 명
테니스 최소 구력 : 년이상 , 또는 월이상
전화번호 : 010-xxxx-xxxx 
**********************************************										 
							 </textarea></td>
				</tr>
				<tr>
					<td class="td_left"><label for="BOARD_FILE"> 파일 첨부 </label></td>
					<td class="td_right"><input name="BOARD_FILE" type="file"
						id="BOARD_FILE" /></td>
				</tr>
				 
		   <tr>
				<td class="td_left">모임 장소</td>
				<td>
					<input type="text" name="detailAddress" id="address"size="30" required="required">
					<button type="button" id="searchBtn" >주소입력</button>
				</td>
					
				</tr>
				
				<tr>
				 <td colspan="2">
						<div id="map" style="width:100%;height:300px;"></div>
				 </td>
		   </tr>
				 
			</table>
			<section id="commandCell">
		      	<input hidden="hidden" /> <!-- 엔터방지 -->
				<input type="submit" value="등록" id="b1">&nbsp;&nbsp; 
				<input type="reset" value="다시쓰기" id="b1"/>
			</section>
			
    <input type="hidden" id="BOARD_PLACELA" name="BOARD_PLACELA" value="">
    <input type="hidden" id="BOARD_PLACEMA" name="BOARD_PLACEMA" value="">   	
</form>


	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4b4a735c0046067425af367f34003e43&libraries=services"></script>
	<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(35.931692346116584, 128.54664831044244), // 지도의 중심좌표
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
	<!-- 게시판 등록 -->

</body>
</html>


