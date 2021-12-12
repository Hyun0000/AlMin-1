<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- jstl은 header가 아닌 메인페이지에 삽입 -->
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 공통헤더 템플릿입니다. css 작성금지 -->

<!-- 네이버 로그인 -->
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.security.SecureRandom"%>
<%@ page import="java.math.BigInteger"%>
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
	charset="utf-8"></script>
<!-- 카카오 로그인 -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>

<!-- 네이버로그인 jsp로 하는 방법 -->
<%
	String clientId = "LV_HERZOVT4XTBBoYuEl";//애플리케이션 클라이언트 아이디값";
String redirectURI = URLEncoder.encode("http://localhost:8090/almin/main", "UTF-8");
SecureRandom random = new SecureRandom();
String state = new BigInteger(130, random).toString();
String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
apiURL += "&client_id=" + clientId;
apiURL += "&redirect_uri=" + redirectURI;
apiURL += "&state=" + state;
session.setAttribute("state", state);
%>

<!-- Header Area Starts -->
<header class="header-area main-header">
	<div class="container">
		<div class="row">
			<div class="col-lg-2">
				<div class="logo-area">
				<a href="${pageContext.request.contextPath}/main"><img
						src="${pageContext.request.contextPath}/resources/assets/images/logo.png"
						class="logo" alt="logo"></a>
				</div>
			</div>
			<div class="col-lg-10">
				<div class="custom-navbar">
					<span></span> <span></span> <span></span>
				</div>
				<div class="main-menu">
				<c:choose>
					<c:when test="${empty sessionScope.loginInfo.memberId}">
						<!-- 로그인 전 노출 -->
						<ul id="logout-state">
							<li class="menu-btn"><button class="login template-btn btn0">로그인</button>
								<a href="${pageContext.request.contextPath}/members/register"
								class="template-btn">회원가입</a></li>
						</ul>
					</c:when>
					<c:otherwise>
						<!-- 로그인 후 노출 -->
						<ul id="login-state">
							<li><a href="${pageContext.request.contextPath}/members/mypage">마이페이지</a></li>
							<li><a href="${pageContext.request.contextPath}/logout" class="logoutBtn"><button class="template-btn" onclick="logout()">로그아웃</button></a></li>
						</ul>
					</c:otherwise>
   				</c:choose>
					<ul>
						<li class="active"><a href="${pageContext.request.contextPath}/recruits">구인공고</a></li>
						<li><a href="${pageContext.request.contextPath}/applicants">인재정보</a></li>
					<li><a href="<%=request.getContextPath()%>/members/id" id="findId">아이디/비밀번호 찾기</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>

	<!-- 로그인 Modal Box -->
	<div class="modal" style="display: none;">
		<div class="modal-content loginArea">
			<span class="close">&times;</span>
			<!-- 닫기 -->
			<div class="tab item btngroup" style="margin-bottom: 10px;">
				<button type="button" class="t ab-item tab1" id="memberBtn"
					autofocus>개인회원</button>
				<button type="button" class="tab-item tab1 active"
					id="companyBtn">기업회원</button>
			</div>
			<form name="form" method="post" action="#" class="item">
				<table class="login-form">
					<div id="naver_id_login"></div>
					<tr>
						<td><input type="text" name="memberId" id="memberId"
							maxlength="20" value="" placeholder="아이디"></td>
					</tr>
					<tr>
						<td><input type="password" name="memberPw" id="memberPw"
							maxlength="20" placeholder="비밀번호"></td>
					</tr>
					<tr>
						<td class="save-id"><input type="checkbox" name="lb_idSave"
							id="lb_idSave" value="on" checked><label for="lb_idSave">아이디 저장</label></td>
					</tr>
					<tr>
						<td class="btngroup"><button type="button" class="template-btn btn0" id="loginBtn" onclick='ajaxL1()'>로그인</button></td>
					</tr>
				</table>
			</form>
			<!-- SNS 로그인(개인회원 show) -->
			<table class="snsBx login-form item">
				<tr>
					<td><a href="<%=apiURL%>"><img height="50"
							src="${pageContext.request.contextPath}/resources/assets/images/naver.png" /></a></td>
					<td><button type="button" id="btnKaLogin" class="btn0" onclick="loginKakao()">
							<img src="${pageContext.request.contextPath}/resources/assets/images/kakao.png"></button></td>
							<td><fb:login-button scope="public_profile,email" onlogin="checkLoginState();"></fb:login-button></td>
				</tr>
			</table>
			<table class="login-menu item">
				<tr>
					<td><a href="<%=request.getContextPath()%>/members/id" id="findId">아이디 찾기</a></td>
					<td><a href="<%=request.getContextPath()%>/members/pwd" id="findPwd">비밀번호 찾기</a></td>
					<td><a href="${pageContext.request.contextPath}/members/register" id="join">회원가입</a></td>
				</tr>
			</table>
		</div>
	</div>
	<script>
		var chk = "member";
	$(document).ready(function(){
		console.log(Kakao.Auth.getAccessToken());//토큰확인
		$("#memberBtn").css({
			"background-color":"#f8b600",
			"color":"white",
			"border":"3px solid #f8b600"
		});
		$("#memberBtn").click(function(){
			chk="member";
			$("#memberBtn").css({
				"background-color":"#f8b600",
				"color":"white",
				"border":"3px solid #f8b600"
			});
			$("#companyBtn").css({
				"background-color":"white",
				"color":"black",
				"border":"3px solid #FAE100"
			});
			})
		$("#companyBtn").click(function(){
			chk="company";
			$("#companyBtn").css({
				"background-color":"#f8b600",
				"color":"white",
				"border":"3px solid #f8b600"
			});
			$("#memberBtn").css({
				"background-color":"white",
				"color":"black",
				"border":"3px solid #FAE100"
			});
			})
			 //아이디 저장 체크박스
			var userInputId = getCookie("userInputId");//저장된 쿠키값 가져오기
			$("#memberId").val(userInputId); 
			 
			if($("#memberId").val() != ""){ // 그 전에 ID를 저장해서 처음 페이지 로딩
			                                       // 아이디 저장하기 체크되어있을 시,
			    $("#lb_idSave").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
			}
			 
			$("#idSaveCheck").change(function(){ // 체크박스에 변화가 발생시
			    if($("#idSaveCheck").is(":checked")){ // ID 저장하기 체크했을 때,
			        var userInputId = $("#memberId").val();
			        setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
			    }else{ // ID 저장하기 체크 해제 시,
			        deleteCookie("userInputId");
			    }
			});
			 
			// ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
			$("#memberId").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
			    if($("#idSaveCheck").is(":checked")){ // ID 저장하기를 체크한 상태라면,
			        var userInputId = $("#memberId").val();
			        setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
			    }
			});
	})
