<%@page import="vo.PageInfo"%>
<%@page import="vo.BoardBean"%>
<%@page import="vo.Member" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>

<%
	ArrayList<BoardBean> articleList=(ArrayList<BoardBean>)request.getAttribute("articleList");
    PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
	int listCount=pageInfo.getListCount();
	int nowPage=pageInfo.getPage();
	int maxPage=pageInfo.getMaxPage();
	int startPage=pageInfo.getStartPage();
	int endPage=pageInfo.getEndPage();
	



	String loginID = (String)session.getAttribute("mem_id"); //세션에 있는 ID불러오기
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>MVC 게시판</title>
<style type="text/css">
#registForm {
	width: 500px;
	height: 900px;
	border: 1px solid red;
	margin: auto;
	  background-color: black;
}
 
h4 {
	text-align: right;
}
h4 a{
	text-decoration: none;
}

table {
	margin: auto;
	width: 100%;
  text-align:center;}
  
#listForm{ height: 500px;}  

 


#tr_top {
	background: skyblue;
	text-align: center;
	color:black;
}

#pageList {
	margin: auto;
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
background-color: black;
}
 h4{background-color: black;}
 h4 a {color:white;}
</style>
</head>

<body>
<h4>
	<%@include file="../userHeader.jsp"%>
	<!-- 게시판 리스트 -->
	
     <%if(loginID!=null){ %>
     <h4>
	 <a href="boardWriteForm.bo">게시판글쓰기</a>
	 </h4>
	 <%}else if(loginID==null){%>
	 <h4>
	 <a href="loginForm.jsp">게시판글쓰기</a>	 
	 </h4>	 
	 <%} %>
	 
	 
	 
	<section id="listForm">
	
		<table border="1">
			<%
if(articleList != null && listCount > 0){
%>
<h2>테스트 로그인 아이디 : <%=loginID %></h2>
			<tr id="tr_top">
				<td>번호</td>
				<td>작성자ID</td>
				<td>제목</td>
				<td>날짜</td>
				<td>조회수</td>
			</tr>

			<%
		for(int i=0;i<articleList.size();i++){
			
	%>
			<tr id="tr_down">
				<td><%=articleList.get(i).getBOARD_NUM()%></td>
				
                <td><%=articleList.get(i).getMEM_ID() %></td>
                
				<td>
					<%if(articleList.get(i).getBOARD_RE_LEV()!=0){ %> 
					<%for(int a=0;a<=articleList.get(i).getBOARD_RE_LEV()*2;a++){ %>&nbsp; <%} %>  
					답글: <%}else{ %> ▶ <%} %> 

					<a href="boardDetail.bo?board_num=<%=articleList.get(i).getBOARD_NUM()%>&page=<%=nowPage%>">
						<%=articleList.get(i).getBOARD_SUBJECT()%>
				   </a>
				
				    
				</td>

			
				<td><%=articleList.get(i).getBOARD_DATE() %></td>
				<td><%=articleList.get(i).getBOARD_READCOUNT() %></td>
			</tr>
			<%} %>
		</table>
	</section>

	<section id="pageList">
		<%if(nowPage<=1){ %>
		[이전]&nbsp;
		<%}else{ %>
		<a href="boardList.bo?page=<%=nowPage-1 %>">[이전]</a>&nbsp;
		<%} %>

		<%for(int a=startPage;a<=endPage;a++){
				if(a==nowPage){%>
		[<%=a %>]
		<%}else{ %>
		<a href="boardList.bo?page=<%=a %>">[<%=a %>]
		</a>&nbsp;
		<%} %>
		<%} %>

		<%if(nowPage>=maxPage){ %>
		[다음]
		<%}else{ %>
		<a href="boardList.bo?page=<%=nowPage+1 %>">[다음]</a>
		<%} %>
	
	</section>
	<%
    }
	else
	{
	%>

	<section id="emptyArea">등록된 글이 없습니다.</section>
	<%
	}
%>
	
		<%@include file="../footer.jsp"%>
</body>
</html>
