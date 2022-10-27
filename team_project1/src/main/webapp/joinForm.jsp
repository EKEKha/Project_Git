<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>
</head>

<script type="text/javascript">
	function check() {

		if (f.mem_id.value == "") {
			alert("아이디를 입력해주세요.");
			return f.mem_id.focus();
		}

		if (f.mem_pwd.value == "") {
			alert("비밀번호를 입력해주세요.");
			return f.mem_pwd.focus();
		}

		if (f.mem_name.value == "") {
			alert("이름를 입력해주세요.");
			return f.mem_name.focus();
		}

		if (f.mem_email.value == "") {
			alert("이메일를 입력해주세요.");
			return f.mem_email.focus();
		}

		if (f.mem_call.value == "") {
			alert("전화번호를 입력해주세요.");
			return f.mem_call.focus();
		}

		if (f.mem_postcode.value == "") {
			alert("우편번호를 입력해주세요.");
			return f.mem_postcode.focus();
		}

		if (f.mem_address1.value == "") {
			alert("주소를 입력해주세요.");
			return f.mem_address1.focus();
		}
		
		if (f.mem_address2.value == "") {
			alert("상세주소를 입력해주세요.");
			return f.mem_address2.focus();
		}
		
		if (f.mem_address3.value == "") {
			alert("상세주소를 입력해주세요.");
			return f.mem_address3.focus();
		}

	}
</script>

<body>
	<%@ include file="userHeader.jsp"%>
	<section id = "joinformArea">
		<div style="padding: 100px; font-family: mv Boli;">
			<div style="border: 1px solid gold; padding-top: 50px; padding-bottom: 50px;">
				<form name="joinforom" action="memberJoinAction.me" method="post">
					<b style="font-size: 40px; line-height:45px; color:gold;">Welcome<br>To<br>Tennis Supplies Shop</b>
					
					<div style="padding-top: 20px;">
						<tr>
							<td>
								<input type="text" placeholder="아이디" name ="mem_id" id = "mem_id" style="width: 122px; height: 35px; font-size: 20px;">
							</td>
						</tr>
					</div>
					
					<div style="padding-top: 5px;">
						<tr>
							<td><input type="text" placeholder="비밀번호" name ="mem_pwd" id = "mem_pwd" style="width: 250px; height: 35px; font-size: 20px; padding:5px">
							</td>
						</tr>
					</div>
	
					<div style="padding-top: 5px;">
						<tr>
							<td><input type="text" placeholder="이름" name ="mem_name" id = "mem_name" style="width: 250px; height: 35px; font-size: 20px; padding:5px">
							</td>
						</tr>
					</div>
					
					<div style="padding-top: 5px;">
						<tr>
							<td><input type="text" placeholder="이메일" name ="mem_email" id = "mem_email" style="width: 250px; height: 35px; font-size: 20px; padding:5px">
							</td>
						</tr>
					</div>
					
					<div style="padding-top: 5px;">
						<tr>
							<td><input type="text" placeholder="전화번호" name ="mem_call" id = "mem_call" style="width: 250px; height: 35px; font-size: 20px; padding:5px">
							</td>
						</tr>
					</div>
					
<!-- 카카오 우편번호 서비스 API ----------------------------------------------------------------------------------------------------->
<div style="padding-top: 5px;">
	<tr>
		<td>
			<input type="text" name ="mem_postcode" id = "mem_postcode" placeholder="우편번호" style="width: 122px; height: 35px; font-size: 20px;">
			<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" style="width: 122px; height: 35px; font-size: 20px;">
		</td>
	</tr>
</div>

<div style="padding-top: 5px;">
	<input type="text" name ="mem_address1" id = "mem_address1" placeholder="주소" style="width: 250px; height: 35px; font-size: 20px; padding:5px">
</div>

<div style="padding-top: 5px;">
	<input type="text" name ="mem_address2" id="mem_address2" placeholder="상세주소" style="width: 250px; height: 35px; font-size: 20px; padding:5px">
</div>

<div style="padding-top: 5px;">
	<input type="text" name ="mem_address3" id="mem_address3" placeholder="참고항목" style="width: 250px; height: 35px; font-size: 20px; padding:5px">
</div>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
<!------------------------------------------------------------------------------------------------------------------------------->				
	
					<div style="padding-top: 5px;">
							<input type="submit" value="가입하기" onclick="check();" style="width: 100px; height: 35px; font-size: 20px;">
							<input type="reset" value="다시작성" style="width: 100px; height: 35px; font-size: 20px;">
					</div>
				</form>
			</div>
		</div>
	</section>
	<%@ include file="footer.jsp"%>
</body>
</html>