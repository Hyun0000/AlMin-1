<!-- 웹폰트: Noto Sans Korean -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400&display=swap"
	rel="stylesheet">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">

<!-- Page Title -->
<title>우리가 어떤 민족입니까?알바의 민족</title>

<!-- Favicon -->
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/resources/assets/images/logo/favicon.png"
	type="image/x-icon">

<!-- CSS Files -->
<link rel="stylesheet"
	href="<c:url value="/resources/assets/css/almin.css"/>">

<style>
.search-bg {
	z-index: 100;
}

#logout-state {
	z-index: 200;
}

</style>

</head>
<body>
	<!-- Preloader Starts -->
	<div class="preloader">
		<div class="spinner"></div>
	</div>
	<!-- Preloader End -->

	<!-- 공통헤더 템플릿 -->
	<c:import url="/WEB-INF/views/template/header.jsp" />

	<!-- Search Area Starts -->
	<div class="search-area">
		<div class="search-bg">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<form id="searchRecruit" class="d-md-flex justify-content-between">
							<select name="recruitJobType">
								<option value="100" selected>직종선택</option>
								<option value="100">무관</option>
								<option value="1">외식/음료</option>
								<option value="2">유통/판매</option>
								<option value="3">문화/여가</option>
								<option value="4">서비스</option>
								<option value="5">사무/회계</option>
								<option value="6">고객상담</option>
								<option value="7">생산/건설/인력</option>
								<option value="8">IT/미디어</option>
								<option value="9">교육/강사/학원</option>
								<option value="10">디자인</option>
								<option value="11">배달/운전</option>
								<option value="12">병원/간호</option>
							</select> <select name="recruitJobDistrict">
								<option value="100" selected>지역선택</option>
								<option value="100">무관</option>
								<option value="18">서울</option>
								<option value="1">경기</option>
								<option value="2">인천</option>
								<option value="3">대전</option>
								<option value="4">대구</option>
								<option value="5">부산</option>
								<option value="6">울산</option>
								<option value="7">광주</option>
								<option value="8">강원</option>
								<option value="9">세종</option>
								<option value="10">충북</option>
								<option value="11">충남</option>
								<option value="12">경북</option>
								<option value="13">경남</option>
								<option value="14">전북</option>
								<option value="15">전남</option>
								<option value="16">제주</option>
								<option value="17">전국</option>
							</select> <input type="text" name=recruitJobWho value=100 hidden /> <input
								type="text" placeholder="키워드 검색" onfocus="this.placeholder = ''"
								onblur="this.placeholder = '키워드 검색'" name="searchKeyword">
							<button class="template-btn" onclick="search()">찾아보기</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Search Area End -->

	<!-- Feature Area Starts -->
	<section class="feature-area section-padding2">
		<div class="container">
			<div class="row">
				<div class="col-lg-4">
					<div class="single-feature mb-4 mb-lg-0">
						<h4>직종별 알바</h4>
						<p class="py-3">외식업부터 서비스업까지, 원하는 직종별로 찾아보는 알바의 민족</p>
						<a href="#" class="secondary-btn">둘러보기<span
							class="flaticon-next"></span></a>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="single-feature mb-4 mb-lg-0">
						<h4>지역별 알바</h4>
						<p class="py-3">
							전국팔도 어디든!<br>지역별로 찾아보는 알바의 민족
						</p>
						<a href="#" class="secondary-btn">둘러보기<span
							class="flaticon-next"></span></a>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="single-feature">
						<h4>대상별 알바</h4>
						<p class="py-3">내가 누구든 간에~ 학생, 주부, 외국인도 찾아보는 알바의 민족</p>
						<a href="#" class="secondary-btn">둘러보기<span
							class="flaticon-next"></span></a>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Feature Area End -->

	<!-- Brand Area Starts-->
	<section class="section-padding">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section-top text-center">
						<h2>브랜드 알바</h2>
						<p>각종 프랜차이즈 알바도 찾아보는 알바의 민족</p>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="employee-slider owl-carousel">
						<div class="single-slide d-sm-flex">
							<div class="slide-img">
								<img
									src="${pageContext.request.contextPath}/resources/assets/images/brand/brand_Ediya.png"
									class="logo" alt="BR">
								<div class="hover-state">
									<div class="hover-text text-center">
										<h3>Ediya Coffee</h3>
										<h5>알바 찾아보기</h5>
									</div>
								</div>
							</div>
							<div class="slide-text align-self-center">
								<i class="fa fa-quote-left"></i>
								<p>이디야커피는 ‘의미 있는 작은 차이가 평범함과 특별함을 가르는 기준이 된다’고 생각합니다. 이디야의
									가족이 되어 여러분의 꿈을 키워보세요!</p>
							</div>
						</div>
						<div class="single-slide d-sm-flex">
							<div class="slide-img">
								<img
									src="${pageContext.request.contextPath}/resources/assets/images/brand/brand_Burgerking.png"
									class="logo" alt="Burgerking">
								<div class="hover-state">
									<div class="hover-text text-center">
										<h3>버거킹</h3>
										<h5>알바 찾아보기</h5>
									</div>
								</div>
							</div>
							<div class="slide-text align-self-center">
								<i class="fa fa-quote-left"></i>
								<p>세계 최대 QSR(Quick Service Restaurant) 브랜드 중 하나인 버거킹은 현재
									100개 이상의 국가에서 15,000개 이상의 매장을 운영하고 있습니다.</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Brand Area  End-->

	<!-- Category Area Starts -->
	<section class="category-area section-padding">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section-top text-center">
						<h2>지역별로 보는 알바</h2>
						<p>우리 집 주변에는 어떤 알바들이 있지?</p>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-3 col-md-6">
					<div class="single-category text-center mb-4">
						<img
							src="${pageContext.request.contextPath}/resources/assets/images/place_Seoul_200px.png"
							alt="경기/서울">
						<h4>경기/서울</h4>
						<h5>250개 구인공고</h5>
					</div>
				</div>
				<div class="col-lg-3 col-md-6">
					<div class="single-category text-center mb-4">
						<img
							src="${pageContext.request.contextPath}/resources/assets/images/place_Sea_200px.png"
							alt="강원도">
						<h4>강원도</h4>
						<h5>250개 구인공고</h5>
					</div>
				</div>
				<div class="col-lg-3 col-md-6">
					<div class="single-category text-center mb-4">
						<img
							src="${pageContext.request.contextPath}/resources/assets/images/place_apt_200px.png"
							alt="충청북도">
						<h4>충청북도</h4>
						<h5>250개 구인공고</h5>
					</div>
				</div>
				<div class="col-lg-3 col-md-6">
					<div class="single-category text-center mb-4">
						<img
							src="${pageContext.request.contextPath}/resources/assets/images/place_Taean_200px.png"
							alt="충청남도">
						<h4>충청남도</h4>
						<h5>250개 구인공고</h5>
					</div>
				</div>
				<div class="col-lg-3 col-md-6">
					<div class="single-category text-center mb-4 mb-lg-0">
						<img
							src="${pageContext.request.contextPath}/resources/assets/images/place_Andong_200px.png"
							alt="경상북도">
						<h4>경상북도</h4>
						<h5>250개 구인공고</h5>
					</div>
				</div>
				<div class="col-lg-3 col-md-6">
					<div class="single-category text-center mb-4 mb-lg-0">
						<img
							src="${pageContext.request.contextPath}/resources/assets/images/place_Geoje_200px.png"
							alt="경상남도">
						<h4>경상남도</h4>
						<h5>250개 구인공고</h5>
					</div>
				</div>
				<div class="col-lg-3 col-md-6">
					<div class="single-category text-center mb-4 mb-md-0">
						<img
							src="${pageContext.request.contextPath}/resources/assets/images/place_anywhere_200px.png"
							alt="전라북도">
						<h4>전라북도</h4>
						<h5>250개 구인공고</h5>
					</div>
				</div>
				<div class="col-lg-3 col-md-6">
					<div class="single-category text-center">
						<img
							src="${pageContext.request.contextPath}/resources/assets/images/place_Bosung_200px.png"
							alt="전라남도">
						<h4>전라남도</h4>
						<h5>250개 구인공고</h5>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Category Area End -->

	<!-- Jobs Area Starts -->
	<section class="jobs-area section-padding3">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="jobs-title">
						<h2>따끈따끈~방금 등록된 공고와 인재정보!</h2>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="jobs-tab tab-item">
						<ul class="nav nav-tabs" id="myTab" role="tablist">
							<li class="nav-item"><a class="nav-link active"
								id="home-tab" data-toggle="tab" href="#recent" role="tab"
								aria-controls="home" aria-selected="true">공고</a></li>
							<li class="nav-item"><a class="nav-link" id="profile-tab"
								data-toggle="tab" href="#full-time" role="tab"
								aria-controls="profile" aria-selected="false">인재정보</a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="tab-content" id="myTabContent">
						<div class="tab-pane fade show active" id="recent" role="tabpanel"
							aria-labelledby="home-tab">
							<div class="single-job mb-4 d-lg-flex justify-content-between">
								<div class="job-text">
									<h4>저희 집 바퀴벌레 잡아주실 분</h4>
									<ul class="mt-4">
										<li class="mb-3"><h5>
												<i class="fa fa-map-marker"></i> 서울 광진구
											</h5></li>
										<li class="mb-3"><h5>
												<i class="fa fa-pie-chart"></i> 경력자 우대/각종 약 제공/인센티브
											</h5></li>
										<li><h5>
												<i class="fa fa-clock-o"></i> 2021-11-15
											</h5></li>
									</ul>
								</div>
								<div class="job-img align-self-center">
									<img
										src="${pageContext.request.contextPath}/resources/assets/images/job1.jpg"
										alt="job">
								</div>
								<div class="job-btn align-self-center">
									<a href="#" class="third-btn job-btn1">지원하기</a>
								</div>
							</div>
						</div>
						<div class="tab-pane fade" id="full-time" role="tabpanel"
							aria-labelledby="profile-tab">
							<div class="single-job mb-4 d-lg-flex justify-content-between">
								<div class="job-text">
									<h4>밝고 눈치빠른 인재입니다.</h4>
									<ul class="mt-4">
										<li class="mb-3"><h5>
												<i class="fa fa-map-marker"></i> 서울 동작구
											</h5></li>
										<li class="mb-3"><h5>
												<i class="fa fa-pie-chart"></i> 알바 경력 다수/하버드대학교 재학중/25
											</h5></li>
										<li><h5>
												<i class="fa fa-clock-o"></i> 2021-11-14
											</h5></li>
									</ul>
								</div>
								<div class="job-img align-self-center">
									<img
										src="${pageContext.request.contextPath}/resources/assets/images/job2.jpg"
										alt="job">
								</div>
								<div class="job-btn align-self-center">
									<a href="#" class="third-btn job-btn2">채용하기</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="more-job-btn mt-5 text-center">
				<a href="#" class="template-btn">더 알아보기</a>
			</div>
		</div>
	</section>
	<!-- Jobs Area End -->

	<!-- 공통푸터 템플릿 -->
	<c:import url="/WEB-INF/views/template/footer.jsp" />
	<script>
		function showPopup() {
			var url = "logins";
			var name = "popup test";
			var option = "width = 500, height = 500, top = 100, left = 200, location = no"
			window.open(url, name, option);
		}

		function search() {
			$("#searchRecruit").attr("action",
					"${pageContext.request.contextPath }/recruits").attr(
					"method", "get").submit();
		}
	</script>
</body>
</html>