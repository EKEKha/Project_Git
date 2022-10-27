<%@ page import="vo.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<section id="memberListArea">
<table>
	<tr>
		<td colspan=2><h1>회원목록</h1></td>
	</tr>
	<c:forEach var = "member" items = "${memberList}">
	<tr>
		<td>
			<a href="memberViewAction.me?id=${member.mem_id}">
				${member.mem_id}
			</a>
		</td>
		<td>
			<a href="memberDeleteAction.me?id=${member.mem_id}">삭제</a>
		</td>
	</tr>
	</c:forEach>
</table>
</section>
</body>
</html>