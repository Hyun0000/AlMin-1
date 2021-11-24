<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="shortcut icon"
	href="${pageContext.request.contextPath }/resources/assets/images/logo/favicon.png"
	type="image/x-icon">
<link rel="stylesheet"
	href="<c:url value="/resources/assets/css/almin.css"/>">
<title>우리가 어떤 민족입니까?알바의 민족</title>

<style>
.nice-select span.current {
	line-height: 0;
}

.job-text {
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

.tab {
	color: #1FA5FD;
}
</style>
</head>
<body>
	<header>
		<c:import url="/WEB-INF/views/template/header.jsp" />
	</header>

	<!-- Job Single Content Starts -->
	<section class="job-single-content section-padding">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="jobs-tab tab-item">
						<h4 class="tab">공고목록</h4>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-8">

					<c:if test="${empty recruits}">
						<div class="more-job-btn mt-5 text-center">
							<input type="button" class="template-btn" onclick="search()"
								id="btnshow" value="목록으로 돌아가기">
						</div>
					</c:if>

					<c:forEach var="item" items="${recruits}">
						<div class="main-content">
							<div class="single-content1">
								<div class="single-job mb-4 d-lg-flex justify-content-between">
									<div class="job-text">
										<h4>${item.recruitTitle}</h4>
										<p>${item.recruitContent}</p>
										<p>${item.recruitDate}</p>
										<ul class="mt-4">
											<li class="mb-3"><h5>
													<i class="fa fa-map-marker"></i>
												</h5></li>
										</ul>
										<button class="genric-btn primary small"
											onclick="${pageContext.request.contextPath }//recruits/detailjobinfo">상세보기</button>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>

				</div>
				<div class="col-lg-4">
					<form id="searchRecruit">
						<div class="sidebar mt-5 mt-lg-0">
							<div class="single-item mb-4">
								<h4 class="mb-4">지역</h4>
								<div class="default-select">
									<select name="recruitJobDistrict">
										<option value="17">무관</option>
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
										<option value="18">서울</option>
									</select>
								</div>
							</div>
							<div class="single-item mb-4">
								<h4 class="mb-4">업종</h4>
								<div class="default-select">
									<select name="recruitJobType">
										<option value="0">무관</option>
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
									</select>
								</div>
							</div>
							<div class="single-item mb-4">
								<h4 class="mb-4">대상</h4>
								<div class="default-select">
									<select name="recruitJobWho">
										<option value="0">무관</option>
										<option value="1">청소년</option>
										<option value="2">대학생</option>
										<option value="3">중장년</option>
										<option value="4">장애인</option>
										<option value="5">주부</option>
										<option value="6">외국인 가능</option>
										<option value="7">초보 가능</option>
										<option value="8">재택 가능</option>
									</select>
								</div>
							</div>
							<div class="more-job-btn mt-5 text-center">
								<input type="button" class="template-btn" onclick="search()"
									id="btnSearch" value="검색" />
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>
	<!-- Job Single Content End -->

	<footer>
		<c:import url="/WEB-INF/views/template/footer.jsp" />
	</footer>

	<script>
	function search(){
		$("#searchRecruit").attr("action","${pageContext.request.contextPath }/recruits").attr("method","get").submit();
	}
	</script>
	<c:if test="${!empty msg}">
		<script>
			alert("${msg}");
			<c:remove var="msg"/>
		</script>
	</c:if>

</body>
</html>