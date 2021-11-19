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
<!-- Favicon -->
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/resources/assets/images/logo/favicon.png" type="image/x-icon">
<!-- CSS Files -->
<link rel="stylesheet" href="<c:url value="/resources/template/css/almin.css"/>">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/animate-3.7.0.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/font-awesome-4.7.0.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/fonts/flat-icon/flaticon.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/bootstrap-4.1.3.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/owl-carousel.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/nice-select.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/style.css">
<style>
  body{
      font-family: 'Noto Sans KR', sans-serif;
  }
  section {
         width: 900px;
         padding: 0 0 30px 0;
          /* position: relative; */
         bottom: 170px;
         left: 600px;
     }
      section > h2 {
          margin: 20px;
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
				if($("#userId").val()==""){
					alert("아이디를 입력해주세요.");
					$("#userId").focus();
					return false;
				}
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
1							}
							
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
<!-- 공통헤더 템플릿 -->
<c:import url="/WEB-INF/views/template/header.jsp"/>
<section>
	<h2>개인회원가입</h2>
<form id="updateForm" action="/member/memberUpdate" method="post">
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
		<input type="text" name="phone3" placeholder="0000" maxlength="4" size = "4">
		</td>
		</tr>
	</table>
<div class="btngroup">
<button class="btn1" type="button" id="submit">회원정보수정</button>
<button class="cancel btn2" type="button">취소</button>
</div>
</form>
</section>
	<!-- 공통푸터 템플릿 -->
<c:import url="/WEB-INF/views/template/footer.jsp"/>
</body>
</html>