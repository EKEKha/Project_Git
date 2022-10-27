<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
<section id = "memberInfoArea">
<table>
	<tr>
		<td>아아디:</td>
		<td>${member.mem_id }</td>
	</tr>
	<tr>
		<td>비밀번호:</td>
		<td>${member.mem_pwd }</td>
	</tr>
	<tr>
		<td>이름:</td>
		<td>${member.mem_name }</td>
	</tr>
	<tr>
		<td>이메일:</td>
		<td>${member.mem_email }</td>
	</tr>
	<tr>
		<td>전화번호: </td>
		<td>${member.mem_call }</td>
	</tr>
	<tr>
		<td>우편번호:</td>
		<td>${member.mem_postcode }</td>
	</tr>
	<tr>
		<td>주소:</td>
		<td>${member.mem_address1 }</td>
	</tr>
	<tr>
		<td>상세 주소:</td>
		<td>${member.mem_address2 }</td>
	</tr>
	<tr>
		<td>등급:</td>
		<td>${member.mem_grade }</td>
	</tr>
	<tr>
		<td colspan=2>
			<a href="memberListAction.me">리스트로 돌아가기</a>
		</td>
	</tr>
</table>
</section>
</body>
</html>