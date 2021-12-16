<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 선택페이지</title>
<!-- Favicon -->
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/resources/assets/images/logo/favicon.png"
	type="image/x-icon">

<!-- CSS Files -->
<link rel="stylesheet"
	href="<c:url value='/resources/assets/css/almin.css'/>">
<link rel="stylesheet"
	href="<c:url value='/resources/assets/css/member.css'/>">

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
<%  String clientId = "LV_HERZOVT4XTBBoYuEl";//애플리케이션 클라이언트 아이디값";
    String redirectURI = URLEncoder.encode("http://127.0.0.1:8090/almin/main", "UTF-8");
    SecureRandom random = new SecureRandom();
    String state = new BigInteger(130, random).toString();
    String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
    apiURL += "&client_id=" + clientId;
    apiURL += "&redirect_uri=" + redirectURI;
    apiURL += "&state=" + state;
    session.setAttribute("state", state); %>
</head>
<script type="text/javascript">
		$(document).ready(function(){
			// 개인회원가입 페이지로 이동
			$("#memberJoin").on("click", function(){
				location.href = "${pageContext.request.contextPath}/members";
			});
			// 기업회원가입 페이지로 이동
			$("#companyJoin").on("click", function(){
				location.href = "${pageContext.request.contextPath}/companies";
			});
		});
</script>
<style>
.personal-member, .company-member {
	/* flex-direction와 flex-wrap의 단축 속성 */
	display: inline-flex;
	/* row, row-reverse, column, column-reverse 
	nowrap wrap wrap-reverse */
	flex-flow: column wrap;
	/* flex-start, flex-end, center, space-between, space-around */
	justify-content: flex-start;
	align-content: stretch;
	align-items: center;
	text-align: center;
	margin: 0 100px 0 0;
	width: 400px;
	height: 600px;
	border: 1px solid #BDBDBD;
}
</style>
<body>
	<!-- 공통헤더 템플릿 -->
	<c:import url="/WEB-INF/views/template/header.jsp" />
	<section class="feature-area section-padding2">
		<div class="container">
			<div class="row">
				<div class="col-lg-12" style="padding-top: 50px;">
					<div class="section-top text-center">
						<h2>알바의 민족 회원가입</h2>
						<p>전국 방방곡곡 알바를 모아모아!알바의 민족에 오신 것을 환영합니다.</p>
					</div>
				</div>
			</div>
			<div class="row" style="padding-bottom: 120px;">
				<div class="col-md-6">
					<div class="single-feature mb-4 mb-lg-0"
						style="text-align: center;">
						<h3 style="padding-bottom: 45px;">
							일자리를 찾는<br>알바의 민족이라면?
						</h3>
						<img
							src="${pageContext.request.contextPath}/resources/assets/images/regist_member.png"
							class="item btngroup" alt="개인회원 캐릭터">
						<div class="btngroup" style="padding-top: 15px;">
							<button class="template-btn" type="button" id="memberJoin"
								style="padding-top: 15px;">개인회원가입</button>
						</div>

					</div>
				</div>
				<div class="col-md-6">
					<div class="single-feature mb-4 mb-lg-0"
						style="text-align: center;">
						<h3 style="padding-bottom: 50px;">
							알바를 찾는<br>구인의 민족이라면?
						</h3>

						<img
							src="${pageContext.request.contextPath}/resources/assets/images/regist_company.png"
							class="item btngroup" alt="기업회원 캐릭터">
						<div class="btngroup">
							<button class="template-btn" type="button" id="companyJoin" style="background-color:#f8b600">기업회원가입</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- SNS 로그인
<div class="snsBx item">
			<ul>
			<li><a href="<%=apiURL%>"><img height="50" src="http://static.nid.naver.com/oauth/small_g_in.PNG"/></a></li>
			<li><button type="button" id="btnKaLogin" class="btn_kt" onclick="loginKakao()">
				<img src="${pageContext.request.contextPath}/resources/assets/images/kakao_login_medium_narrow.png"></button></li>
<fb:login-button scope="public_profile,email" onlogin="checkLoginState();"></fb:login-button>
			</ul>
</div>  -->
	<!-- 공통푸터 템플릿 -->
	<c:import url="/WEB-INF/views/template/footer.jsp" />
</body>
</html>