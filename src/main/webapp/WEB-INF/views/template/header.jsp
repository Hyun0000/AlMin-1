<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- jstl은 header가 아닌 메인페이지에 삽입 -->
<!-- 공통헤더 템플릿입니다. css 작성금지 -->
<!-- 공통헤더 템플릿입니다. head 영역에 script 작성금지 -->
<script
	src="${pageContext.request.contextPath}/resources/assets/js/vendor/jquery-2.2.4.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/assets/js/vendor/bootstrap-4.1.3.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/assets/js/vendor/wow.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/assets/js/vendor/owl-carousel.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/assets/js/vendor/jquery.nice-select.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/assets/js/vendor/ion.rangeSlider.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>

<!-- Header Area Starts -->
<header class="header-area main-header">
		<div class="container">
			<div class="row">
				<div class="col-lg-2">
					<div class="logo-area">
						<a href="main"><img src="${pageContext.request.contextPath}/resources/assets/images/logo.png" class="logo" alt="logo"></a>
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
						<li><a href="#">아이디/비밀번호 찾기</a></li>
						<li><a href="#">마이페이지</a></li>
							<li class="menu-btn"><a href="${pageContext.request.contextPath}/logins" class="login">로그인</a> 
							<a href="${pageContext.request.contextPath}/logins" class="template-btn">회원가입</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
</header>
<!-- Header Area End -->