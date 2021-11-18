<!-- 웹폰트: Noto Sans Korean -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400&display=swap" rel="stylesheet">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>알바의 민족 개인회원가입</title>
<style>
 /* reset */
 * {
       margin: 0;
       padding: 0;
 }
 @font-face {
    font-family: 'GmarketSansMedium';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
  body{
      font-family: 'Noto Sans KR', sans-serif;
  }
  table {
  text-align: center;
  }
</style>
</head>
<script type="text/javascript">
		$(document).ready(function(){
			// 취소
			$(".cancel").on("click", function(){
				
				location.href = "/";
						    
			})
		
			$("#submit").on("click", function(){
				if($("#userPass").val()==""){
					alert("비밀번호를 입력해주세요.");
					$("#userPass").focus();
					return false;
				}
				if($("#userName").val()==""){
					alert("성명을 입력해주세요.");
					$("#userName").focus();
					return false;
				}
				$.ajax({
					url : "/member/passChk",
					type : "POST",
					dateType : "json",
					data : $("#updateForm").serializeArray(),
					success: function(data){
						
						if(data==true){
							if(confirm("회원수정하시겠습니까?")){
								$("#updateForm").submit();
							}
							
						}else{
							alert("패스워드가 틀렸습니다.");
							return;
							
						}
					}
				})
			});
		})
	</script>
<body>
<section>
<form id="updateForm" action="/member/memberUpdate" method="post">
	<h2>개인회원가입</h2>
	<table>
		<tr>
		<th><label for="userId">아이디</label></th>
		<td><input type="text" id="userId" name="userId"  placeholder="6~50자 영문, 숫자" maxlength="50" ></td>
		</tr>
		<th><label for="userPass">비밀번호</label></th>
		<td><input type="text" id="userPass"></td>
		</tr>
		<th>비밀번호 확인</th>
		<td><input type="text"></td>
		</tr>
		<tr>
		<th><label for="userName">이름</label></th>
		<td>
		<!-- maxlengh: 최대 입력 글자수, size: 화면에 보이는 최대글자수 -->
		<input type="text" id="userName" name="userName" maxlength="50" size = "10">
		</td>
		</tr>
		<tr>
		<th>주민등록번호</th>
		<td>
		<input type="text" name="birthNum" placeholder="예:931010" maxlength="6" size = "6"> -
		<input type="text" name="genderNum" maxlength="1" size = "1">
		</td>
		</tr>
		<tr>
		<th>이메일</th>
		<td>
		<input type="text" id = "email_1" name="email_1" maxlength="30">@
		<input type="text" id = "email_2" name="email_2" maxlength="30">
		<select id = "email_3" name="email_3">
			<option>naver.com</option>
			<option>hanmail.net</option>
			<option>gmail.com</option>
			<option>nate.com</option>
			<option>직접입력</option>
		</select>
		</td>
		</tr>
		<tr>
		<th>휴대폰번호</th>
		<td>
		<input type="text" name="phone1" placeholder="010" maxlength="3" size = "3"> -
		<input type="text" name="phone2" placeholder="0000" maxlength="4" size = "4"> -
		<input type="text" name="phone3" placeholder="0000" maxlength="4" size = "4"> -
		</td>
		</tr>
	</table>
<button type="button" id="submit">회원정보수정</button>
<button class="cancel" type="button">취소</button>
</form>
</section>
</body>
</html>