<%@page import="vo.PageInfo"%>
<%@page import="vo.QBoardBean"%>
<%@page import="vo.MemberBean" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.js"></script> 
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<title>QNA 게시판 글목록</title>
<style type="text/css">
.sub1{
width: 100px;
margin:40px auto;}

.sub2{
    margin-right:20px;
   text-align: right;
   background-color: white;
   color:black;
}

table tr td{
   text-align: center;
}

#pageList {

   width: 100%;
   text-align: center;
}

#emptyArea {
   margin: auto;
   width: 500px;
   text-align: center;
}
#tr_down{
  background-color: white;
  color:black;
}
#write{
background-color: white;
}
#first-table{border-color: #e1e4e1;}


 @media all and (max-width: 768px){
     #table-first{width:80%;}
    }
 @media all and (max-width: 415px){
    #table-first{width:100%;}
    }   
</style>

</head>

<body>
 <jsp:include page="../userHeader.jsp"/>

  
   <c:set var="nowPage"  value="${pageInfo.page}"/>
   <c:set var="maxPage" value="${pageInfo.maxPage}"/>
   <c:set var="startPage" value="${pageInfo.startPage}"/>
   <c:set var="endPage" value="${pageInfo.endPage}"/>
   <c:set var="listCount" value="${pageInfo.listCount}"/>
   
	
<div class="colorlib-partner">
	<div class="container">
		<div class="row">

	
   
   <section id="listForm">
   
     <h2 class="sub1">QNA</h2>
     <h4 class="sub2"><a href="qboardWriteForm.qna">문의하기</a></h4>    
<c:choose>
<c:when test="${articleList !=null and listCount > 0}">
<table border="1" id="first-table"  class="table table-hover"> 
         <tr id="tr_top">
            <td>번호</td>
            <td>작성자ID</td>
            <td>제목</td>
            <td>날짜</td>
            <td>조회수</td>
         </tr>

           <c:forEach var="boardlist" items="${articleList}"> 
         <tr id="tr_down">
            <td>${boardlist.QBOARD_NUM}</td>
            
                <td>${boardlist.MEM_ID}</td>
                
            <td>
                <c:choose>            
               <c:when test="${boardlist.QBOARD_RE_LEV!=0}">
               <c:forEach var="select" begin="0" end="${boardlist.QBOARD_RE_LEV*2}">&nbsp;</c:forEach> <%--답글 깊이만큼 답글 : 표시 --%>                 
                RE: </c:when> 
                <c:otherwise> ▶ </c:otherwise> <%--그게아니면  ▶ --%>
                    </c:choose>
               <a href="qboardDetail.qna?qboard_num=${boardlist.QBOARD_NUM}&page=${nowPage}">
                  ${boardlist.QBOARD_SUBJECT}<%--내용을 클릭하면 boardDetail.bo?로 board_num과 nowPage get방식으로 전달 --%>
                </a>                            
            </td>      
            <td>${boardlist.QBOARD_DATE}</td>
            <td>${boardlist.QBOARD_READCOUNT}</td>
         </tr>
         </c:forEach>
      </table>

   <div id="pageList">
       <c:choose>
      <c:when test="${nowPage<=1}">
      [이전]&nbsp;
      </c:when>
      <c:otherwise>
      <a href="qboardList.qna?page=${nowPage-1}">[이전]</a>&nbsp;
      </c:otherwise>
        </c:choose>
 
       <c:forEach var="a" begin="${startPage}" end="${endPage}">
       <c:choose>   
       <c:when test="${a == nowPage}">   
      [${a}]   <%--현재페이지[1]가 시작페이지[1]와 같으면 링크x ex:[1]-click링크X--%>
       </c:when>
       <c:otherwise>
      <a href="qboardList.qna?page=${a}">[${a}] <%--그게아니면 ex:[2]-click링크O -> [2]페이지의 리스트 출력--%>
      </a>&nbsp;      
      </c:otherwise>
      </c:choose>
      </c:forEach>

          
      <c:choose>
      <c:when test="${nowPage>=maxPage}"> <%--현재페이지가 마지막 페이지일경우 링크X [다음] --%>
      [다음]
      </c:when>
      <c:otherwise>
      <a href="qboardList.qna?page=${nowPage}+1">[다음]</a>   <%--마지막이아닐 경우 [다음]에 링크 --%>
      </c:otherwise>
      </c:choose>
   </div>
   
   
   </c:when>
   <c:otherwise>
   <div id="emptyArea">등록된 글이 없습니다.</div>
   </c:otherwise>
   </c:choose>
   </section>  
   </div>
   </div>
   </div>
 <jsp:include page="../footer.jsp"/>
</body>
</html>