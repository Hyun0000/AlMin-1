<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- jstl은 header가 아닌 메인페이지에 삽입 -->
<!-- 공통헤더 템플릿입니다. css 작성금지 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400&display=swap"
	rel="stylesheet">
<!-- 네이버 로그인 -->
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.security.SecureRandom"%>
<%@ page import="java.math.BigInteger"%>
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
	charset="utf-8"></script>
<!-- 카카오 로그인 -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<style>
#logout-state {
	z-index: 200;
}
</style>
<!-- 네이버로그인 jsp로 하는 방법 -->
<%
	String clientId = "LV_HERZOVT4XTBBoYuEl";//애플리케이션 클라이언트 아이디값";
String redirectURI = URLEncoder.encode("http://127.0.0.1:8090/almin/main", "UTF-8");
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
					<ul>
						<li class="active"><a href="recruits/jobinfoList">구인공고</a></li>
						<li><a href="#">인재정보</a></li>
					</ul>
					<!-- 로그인 전 노출 -->
					<ul id="logout-state">
						<li><a href="#">아이디/비밀번호 찾기</a></li>
						<li class="menu-btn"><button class="login template-btn">로그인</button>
							<a href="${pageContext.request.contextPath}/members"
							class="template-btn">회원가입</a></li>
					</ul>
					<!-- 로그인 후 노출 -->
					<ul id="login-state" style="display: none;">
						<li><a href="#">로그아웃</a></li>
						<li><a href="#">마이페이지</a></li>
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
			<div class="tab item" style="margin-bottom: 10px;">
				<button type="button" class="tab-item genric-btn" id="memberBtn"
					autofocus>개인회원</button>
				<button type="button" class="tab-item active genric-btn"
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
							id="lb_idSave" value="on" checked><label for="lb_idSave">
								아이디 저장</label></td>
					</tr>
					<tr>
						<td><button type="button" class="template-btn" id="loginBtn"
								onclick='ajaxL1()'>로그인</button></td>
					</tr>
				</table>
			</form>
			<!-- SNS 로그인(개인회원 show) -->
			<div class="snsBx item">
				<ul>
					<li><a href="<%=apiURL%>"><img height="50"
							src="http://static.nid.naver.com/oauth/small_g_in.PNG" /></a></li>
					<li><button type="button" id="btnKaLogin" class="btn_kt"
							onclick="loginKakao()">
							<img
								src="${pageContext.request.contextPath}/resources/assets/images/kakao_login_medium_narrow.png">
						</button></li>
					<fb:login-button scope="public_profile,email"
						onlogin="checkLoginState();"></fb:login-button>
					<button type="button" onclick="logoutFB()">Facebook 로그아웃</button>
				</ul>
			</div>
			<table class="login-menu item">
				<tr>
					<td><a href="#" id="findId">아이디 찾기</a></td>
					<td><a href="#" id="findPwd">비밀번호 찾기</a></td>
					<td><a href="${pageContext.request.contextPath}/members"
						id="join">회원가입</a></td>
				</tr>
			</table>
		</div>
	</div>
	<script>
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

function ajaxL1(){ //ID, PWD 입력 후 로그인 버튼 onclick
	var memberId = $("#memberId").val();
	var memberPw = $("#memberPw").val();
	var saveIdCheck = $("#lb_idSave:checked").val();//TODO
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
			//show()/hide()
    		$(".modal").hide(); 
			$("#login-state").show();
			$("#logout-state").hide();
			}
		location.href ="${pageContext.request.contextPath}/main"
	},
	error:function(request,status,error){
		alert("code:"+request.status+"\n"+"message:"+request.responseText+
				"\n"+"error:"+error);
	}
	});
	//location.href="<%=request.getContextPath()%>
		/logins?userId="+userId;
		};

		// SNS 로그인(네이버, 카카오, 페이스북)

		/*네이버 로그인(JS로 하는 방법) // el태그 인식 못함
		 var naver_id_login = new naver_id_login("LV_HERZOVT4XTBBoYuEl", "http://127.0.0.1:8090/almin/main");
		 var state = naver_id_login.getUniqState();
		 naver_id_login.setButton("white", 2,40);
		 naver_id_login.setDomain("http://127.0.0.1:8090/");
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
				document.getElementById('status').innerHTML = 'Please log '
						+ 'into this webpage.';
			}
		}
		//로그아웃
		function logoutFB() {
			FB.logout(function(response) {
				// Person is now logged out
				console.log(response);
				FB.getLoginStatus(function(response) { // See the onlogin handler
					statusChangeCallback(response);
				});
			});

			//response.status === 'connected' 로그인상태
			//response.status === 'unknown' 로그아웃상태
		}
	</script>
</header>
<!-- Header Area End -->