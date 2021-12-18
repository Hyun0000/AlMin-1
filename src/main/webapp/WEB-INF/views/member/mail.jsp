<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 이메일 인증 -->
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.js"></script>
<meta charset="UTF-8">
<title>이메일 인증단계</title>
<!-- Favicon -->
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/resources/assets/images/logo/favicon.png" type="image/x-icon">
<!-- CSS Files -->
<link rel="stylesheet" href="<c:url value='/resources/assets/css/almin.css'/>">
<style>
th {
width:150px;
}
/* 입력란 */
input[type=text], input[type=password]{
background-color: #f9f9ff;
border: none;
  padding: 12px;
  border-radius: 4px;
  margin: 8px 0;
  opacity: 0.85;
  display: inline-block;
  font-size: 17px;
  line-height: 20px;
  text-decoration: none;
}
button#mailcheck, button#lastChkBtn{
 margin-left: 10px;
 }
 table{
    margin: 0 auto;
 }
</style>
</head>
<body>
<!-- 공통헤더 템플릿 -->
<c:import url="/WEB-INF/views/template/header.jsp"/>
<section class="feature-area section-padding2">
		<div class="container">
			<div class="row">
				<div class="col-lg-12" style="padding-top: 50px;">
					<div class="section-top text-center">
						<h2>이메일 인증</h2>
<h4>이메일 인증만 마치면 회원가입이 완료됩니다.</h4>
					</div>
				</div>
			</div>
			<div class="row" style="padding-bottom: 120px;">
				<div class="col-lg-12">
	<!-- ajax로 쿠키 떨궈줌(인증 클릭 시) -> 이메일 보냄
 -> 컨트롤러에서 어스키 보내줌 -> 쿠키에 저장(3분) -> 
  mail.jsp에서 입력 -->
<table>
	<tr>
		<td><p id="mailaddress">${email}</p></td>
		<td><button type="button" class="genric-btn info-border radius" id="mailcheck" onclick="ajaxm1()">인증</button></td>
	</tr>
	<tr>
		<td><input type="text" id="lastChk"></td>
		<td><button type="button" class="genric-btn info radius" id="lastChkBtn" onclick="lastCheck()">확인</button></td>
	</tr>
</table>
				</div>
			</div>
		</div>
</section>
<script>
function setCookie(cookieName, value, exdays){
    var exdate = new Date();
    exdate.setDate(exdate.getDate() + exdays);
    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
    document.cookie = cookieName + "=" + cookieValue;
}
 
function deleteCookie(cookieName){
    var expireDate = new Date();
    expireDate.setDate(expireDate.getDate() - 1);
    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
}
 
function getCookie(cookieName) {
    cookieName = cookieName + '=';
    var cookieData = document.cookie;
    var start = cookieData.indexOf(cookieName);
    var cookieValue = '';
    if(start != -1){
        start += cookieName.length;
        var end = cookieData.indexOf(';', start);
        if(end == -1)end = cookieData.length;
        cookieValue = cookieData.substring(start, end);
    }
    return unescape(cookieValue);
}
function ajaxm1(){
	var memberEmail = $("#mailaddress").html()
	var json = {
		"memberEmail": memberEmail
	}
	console.log($("#mailaddress").html());
	$.ajax({
		url: "<%=request.getContextPath()%>/members/emails",
		type: "post",
		 // data : 서버(컨트롤러)로 보내는 데이터.
		 // json데이터를 JSON.stringify를 이용하여 String으로 형변환
		data: JSON.stringify(json),
		//이때 전달한 String데이터는 JSON형태의 데이터임을 알려줌.
		contentType : "application/json; charset=utf-8",
		success: function(result){
			console.log(result);
			var date = new Date();
			 var minutes = 5;
			 date.setTime(date.getTime() + (minutes * 60 * 1000));
			 setCookie("email",result, date); //쿠키이름, 쿠키값, 언제끝날지
	},
	error:function(request,status,error){
		alert("code:"+request.status+"\n"+"message:"+request.responseText+
				"\n"+"error:"+error);
	}
	});
}
//member테이블에 이메일 인증 YN - N이면 서비스를 주면 안됨. -> 인터셉터 프리핸들에서 처리!(로그인 막기)
function lastCheck(){
	if($("#lastChk").val() == getCookie("email")){
		alert("회원가입이 완료되었습니다.");
		location.href="<%=request.getContextPath()%>/main";
	}else {
		alert("이메일 인증 실패");
	}
	
	
}

</script>
	<!-- 공통푸터 템플릿 -->
<c:import url="/WEB-INF/views/template/footer.jsp"/>
</body>
</html>