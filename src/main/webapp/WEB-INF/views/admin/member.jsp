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
	href="resources/assets/images/logo/favicon.png" type="image/x-icon">

<!-- CSS Files -->
<link rel="stylesheet" href="resources/assets/css/animate-3.7.0.css">
<link rel="stylesheet"
	href="resources/assets/css/font-awesome-4.7.0.min.css">
<link rel="stylesheet"
	href="resources/assets/fonts/flat-icon/flaticon.css">
<link rel="stylesheet"
	href="resources/assets/css/bootstrap-4.1.3.min.css">
<link rel="stylesheet" href="resources/assets/css/owl-carousel.min.css">
<link rel="stylesheet" href="resources/assets/css/nice-select.css">
<link rel="stylesheet" href="resources/assets/css/style.css">


<style>
.topleft>ul>li>h4 {
	padding-right: 20px;
	padding-bottom: 20px;
}

.jobs-area {
	min-height: 60%;
}

.job-text>p {
	margin-top: 10px;
	margin-bottom: 10px;
}
</style>

</head>
<body>
	<!-- Preloader Starts -->
	<div class="preloader">
		<div class="spinner"></div>
	</div>
	<!-- Preloader End -->

	<!-- Header Area Starts -->
	<header class="header-area main-header">
		<div class="container">
			<div class="row">
				<div class="col-lg-2">
					<div class="logo-area">
						<a href="main"><img src="resources/assets/images/logo.png"
							class="logo" alt="logo"></a>
					</div>
				</div>
				<div class="col-lg-10">
					<div class="custom-navbar">
						<span></span> <span></span> <span></span>
					</div>
					<div class="main-menu">
						<ul>
							<li class="active"><a href="#">구인공고</a></li>
							<li><a href="#">인재정보</a></li>
							<li><a href="#">아이디/비밀번호 찾기</a></li>
							<li><a href="#">마이페이지</a></li>

							<li class="menu-btn"><a href="#" class="login">로그인</a> <a
								href="#" class="template-btn">회원가입</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</header>
	<!-- Header Area End -->


	<!-- Body Area Starts -->
	<section class="jobs-area section-padding3">
		<div class="container">

			<div class="topleft">
				<ul class="nav nav-tabs" id="myTab" role="tablist">
					<li class="nav-item"><h4>
							<a class="nav-link active" id="home-tab" href="member" role="tab"
								aria-controls="home" aria-selected="true">회원조회</a>
						</h4></li>
					<li class="nav-item"><h4>
							<a class="nav-link" id="profile-tab" href="report" role="tab"
								aria-controls="profile" aria-selected="false">의심공고</a>
						</h4></li>
				</ul>
			</div>

			<div class="row">
				<div class="col-lg-12">
					<div class="jobs-tab tab-item">
						<ul class="nav nav-tabs" id="myTab" role="tablist">
							<li class="nav-item"><a class="nav-link" id="home-tab"
								data-toggle="tab" href="#recent" role="tab" aria-controls="home"
								aria-selected="true">개인회원</a></li>
							<li class="nav-item"><a class="nav-link" id="profile-tab"
								data-toggle="tab" href="#full-time" role="tab"
								aria-controls="profile" aria-selected="false">기업회원</a></li>
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
									<c:forEach var="item" items="${memberview}">
										<p>${item.memberId}${item.memberName}${item.memberPhone}
											${item.memberAddress} ${item.memberBirth} ${item.memberEmail}
											${item.memberGender} ${item.memberAge} ${item.memberRegdate}</p>
										<button class="genric-btn primary small" id="deletemm">탈퇴</button>
									</c:forEach>
								</div>
							</div>
						</div>
						<div class="tab-pane fade" id="full-time" role="tabpanel"
							aria-labelledby="profile-tab">
							<div class="single-job mb-4 d-lg-flex justify-content-between">
								<div class="job-text">
									<c:forEach var="item" items="${companyview}">
										<button onclick="myFunction('Demo1')"
											class="w3-button w3-block w3-left-align">${item.companyId}</button>
										<div id="Demo1" class="w3-container w3-hide">
											<p>{item.companyTel}${item.companyName}
												${item.companyBoss} ${item.companyEmail}
												${item.companyAddress} ${item.companyNum}</p>
										</div>
										<button class="genric-btn primary small" id="deletecm">탈퇴</button>
									</c:forEach>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
	</section>
	<!-- Body Area End -->


	<!-- Footer Area Starts -->
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
	<!-- Footer Area End -->


	<!-- Javascript -->
	<script src="resources/assets/js/vendor/jquery-2.2.4.min.js"></script>
	<script src="resources/assets/js/vendor/bootstrap-4.1.3.min.js"></script>
	<script src="resources/assets/js/vendor/wow.min.js"></script>
	<script src="resources/assets/js/vendor/owl-carousel.min.js"></script>
	<script src="resources/assets/js/vendor/jquery.nice-select.min.js"></script>
	<script src="resources/assets/js/vendor/ion.rangeSlider.js"></script>
	<script src="resources/assets/js/main.js"></script>
	<script>
		function myFunction(id) {
			var x = document.getElementById(id);
			if (x.className.indexOf("w3-show") == -1) {
				x.className += " w3-show";
			} else {
				x.className = x.className.replace(" w3-show", "");
			}
		}
	</script>
	<script>
		$("#deletemm").click(deletemm);
		$("#deletecm").click(deletecm);

			function deletemm() {
		if (confirm('정말 탈퇴처리하시겠습니까?')) {
				$.ajax({
					type : "post",
					url : "${contextPath}/member/deleteMember",
					data : {
						memberId : "${memberId}"
					},
					success : function(data) {
						if (data == "OK") {
							console.log("삭제 완료: " + "${memberId}");
							alert('회원이 탈퇴처리되었습니다.');
						}
					},
					error : function(error) {
						alert('오류 발생. 오류 코드: ' + error.code);
					}
				});
		} else {
			return false;
		}
			}

			function deletecm() {
		if (confirm('정말 탈퇴처리하시겠습니까?')) {
				$.ajax({
					type : "post",
					url : "${contextPath}/member/deleteCompany",
					data : {
						memberId : "${companyId}"
					},
					success : function(data) {
						if (data == "OK") {
							console.log("삭제 완료: " + "${companyId}");
							alert('회원이 탈퇴처리되었습니다.');
						}
					},
					error : function(error) {
						alert('오류 발생. 오류 코드: ' + error.code);
					}
				});

		} else {
				return false;
			}
		}
	</script>
</body>


</html>
