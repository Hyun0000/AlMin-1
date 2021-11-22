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
						<h4 class="tab">인재정보</h4>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-8">
					<c:forEach var="item" items="${applicants}">
						<div class="main-content">
							<div class="single-content1">
								<div class="single-job mb-4 d-lg-flex justify-content-between">
									<div class="job-text">
										<h4>${item.resumeTitle}</h4>${item.memberId}
										<ul class="mt-4">
											<li class="mb-3"><h5>
													<i class="fa fa-map-marker"></i>${item.resumeContent}
												</h5></li>
										</ul>
										<button class="genric-btn primary small"
											onclick="${pageContext.request.contextPath }//resumes/allres">상세보기</button>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>

				</div>
				<div class="col-lg-4">
					<div class="sidebar mt-5 mt-lg-0">
						<div class="single-item mb-4">
							<h4 class="mb-4">성별</h4>
							<div class="default-select">
								<select name="gender">
									<option value="0">무관</option>
									<option value="1">여</option>
									<option value="2">남</option>
								</select>
							</div>
						</div>
						<div class="single-item mb-4">
							<h4 class="mb-4">경력</h4>
							<div class="default-select">
								<select name="gender">
									<option value="0">무관</option>
									<option value="1">여</option>
									<option value="2">남</option>
								</select>
							</div>
						</div>
						<div class="single-item mb-4">
							<h4 class="mb-4">학력</h4>
							<div class="default-select">
								<select name="gender">
									<option value="0">무관</option>
									<option value="1">여</option>
									<option value="2">남</option>
								</select>
							</div>
						</div>
						<div class="single-item mb-4">
							<h4 class="mb-4">나이</h4>
							<div class="default-select">
								<select name="gender">
									<option value="0">무관</option>
									<option value="1">여</option>
									<option value="2">남</option>
								</select>
							</div>
						</div>
						<div class="more-job-btn mt-5 text-center">
							<a href="#" class="template-btn">검색</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Job Single Content End -->

	<footer>
		<c:import url="/WEB-INF/views/template/footer.jsp" />
	</footer>
</body>
</html>