$(".login").click(function(){
	$(".modal").show(); 
});
$(".close").click(function(){
    $(".modal").hide(); 
 });
$("#memberBtn").click(function(){
    $(".snsBx").show(); 
 });
$("#companyBtn").click(function(){
    $(".snsBx").hide(); 
 });

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
    
function ajaxL1(){ //ID, PWD 입력 후 로그인 버튼 onclick
	var memberId = $("#memberId").val();
	var memberPw = $("#memberPw").val();
	
	var saveIdCheck = $("#lb_idSave:checked").val();//TODO
	var json = {'memberId':  $("#memberId").val(),
			'memberPw': $("#memberPw").val()};
	var url="<%=request.getContextPath()%>/logins";
	console.log("memberId: "+memberId+", memberPw: "+memberPw+" chk: "+chk);
	
	if(chk=="company"){
		url+="/companies/"+memberId;
	}else if(chk=="member"){
		url+="/members/"+memberId;
	}
	
	$.ajax({
		url: url,
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
				console.log("로그인 성공")
				
    		$(".modal").hide(); 
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

		// SNS 로그인(네이버, 카카오, 페이스북)

		/*네이버 로그인(JS로 하는 방법) // el태그 인식 못함
		 var naver_id_login = new naver_id_login("LV_HERZOVT4XTBBoYuEl", "http://localhost:8090/almin/main");
		 var state = naver_id_login.getUniqState();
		 naver_id_login.setButton("white", 2,40);
		 naver_id_login.setDomain("http://localhost:8090/");
		 naver_id_login.setState(state);
		 naver_id_login.setPopup();
		 naver_id_login.init_naver_id_login();
		 */
		//카카오 로그인
		Kakao.init('92b42c653e35f2ec80b54619123374f3');
		console.log(Kakao.isInitialized()); // sdk초기화여부판단

		function loginKakao() {
			Kakao.Auth.login({
				success : function(response) {
					Kakao.API.request({
						url : '/v2/user/me',
						success : function(response) {
							location.href = "main";
							console.log(response)
						},
						fail : function(error) {
							console.log(error)
						},
					})
				},
				fail : function(error) {
					console.log(error)
				},
			})
		}
		//페이스북 로그인
		function fnFbCustomLogin() {
			FB.login(function(response) {
				if (response.status === 'connected') {
					FB.api('/me', 'get', {
						fields : 'name,email'
					}, function(r) {
						console.log(r);
					})
				} else if (response.status === 'not_authorized') {
					// 사람은 Facebook에 로그인했지만 앱에는 로그인하지 않았습니다.
					alert('앱에 로그인해야 이용가능한 기능입니다.');
				} else {
					// 그 사람은 Facebook에 로그인하지 않았으므로이 앱에 로그인했는지 여부는 확실하지 않습니다.
					alert('페이스북에 로그인해야 이용가능한 기능입니다.');
				}
			}, {
				scope : 'public_profile,email'
			});
		}

		window.fbAsyncInit = function() {
			FB.init({
				appId : '990964348428566',
				cookie : true,
				xfbml : true,
				version : 'v12.0'
			});

			FB.AppEvents.logPageView();

		};
		//1단계
		(function(d, s, id) {
			var js, fjs = d.getElementsByTagName(s)[0];
			if (d.getElementById(id)) {
				return;
			}
			js = d.createElement(s);
			js.id = id;
			js.src = "https://connect.facebook.net/en_US/sdk.js";
			fjs.parentNode.insertBefore(js, fjs);
		}(document, 'script', 'facebook-jssdk'));

		//2단계
		FB.getLoginStatus(function(response) {
			statusChangeCallback(response);
		});
		//3단계
		function checkLoginState() {
			FB.getLoginStatus(function(response) {
				statusChangeCallback(response);
			});
		}
		/*
		function statusChangeCallback (response){
		 console.log(response);
		 location.href= "/almin/main";
		}*/
		function statusChangeCallback(response) { // Called with the results from FB.getLoginStatus().
			console.log('statusChangeCallback');
			console.log(response); // The current login status of the person.
			if (response.status === 'connected') { // Logged into your webpage and Facebook.
				testAPI();
			} else { // Not logged into your webpage or we are unable to tell.
				//document.getElementById('status').innerHTML = 'Please log ' + 'into this webpage.';
			}
		}
		
		
	//logout
		function logoutFB() {
			FB.logout(function(response) {
				// Person is now logged out
				console.log(response);
				FB.getLoginStatus(function(response) { // See the onlogin handler
					statusChangeCallback(response);
				});
			});
		};
 	function logout(){
 		logoutFB();
		Kakao.Auth.logout();
		//연결끊기
		Kakao.API.request({
			  url: '/v1/user/unlink',
			  success: function(response) {
			    console.log(response);
			  },
			  fail: function(error) {
			    console.log(error);
			  },
			});
		
		
		//로그아웃()
		if (!Kakao.Auth.getAccessToken()) {
			
			  console.log('Not logged in.');
			  return;
			}
			Kakao.Auth.logout(function() {
			  console.log(Kakao.Auth.getAccessToken());
			});
			location.href="${pageContext.request.contextPath}/logout"
 	}
			//response.status === 'connected' 로그인상태
			//response.status === 'unknown' 로그아웃상태
			function mypage(){
				$.ajax({
					url: url,
					type: "post",
					 // data : 서버(컨트롤러)로 보내는 데이터.
					 // json데이터를 JSON.stringify를 이용하여 String으로 형변환
					data: JSON.stringify(json),
					//이때 전달한 String데이터는 JSON형태의 데이터임을 알려줌.
					contentType : "application/json; charset=utf-8",
					success: function(result){
						if(result == false){
							alert("비밀번호가 일치하지 않습니다.");
						} else {
							//TODO: 일치하는 n개의 아이디를 찾았습니다(화면 생성)
							alert("비밀번호가 일치합니다.");
					location.href ="${pageContext.request.contextPath}/members/mypage/edit?userId="+$("#uid").html() //회원정보수정
						}
				},
				error:function(request,status,error){
					alert("code:"+request.status+"\n"+"message:"+request.responseText+
							"\n"+"error:"+error);
				}
				});
			}
		
	</script>
</header>
<!-- Header Area End -->