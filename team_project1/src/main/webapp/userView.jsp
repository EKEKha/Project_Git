<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet" type="text/css" href="css/loginform.css">
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("mem_address3").value = extraAddr;
                
                } else {
                    document.getElementById("mem_address3").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('mem_postcode').value = data.zonecode;
                document.getElementById("mem_address1").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("mem_address2").focus();
            }
        }).open();
    }
</script>

<script>
function check(){
	//아이디와 비밀번호 값 데이터 정규화 공식
	const regIdPass = /^[a-zA-Z0-9]{8,12}$/;
	
	//이름 정규화 공식
	const regName = /^[가-힣a-zA-Z]{2,}$/;
	
	//이메일 정규화 공식
	const regEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	
	//휴대번호 정규화 공식
	const regCall = /^\d{3}\d{3,4}\d{4}$/; 
	
	//아이디 유효성 검사 - 정규화 공식 이용
	if( !document.f.mem_id.value.trim() ){//if(document.f.u_id.value==false){
		alert("아이디를 입력하세요.");
		document.f.mem_id.focus();//커서를 깜박거림
		return false;
	}else if( !regIdPass.test(document.f.mem_id.value.trim()) ){
		alert("아이디는 8~12자의 영어 대소문자와 숫자로만 입력가능합니다.");		
		return document.f.mem_id.select();//입력한 부분에 블록 설정되어 바로 수정가능한 상태로 만듦
	}else
		
	//비밀번호 유효성 검사 - 정규화 공식 이용
	if( !document.f.mem_pwd.value.trim() ){//if(document.f.u_password.value==false){
		alert("비밀번호를 입력하세요.");
		document.f.mem_pwd.focus();//커서를 깜박거림
		return false;
	}else if( !regIdPass.test(document.f.mem_pwd.value.trim()) ){
		alert("비밀번호는 8~12자의 영어 대소문자와 숫자로만 입력가능합니다.");		
		return document.f.mem_pwd.select();//입력한 부분에 블록 설정되어 바로 수정가능한 상태로 만듦
	}else
		
	//이름 유효성 검사 - 정규화 공식 이용
	if( !document.f.mem_name.value.trim() ){//if(document.f.u_name.value==false){
		alert("이름을 입력하세요.");
		document.f.mem_name.focus();//이름 필드에 커서를 둠
		return false;
	}else if( !regName.test(document.f.mem_name.value.trim()) ){//이름에 특수문자가 들어간 경우
		alert("이름이 잘못 입력되었습니다.(영어 대소문자와 한글만 입력가능합니다.)");	
		return document.f.mem_name.select();//입력한 부분에 블록 설정되어 바로 수정가능한 상태로 만듦
	}else
		
	//이메일 유효성 검사 - 정규화 공식 이용
	if( !document.f.mem_email.value.trim() ){//if(document.f.u_email.value==false){
		alert("이메일을 입력하세요.");
		document.f.mem_email.focus();//커서를 깜박거림
		return false;
	}else if( !regEmail.test(document.f.mem_email.value.trim()) ){
		alert("이메일 형식이 올바르지 않습니다.");	
		return document.f.mem_email.select();//입력한 부분에 블록 설정되어 바로 수정가능한 상태로 만듦
	}else
		
	//휴대번호 유효성 검사 - 정규화 공식 이용
	if( !document.f.mem_call.value.trim() ){//if(document.f.u_call.value==false){
		alert("휴대폰번호를 입력하세요.");
		document.f.mem_call.focus();//커서를 깜박거림
		return false;
	}else if( !regCall.test(document.f.mem_call.value.trim()) ){
		alert("휴대폰번호가 잘못 입력되었습니다. 숫자로만 입력해주세요.");	
		return document.f.mem_call.select();//입력한 부분에 블록 설정되어 바로 수정가능한 상태로 만듦
	}else
		
	if( document.f.mem_postcode.value.trim()=='' ){
		alert("우편번호를 입력하세요.");
		document.f.mem_postcode.focus();//커서를 깜박거림
		return false;
	}
	
	if( document.f.mem_address1.value.trim()=='' ){
		alert("주소를 입력하세요.");
		document.f.mem_address1.focus();//커서를 깜박거림
		return false;
	}
	
	if( document.f.mem_address2.value.trim()=='' ){
		alert("상세주소를 입력하세요.");
		document.f.mem_address2.focus();//커서를 깜박거림
		return false;
	}
	
	if( document.f.mem_address3.value.trim()=='' ){
		alert("참고사항를 입력하세요.");
		document.f.mem_address3.focus();//커서를 깜박거림
		return false;
	}
	
	document.f.submit();
}

	
	
</script>


<style>
.login-wrapper{
height:820px;
margin-bottom:100px;
}

</style>
</head>
<body>
	<%@include file="userHeader.jsp"%>

	
	
	
	
			
<div class="colorlib-partner">
	<div class="container">
		<div class="row">




			<div class="login-wrapper">
					<h2>${user.mem_id } (회원등급:
					
					<c:if test="${user.mem_grade=='0'}">
									<td>VIP</td>
								</c:if>
								<c:if test="${user.mem_grade=='1'}">
									<td>일반</td>
								</c:if>
								<c:if test="${user.mem_grade=='2'}">
									<td>관리자</td>
								</c:if>
					
					)
					</h2> 
					<form method="post" name="f" action="userUpdate.me"  id="login-form">
					
						
						<input type="password" name="mem_pwd" id="mem_pwd" placeholder="비밀번호"> 
						<input type="text" name="mem_name" id="mem_name" value="${user.mem_name }" readonly placeholder="이름" > 
						<input type="text" name="mem_email" id="mem_email" value="${user.mem_email }" placeholder="이메일입력  ex) tss000@naver.com" > 
						<input type="text"name="mem_call" id="mem_call" value="${user.mem_call }" placeholder="전화번호" > 
						<input type="text"name="mem_postcode" id="mem_postcode" value=${user.mem_postcode } style="width:150px;" placeholder="우편번호"> &nbsp;
						<input type="button" name="u_idck" id="u_idck"  style="width:90px;" value="찾기" 
							onclick="sample6_execDaumPostcode()"><br> 
						<input type="text" name="mem_address1" id="mem_address1" value="${user.mem_address1 }" placeholder="주소" >
						<input type="text" name="mem_address2" id="mem_address2" value="${user.mem_address2 }" placeholder="상세주소" >
						<input type="text" name="mem_address3" id="mem_address3" value="${user.mem_address3 }" placeholder="참고항목">
						<input type="text" name="mem_point" id="mem_point" value="포인트:${user.mem_point}점" readonly placeholder="포인트">
						
						
						<input type="submit" value="회원정보 수정" style="width:150px;" onclick="check(); return false;">
						
						
						
						
						
				
				
					</form>
				</div>



		</div>
	</div>
</div>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	
	<%@include file="footer.jsp"%>
</body>
</html>