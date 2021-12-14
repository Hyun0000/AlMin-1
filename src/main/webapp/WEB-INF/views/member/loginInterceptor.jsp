<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인이 필요한 페이지입니다.</title>
<!-- Favicon -->
<link rel="shortcut icon"
   href="${pageContext.request.contextPath }/resources/assets/images/logo/favicon.png"
   type="image/x-icon">
   <!-- CSS Files -->
<link rel="stylesheet" href="<c:url value='/resources/assets/css/almin.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/member/css/member.css'/>">
<style>
.box{
	flex-wrap: nowrap;
	justify-content: center;
}
#head {
	text-align: center;
	margin-bottom: 15px;
}

#login-btn {
	text-emphasis-color: gray;
	background-color: black;
}

#login-menu {
	text-align: center;
	margin-top: 10px;
}

#login-menu>ul {
	list-style-type: none;
	position: relative;
}

#login-menu li {
	display: inline-block;
}

/* 아이디 | 비밀번호 찾기 | 회원가입 */
#login-menu li::after {
	padding: 10px;
	content: "|";
}

#login-menu li:last-child::after {
    padding: 15px;
    content: "";
}
.form-group{
	text-align:center;
}
/* 10/18 추가 */
/* style inputs and link buttons */
input,
.btn {
  padding: 12px;
  border: none;
  border-radius: 4px;
  margin: 5px 0;
  opacity: 0.85;
  display: inline-block;
  font-size: 17px;
  line-height: 20px;
  text-decoration: none; /* remove underline from anchors */
}

input{
border: 2px solid #e7e7e7;
}

input:hover,
.btn:hover {
  opacity: 1;
}
/* add appropriate colors to fb, twitter and google buttons */
.fb {
  background-color: #3B5998;
  color: white;
}

.twitter {
  background-color: #55ACEE;
  color: white;
}

.google {
  background-color: #dd4b39;
  color: white;
}
#login {
        padding: 6px 32px;
        margin: 10px 2px;
        background-color: white;
        color: black;
        border: 2px solid #555555;
        cursor: pointer;
        }
#login:hover {
        background-color: #555555;
        color: white;
        }
</style>
<script>
$(document).ready(function(){
	$(".login").click();
});
</script>
</head>
<body>
<!-- 공통헤더 템플릿 -->
<c:import url="/WEB-INF/views/template/header.jsp"/>
<section>
<div class="box">
                <div class="container">
                            <form id= "log-box" method="post" action="login">
                                <h2 id="head">헤더에 있는 로그인 기능을 이용해주세요.</h2>

                                <div class="form-group">
                                    <input type="text" placeholder="아이디" name="user_id" maxlength="20"><br>
                                </div>
                                <div class="form-group">
                                    <input type="password" placeholder="비밀번호" name="user_pwd" maxlength="20"><br>
                                </div>
                                <div class="form-group">
                                <input type="submit" value="로그인" id="login">
                                <!-- 10/18 추가: 소셜로그인 -->
                                <div class="col">
                                    <a href="#" class="fb btn">
                                      <i class="fa fa-facebook fa-fw"></i> Login with Facebook
                                     </a>
                                    <a href="#" class="twitter btn">
                                      <i class="fa fa-twitter fa-fw"></i> Login with Twitter
                                    </a>
                                    <a href="#" class="google btn"><i class="fa fa-google fa-fw">
                                      </i> Login with Google+
                                    </a>
                                  </div>
                                </div>
                            </form>
                                <div id="login-menu">
                                    <ul>
                                        <li><a href="findId">아이디 찾기</a></li>
                                        <li><a href="findPwd">비밀번호 찾기</a></li>
                                        <li><a href="join">회원가입</a></li>
                                    </ul>
                                </div>
                           </div>
                </div>
</section>
	<!-- 공통푸터 템플릿 -->
<c:import url="/WEB-INF/views/template/footer.jsp"/>
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
		location.href ="${pageContext.request.contextPath}/main"
				
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
		
	</script>
</body>
</html>