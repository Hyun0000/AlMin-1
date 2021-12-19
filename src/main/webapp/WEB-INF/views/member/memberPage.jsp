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
<title>찜한공고</title>
<!-- Favicon -->
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/resources/assets/images/logo/favicon.png"
	type="image/x-icon">


<!-- CSS Files -->
<link rel="stylesheet"
	href="<c:url value="/resources/assets/css/almin.css"/>">
<style>
.active {
	color: #1fa5fd;
}
</style>
</head>
<body>
	<c:import url="/WEB-INF/views/template/header.jsp" />

	<!-- Start blog-posts Area -->
	<section class="blog-posts-area section-padding">
		<div class="container">
			<div class="row">

				<div class="col-lg-8 post-list blog-post-list">
					<div class="single-post">

						<!-- Start comment-sec Area -->
						<section class="comment-sec-area py-5">
							<c:forEach var="item" items="${recruits}">
								<div class="container">
									<div class="row flex-column">

										<div class="comment-list">
											<div class="single-comment justify-content-between d-flex">
												<div class="user justify-content-between d-flex">
													<div class="thumb"></div>
													<div class="desc">
														<h5>
															<a
																href="${pageContext.request.contextPath}/recruits/detailjobinfo?recruitNo=${item.recruitNo}">${item.recruitTitle}</a>
														</h5>
														<p class="rno" style="display: none">${item.recruitNo}</p>
														<p class="date">${item.recruitDate}</p>
														<div class="reply-btn">
														<button type="button" class="genric-btn success-border"
																onclick="location.href='${pageContext.request.contextPath}/recruits/dislike?recruitNo=${item.recruitNo}'">
																찜 해제</button>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
						</section>
						<!-- End comment-sec Area -->

					</div>
				</div>
				<div class="col-lg-4 sidebar mt-5 mt-lg-0">
					<div class="single-widget category-widget">
						<h4 class="title">마이페이지</h4>
						<ul>
							<li><a
								href="${pageContext.request.contextPath}/members/mypage"
								class="justify-content-between align-items-center d-flex">회원정보</a></li>
							<li><a
								href="${pageContext.request.contextPath}/recruits/appforyou"
								class="justify-content-between align-items-center d-flex ">맞춤공고
							</a></li>
							<li><a
								href="${pageContext.request.contextPath}/recruits/myrecruits"
								class="justify-content-between align-items-center d-flex "><span
										class="active">관심공고</span>
							</a></li>
							<li><a
								href="${pageContext.request.contextPath}/resumes/allres"
								class="justify-content-between align-items-center d-flex">이력서
										관리</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- End blog-posts Area -->
	<c:import url="/WEB-INF/views/template/footer.jsp" />
</body>
</html>