<!-- 웹폰트: Noto Sans Korean -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400&display=swap" rel="stylesheet">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 팝업창</title>
<!-- Favicon -->
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/resources/assets/images/logo/favicon.png" type="image/x-icon">
<!-- CSS Files -->
<link rel="stylesheet" href="<c:url value="/resources/assets/css/almin.css"/>">
<style>
body{
      font-family: 'Noto Sans KR', sans-serif;
  }
</style>
</head>
<body>
<div class="loginArea">
		<div class="tab">
			<button class="tab-item" data-val="GG">개인회원</button>
			<button class="tab-item active" data-val="GI">기업회원</button>
		</div>
		
		<form name="form" method="post" action="#">
		
	<div class="login-form">
			<input type="text" name="M_ID" id="M_ID" maxlength="20" class="emptyId" value="" placeholder="아이디">
			<input type="password" name="M_PWD" id="M_PWD" maxlength="20" class="emptyPw" placeholder="비밀번호">
	</div>
	<div class="apply">
			<button class="btn1">로그인</button>
		<div class="apply-option">
			<div class="save-id">
				<input type="checkbox" name="lb_idSave" id="lb_idSave" value="on" checked><label for="lb_idSave">아이디 저장 </label> 
			</div>
		</div>
	</div>
		</form>
		<div class="snsBx" style="display: none;">
			<ul>
				<li><button type="button" id="btnNvLogin" class="btn_nv"></button></li>
				<li><button type="button" id="btnKaLogin" class="btn_kt"></button></li>
				<li><button type="button" id="btnGlLogin" class="btn_gg"></button></li>
			</ul>
		</div>
	</div>
<div id="login-menu">
  <ul>
      	<li><a href="findId">아이디 찾기</a></li>
      	<li><a href="findPwd">비밀번호 찾기</a></li>
   		<li><a href="join">회원가입</a></li>
  </ul>
</div>
</body>
</html>