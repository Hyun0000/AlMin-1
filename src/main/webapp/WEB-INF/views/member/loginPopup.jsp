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
<title>로그인 팝업창</title>
<!-- Favicon -->
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/resources/assets/images/logo/favicon.png" type="image/x-icon">
<!-- CSS Files -->
<link rel="stylesheet" href="<c:url value='/resources/assets/css/almin.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/member/css/member.css'/>">
<style>
body{
      font-family: 'Noto Sans KR', sans-serif;
  }
.loginArea { /* flex-direction와 flex-wrap의 단축 속성 */
   	display: flex;
	/* row, row-reverse, column, column-reverse 
	nowrap wrap wrap-reverse */
	flex-flow: column nowrap;
	/* flex-start, flex-end, center, space-between, space-around */
	justify-content: flex-start;
	align-content: stretch;
	align-items: center;
   }
   .tab button{
   border: 1px solid #BDBDBD;
   }
</style>
</head>
<body>
<div class="loginArea">
		<div class="tab item">
			<button type="button" class="tab-item" data-val="GG">개인회원</button>
			<button type="button" class="tab-item active" data-val="GI">기업회원</button>
		</div>
<form name="form" method="post" action="#" class="item">
		<table class="login-form">
		<tr><td><input type="text" name="memberId" id="memberId" maxlength="20" value="" placeholder="아이디"></td></tr>
		<tr><td><input type="password" name="memberPw" id="memberPw" maxlength="20" placeholder="비밀번호"></td></tr>
		<tr><td class="save-id"><input type="checkbox" name="lb_idSave" id="lb_idSave" value="on" checked><label for="lb_idSave"> 아이디 저장</label></td></tr>
		<tr><td><button type="button" class="btn1" id="loginBtn" onclick='ajaxL1()'>로그인</button></td></tr>
		</table>
</form>
		<div class="snsBx item" style="display: none;"><!-- 개인회원일 때만 show -->
			<ul>
				<li><button type="button" id="btnNvLogin" class="btn_nv"></button></li>
				<li><button type="button" id="btnKaLogin" class="btn_kt"></button></li>
				<li><button type="button" id="btnGlLogin" class="btn_gg"></button></li>
			</ul>
		</div>
  <ul class="login-menu item">
      	<li><a href="#" id="findId">아이디 찾기</a></li>
      	<li><a href="#" id="findPwd">비밀번호 찾기</a></li>
   		<li><a href="#" id="join">회원가입</a></li>
  </ul>
</div>
<script>
function ajaxL1(){ //로그인 버튼 onclick
	var memberId = $("#memberId").val();
	var memberPw = $("#memberPw").val();
	var saveIdCheck = $("#lb_idSave:checked").val();
	var json = {'memberId':  $("#memberId").val(),
			'memberPw': $("#memberPw").val()};
	console.log("memberId: "+memberId+", memberPw: "+memberPw);
	$.ajax({
		url: "<%=request.getContextPath()%>/logins/"+memberId,
		type: "post",
		 // data : 서버(컨트롤러)로 보내는 데이터.
		 // json데이터를 JSON.stringify를 이용하여 String으로 형변환
		data: JSON.stringify(json),
		//이때 전달한 String데이터는 JSON형태의 데이터임을 알려줌.
		contentType : "application/json; charset=utf-8",
		success: function(result){
			if(result == 0){
				alert("아이디와 비밀번호를 다시 확인해주세요.");
			} else {
			console.log("로그인 성공하셨습니다.")
			}
		location.href ="${pageContext.request.contextPath}/main"
	},
	error:function(request,status,error){
		alert("code:"+request.status+"\n"+"message:"+request.responseText+
				"\n"+"error:"+error);
	}
	});
	//location.href="<%=request.getContextPath()%>/logins?userId="+userId;
};
</script>
</body>
</html>