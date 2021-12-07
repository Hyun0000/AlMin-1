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
							</select> <input type="text" name=recruitJobWho value=100
								style="display: none" /> <input type="text"
								name=recruitJobBranch value="X" style="display: none" /> <input
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
						<h4>알바 캘린더</h4>
						<p class="py-3">
							간편 알바 일정 확인도 알바의 민족!<br>한눈에 보는 나의 알바 달력~
						</p>
						<a href="#" class="secondary-btn">둘러보기<span
							class="flaticon-next"></span></a>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="single-feature mb-4 mb-lg-0">
						<h4>이력서 등록</h4>
						<p class="py-3">
							일거리를 찾는 알바의 민족이라면?<br>이력서 등록하고 간편 지원하자!
						</p>
						<a href="#" class="secondary-btn">등록하기<span
							class="flaticon-next"></span></a>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="single-feature">
						<h4>공고 등록</h4>
						<p class="py-3">
							가족을 찾는 구인의 민족이라면?<br>공고 등록하고 쉽게 구인하자!
						</p>
						<a href="#" class="secondary-btn">등록하기<span
							class="flaticon-next"></span></a>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Feature Area End -->

	<!-- Category Area Starts -->
	<section class="category-area section-padding">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section-top text-center">
						<h2>직종별로 보는 알바</h2>
						<p>어떤 일을 해볼까요?하나씩 구경해보세요!</p>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-3 col-md-6"
					onclick="location.href='${pageContext.request.contextPath}/recruits?recruitJobType=8&recruitJobDistrict=100&recruitJobWho=100&recruitJobBranch=X&searchKeyword='">
					<div class="single-category text-center mb-4">
						<img
							src="${pageContext.request.contextPath}/resources/assets/images/cat1.png"
							alt="IT/미디어">
						<h4>IT/미디어</h4>
						<h5>${countCat.CEight}개 구인공고</h5>
					</div>
				</div>
				<div class="col-lg-3 col-md-6"
					onclick="location.href='${pageContext.request.contextPath}/recruits?recruitJobType=11&recruitJobDistrict=100&recruitJobWho=100&recruitJobBranch=X&searchKeyword='">
					<div class="single-category text-center mb-4">
						<img
							src="${pageContext.request.contextPath}/resources/assets/images/cat2.png"
							alt="배달/운전">
						<h4>배달/운전</h4>
						<h5>${countCat.CEleven}개 구인공고</h5>
					</div>
				</div>
				<div class="col-lg-3 col-md-6"
					onclick="location.href='${pageContext.request.contextPath}/recruits?recruitJobType=6&recruitJobDistrict=100&recruitJobWho=100&recruitJobBranch=X&searchKeyword='">
					<div class="single-category text-center mb-4">
						<img
							src="${pageContext.request.contextPath}/resources/assets/images/cat3.png"
							alt="고객상담">
						<h4>고객상담</h4>
						<h5>${countCat.CSix}개 구인공고</h5>
					</div>
				</div>
				<div class="col-lg-3 col-md-6"
					onclick="location.href='${pageContext.request.contextPath}/recruits?recruitJobType=7&recruitJobDistrict=100&recruitJobWho=100&recruitJobBranch=X&searchKeyword='">
					<div class="single-category text-center mb-4">
						<img
							src="${pageContext.request.contextPath}/resources/assets/images/cat4.png"
							alt="생산/건설/인력">
						<h4>생산/건설/인력</h4>
						<h5>${countCat.CSeven}개 구인공고</h5>
					</div>
				</div>
				<div class="col-lg-3 col-md-6"
					onclick="location.href='${pageContext.request.contextPath}/recruits?recruitJobType=4&recruitJobDistrict=100&recruitJobWho=100&recruitJobBranch=X&searchKeyword='">
					<div class="single-category text-center mb-4 mb-lg-0">
						<img
							src="${pageContext.request.contextPath}/resources/assets/images/cat5.png"
							alt="서비스">
						<h4>서비스</h4>
						<h5>${countCat.CFour}개 구인공고</h5>
					</div>
				</div>
				<div class="col-lg-3 col-md-6"
					onclick="location.href='${pageContext.request.contextPath}/recruits?recruitJobType=9&recruitJobDistrict=100&recruitJobWho=100&recruitJobBranch=X&searchKeyword='">
					<div class="single-category text-center mb-4 mb-lg-0">
						<img
							src="${pageContext.request.contextPath}/resources/assets/images/cat6.png"
							alt="교육/강사/학원">
						<h4>교육/강사/학원</h4>
						<h5>${countCat.CNine}개 구인공고</h5>
					</div>
				</div>
				<div class="col-lg-3 col-md-6"
					onclick="location.href='${pageContext.request.contextPath}/recruits?recruitJobType=10&recruitJobDistrict=100&recruitJobWho=100&recruitJobBranch=X&searchKeyword='">
					<div class="single-category text-center mb-4 mb-md-0">
						<img
							src="${pageContext.request.contextPath}/resources/assets/images/cat7.png"
							alt="디자인">
						<h4>디자인</h4>
						<h5>${countCat.CTen}개 구인공고</h5>
					</div>
				</div>
				<div class="col-lg-3 col-md-6"
					onclick="location.href='${pageContext.request.contextPath}/recruits?recruitJobType=12&recruitJobDistrict=100&recruitJobWho=100&recruitJobBranch=X&searchKeyword='">
					<div class="single-category text-center">
						<img
							src="${pageContext.request.contextPath}/resources/assets/images/cat8.png"
							alt="병원/간호">
						<h4>병원/간호</h4>
						<h5>${countCat.CTwelve}개 구인공고</h5>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Category Area End -->

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
									<c:forEach var="item" begin="0" end="0" items="${recruits}">
										<h4>${item.recruitTitle}</h4>
										<ul class="mt-4">
											<li><h5>
													<i class="fa fa-clock-o"></i>${item.recruitDate}
												</h5></li>
										</ul>
									</c:forEach>
								</div>
								<div class="job-img align-self-center">
									<%-- 									<img
										src="${pageContext.request.contextPath}/resources/assets/images/job1.jpg"
										alt="job"> --%>
								</div>
								<div class="job-btn align-self-center">
									<c:forEach var="item" begin="0" end="0" items="${recruits}">
										<a href="${pageContext.request.contextPath}/recruits/detailjobinfo?recruitNo=${item.recruitNo}"
											class="third-btn job-btn1">상세보기</a>
									</c:forEach>
								</div>
							</div>
						</div>
						<div class="tab-pane fade" id="full-time" role="tabpanel"
							aria-labelledby="profile-tab">
							<div class="single-job mb-4 d-lg-flex justify-content-between">
								<div class="job-text">
									<c:forEach var="item" begin="0" end="0" items="${applicants}">
										<h4>${item.resumeTitle}</h4>
										<ul class="mt-4">
											<li><h5>
													<i class="fa fa-clock-o"></i>${item.memberId}
												</h5></li>
										</ul>
									</c:forEach>
								</div>
								<div class="job-img align-self-center">
									<%-- 									<img
										src="${pageContext.request.contextPath}/resources/assets/images/job2.jpg"
										alt="job"> --%>
								</div>
								<div class="job-btn align-self-center">
									<c:forEach var="item" begin="0" end="0" items="${applicants}">
										<a href="${pageContext.request.contextPath}/resumes/resume?resumeNo=${item.resumeNo}"
											class="third-btn job-btn2">상세보기</a>
									</c:forEach>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="more-job-btn mt-5 text-center">
				<a href="${pageContext.request.contextPath}/recruits"
					class="template-btn">더 알아보기</a>
			</div>
		</div>
	</section>
	<!-- Jobs Area End -->

	<!-- 공통푸터 템플릿 -->
	<c:import url="/WEB-INF/views/template/footer.jsp" />
	<script>
		function search() {
			$("#searchRecruit").attr("action",
					"${pageContext.request.contextPath }/recruits").attr(
					"method", "get").submit();
		}
	</script>
</body>
</html>