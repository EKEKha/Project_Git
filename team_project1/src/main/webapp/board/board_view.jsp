<%@page import="vo.BoardBean"%>
<%@page language="java" contentType="text/html; charset=UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	BoardBean article = (BoardBean)request.getAttribute("article");
    String nowPage = (String)request.getAttribute("page");
    String loginID = (String)session.getAttribute("mem_id"); //세션에 있는 ID불러오기 
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">
<title>MVC 게시판</title>
<style type="text/css">


h2 {
	text-align: center;
}

#basicInfoArea {
	height: 40px;
	text-align: center;
}

#articleContentArea {
	background: orange;
	margin-top: 20px;
	height: 350px;
	text-align: center;
	overflow: auto;
}

#commandList {
	margin: auto;
	width: 500px;
	text-align: center;
}

#staticMap{
 margin:0 auto;
}

table{margin:0 auto;}

#tdleft{
   background-color: skyblue;
   text-align: center;
}
</style>
</head>

<body>
	<!-- 게시판 수정 -->
	<section >
		<h2>테니스 모임 게시판 글목록</h2>
		  <table border="1">
	
	
		  <tr>
		   <td id="tdleft">글쓴이 ID</td>
		   <td><%=article.getMEM_ID() %></td>
		  </tr>
		  
		  <tr>
		  <td id="tdleft">제 목 </td>
		   <td>	<%=article.getBOARD_SUBJECT()%></td>
		  </tr>	
		  
		  
	       <%if(article.getBOARD_FILE()!=null){ %>
		  <tr>
		    <td id="tdleft">첨부파일 다운로드</td>
		    <td>
			<a href="board/board_file_down.jsp?downFile=<%=article.getBOARD_FILE()%>"> <%=article.getBOARD_FILE() %>
			</a>
			</td>
		  </tr>
		  <%}else if(article.getBOARD_FILE()==null){ %>
		  
		  <%} %>
		  
		  
             
             
		  <tr>
		   <td id="tdleft">내용</td>
		   <td>	   
<textarea cols="70" rows="12" readonly><c:out value="<%=article.getBOARD_CONTENT() %>" /> </textarea>
		   </td>
		  </tr>


          <%if(!(article.getBOARD_PLACELA().equalsIgnoreCase("NULL"))){ %>
		  <tr>
		    <td id="tdleft">모임장소 주소</td>
		    <td><input type="text" id="address" value="" size="50"  readonly/></td>
		  </tr>	
		  <tr>
		   <td id="tdleft">모임장소 지도</td>
		   <td>
		   <div id="staticMap" style="width:100%;height:200px;">
		   </div>    
		   </td>
		  </tr>
		  <%}else if(article.getBOARD_PLACELA().equalsIgnoreCase("NULL")){ %>
		  
		  <%} %>

		  
			
			</table>
	</section>
	
	
	
	
	
	
	<section id="commandList">
	        <%if(loginID!=null){ %>
		    <a href="boardReplyForm.bo?board_num=<%=article.getBOARD_NUM() %>&page=<%=nowPage%>">
			[답변] 
			</a> 
			<%}else if(loginID==null) {%>
			 
			<%} %>
			
			
			
			<%if(article.getMEM_ID().equalsIgnoreCase(loginID)){ %>
			<a href="boardModifyForm.bo?board_num=<%=article.getBOARD_NUM() %>">			
			[수정]</a> 
			
			<%}else if(article.getMEM_ID()!=loginID){ %>
			 
			<%} %> 
			
			<%if(article.getMEM_ID().equalsIgnoreCase(loginID)){ %>
			<a href="boardDeleteForm.bo?board_num=<%=article.getBOARD_NUM() %>&page=<%=nowPage%>">
			[삭제] 
			</a> 
			<%}else if(article.getMEM_ID()!=loginID){ %>
			 
			<%} %> 
			
			
			<%-- <a href="boardList.bo?page=<%=nowPage%>">[목록]</a>&nbsp;&nbsp; --%>
			<a href="boardList.bo">[뒤로가기]</a>
						
	</section>
	
	
	
    <input type="hidden" id="BOARD_PLACELA" name="BOARD_PLACELA" value="<%=article.getBOARD_PLACELA()%>">
    <input type="hidden" id="BOARD_PLACEMA" name="BOARD_PLACEMA" value="<%=article.getBOARD_PLACEMA()%>">
	
	
	



<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4b4a735c0046067425af367f34003e43&libraries=services"></script>
<script>
// 이미지 지도에서 마커가 표시될 위치입니다 
var markerPosition  = new kakao.maps.LatLng(BOARD_PLACELA.value, BOARD_PLACEMA.value); 

let lat = BOARD_PLACELA.value;
let lng = BOARD_PLACEMA.value;

getAddr(lat,lng);
function getAddr(lat,lng){
    let geocoder = new kakao.maps.services.Geocoder();

    let coord = new kakao.maps.LatLng(lat, lng);
    let callback = function(result, status) {
        if (status === kakao.maps.services.Status.OK) {
            console.log(result[0].address.address_name); //좌표에 대한 콘솔에 찍힌 주소를 jsp로 넘겨줘야함
               address.value=result[0].address.address_name;     
        }
    }
    geocoder.coord2Address(coord.getLng(), coord.getLat(), callback);
}

// 이미지 지도에 표시할 마커입니다
// 이미지 지도에 표시할 마커는 Object 형태입니다
var marker = {
    position: markerPosition
};

var staticMapContainer  = document.getElementById('staticMap'), // 이미지 지도를 표시할 div  
    staticMapOption = { 
        center: new kakao.maps.LatLng(lat, lng), // 이미지 지도의 중심좌표
        level: 3, // 이미지 지도의 확대 레벨
        marker: marker // 이미지 지도에 표시할 마커 
        
        
    };    

// 이미지 지도를 생성합니다
var staticMap = new kakao.maps.StaticMap(staticMapContainer, staticMapOption);
</script>




</body>
</html>
