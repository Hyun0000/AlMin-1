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
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<title>우리가 어떤 민족입니까?알바의 민족 이력서 조회</title>
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
<header>
<c:import url="/WEB-INF/views/template/header.jsp" />
</header>
<section>
	<c:if test="${!empty msg}">
		<script>
			alert("${msg}");
			<c:remove var="msg"/>
		</script>
		</c:if>
		
	<h1>My이력서</h1>
		<hr>
    <div class="container">
			<div class="row">

				<div class="col-lg-8 post-list blog-post-list">
					<div class="single-post">

						<!-- Start comment-sec Area -->
						<section class="comment-sec-area py-5">
							
									<c:forEach var="item" items="${allResume}">
									<c:if test="${item.resumeTitle==null}">
										<div class="container">
										<div class="row flex-colum"><h5>회원님의 이력서가 없습니다.<br>다양한 회원님만의 이력서를 등록해주세요.</h5></div>
										</div>
										</c:if>
										<div class="container">
											<div class="row flex-column">

												<div class="comment-list">
													<div class="single-comment justify-content-between d-flex">
														<div class="user justify-content-between d-flex">
															<div class="thumb"></div>
															<div class="desc">
																<h5>
																	<a
																		href="${pageContext.request.contextPath}/resumes/resume?resumeNo=${item.resumeNo }">${item.resumeTitle }</a>
																</h5>
																<p class="rno" style="display: none">${item.resumeNo}</p>
																<p class="date">${item.resumeDate}</p>
																<div class="reply-btn">
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
								class="justify-content-between align-items-center d-flex "><span
										class="active">맞춤공고</span>
							</a></li>
							<li><a
								href="${pageContext.request.contextPath}/recruits/myrecruits"
								class="justify-content-between align-items-center d-flex ">관심공고
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
    <footer class="footer-area section-padding">
		<div class="footer-widget">
			<div class="container"></div>
		</div>
		<div class="footer-copyright">
			<div class="container">
				<div class="row">
					<div class="col-lg-8 col-md-6">
						<span> <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
							Copyright &copy;<script>
								document.write(new Date().getFullYear());
							</script> All rights reserved | This template is made with <i
							class="fa fa-heart-o" aria-hidden="true"></i> by <a
							href="https://colorlib.com" target="_blank">Colorlib</a> <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						</span>
					</div>
				</div>
			</div>
		</div>
	</footer>
	
	<script>
	
	</script>
</body>
</html>