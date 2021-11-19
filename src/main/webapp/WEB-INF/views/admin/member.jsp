<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
	href="${pageContext.request.contextPath }/resources/assets/images/logo/favicon.png"
	type="image/x-icon">

<!-- CSS Files -->
<link rel="stylesheet" href="<c:url value="/resources/assets/css/almin.css"/>">

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

.d-toggle {
	display: none;
}

button {
	border: 0;
	outline: 0;
	background-color: transparent
}

.search-bg form {
	background: none;
	margin-bottom: 0;
	padding-bottom: 20px;
	padding-top: 10px;
}

.search-bg form .template-btn {
	background: #1FA5FD
}

.search-bg form input {
	margin-left: 10px;
	margin-right: 10px;
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
	<!-- 공통헤더 템플릿 -->

	<c:import url="/WEB-INF/views/template/header.jsp" />

	<!-- Header Area End -->


	<!-- Body Area Starts -->
	<section class="jobs-area section-padding3">
		<div class="container">

			<div class="topleft">
				<ul class="nav nav-tabs" id="myTab" role="tablist">
					<li class="nav-item"><h4>
							<a class="nav-link active" id="home-tab"
								href="${pageContext.request.contextPath }/admins" role="tab"
								aria-controls="home" aria-selected="true">회원조회</a>
						</h4></li>
					<li class="nav-item"><h4>
							<a class="nav-link" id="profile-tab"
								href="${pageContext.request.contextPath }/report" role="tab"
								aria-controls="profile" aria-selected="false">의심공고</a>
						</h4></li>
				</ul>
			</div>

			<div class="row">
				<div class="col-lg-12">
					<div class="jobs-tab tab-item">
						<ul class="nav nav-tabs" id="myTab" role="tablist">
							<li class="nav-item"><a class="nav-link" id="home-tab"
								data-toggle="tab" href="#member" role="tab" aria-controls="home"
								aria-selected="true">개인회원</a></li>
							<li class="nav-item"><a class="nav-link" id="profile-tab"
								data-toggle="tab" href="#company" role="tab"
								aria-controls="profile" aria-selected="false">기업회원</a></li>
						</ul>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-lg-12">
					<div class="tab-content" id="myTabContent">
						<div class="tab-pane fade show active" id="member" role="tabpanel"
							aria-labelledby="home-tab">
							<div class="single-job mb-4 d-lg-flex justify-content-between">
								<div class="job-text">
									<div class="search-area">
										<div class="search-bg">
											<div class="container">
												<div class="row">
													<div class="col-lg-12">
														<form
															action="${pageContext.request.contextPath}/admins/searchmem"
															method="post" class="d-md-flex" name="frmSearch">
															<select name="searchOption" required>
																<option value="member_id">아이디</option>
																<option value="member_name">이름</option>
															</select> <input name="searchWord" type="text" required> <input
																name="type" type="hidden" value="member"> <input
																type="submit" class="template-btn" value="검색">
														</form>
													</div>
												</div>
											</div>
										</div>
									</div>
									<c:forEach var="item" items="${memberview}">
										<div class="memberItem">
											<button onclick="myFunction(this)" class="mid">${item.memberId}</button>
											<div class="d-toggle">
												${item.memberName}${item.memberPhone} ${item.memberAddress}
												${item.memberBirth} ${item.memberEmail} ${item.memberGender}
												${item.memberAge} ${item.memberRegdate}
												<button class="genric-btn primary small deletemm">탈퇴</button>
											</div>
										</div>
									</c:forEach>
								</div>
							</div>
						</div>
						<div class="tab-pane fade" id="company" role="tabpanel"
							aria-labelledby="profile-tab">
							<div class="single-job mb-4 d-lg-flex justify-content-between">
								<div class="job-text">
									<div class="search-area">
										<div class="search-bg">
											<div class="container">
												<div class="row">
													<div class="col-lg-12">
														<form
															action="${pageContext.request.contextPath}/admins/searchcom"
															method="post" class="d-md-flex" name="frmSearch">
															<select name="searchOption" required>
																<option value="company_id">아이디</option>
																<option value="company_name">상호</option>
															</select> <input name="searchWord" type="text"
																onKeyUp="keywordSearch()" required>
															<div id="suggest">
																<div id="suggestList"></div>
															</div>
															<input type="submit" class="template-btn" value="검색">
														</form>
													</div>
												</div>
											</div>
										</div>
									</div>
									<c:forEach var="item" items="${companyview}">
										<div class="companyItem">
											<button onclick="myFunction(this)" class="cid">${item.companyId}</button>
											<div class="d-toggle">
												${item.companyName}${item.companyTel} ${item.companyBoss}
												${item.companyEmail} ${item.companyAddress}
												${item.companyNum}
												<button class="genric-btn primary small deletecm">탈퇴</button>
											</div>
										</div>
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
	<c:import url="/WEB-INF/views/template/footer.jsp" />
	<!-- Footer Area End -->


	<!-- Javascript -->
	<script>
		function myFunction(targetEle) {
			console.log(targetEle);
			var $togggleEle = $(targetEle).next();
			$togggleEle.toggle();
		}
	</script>
	<script>
		$(".deletemm").click(deletemm);
		$(".deletecm").click(deletecm);

		function deletemm() {
			var mid = $(this).parent().prev(".mid").text();
			var $itemEle = $(this).parents(".memberItem");
			if (confirm('정말 탈퇴처리하시겠습니까?')) {
				$.ajax({
					type : "post",
					url : "${pageContext.request.contextPath}/admins/demember",
					data : {
						memberId : mid
					},
					success : function(data) {
						if (data == "OK") {
							alert('회원이 탈퇴처리되었습니다.');
							$itemEle.remove();
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
			var cid = $(this).parent().prev(".cid").text();
			var $itemEle = $(this).parents(".companyItem");
			if (confirm('정말 탈퇴처리하시겠습니까?')) {
				$
						.ajax({
							type : "post",
							url : "${pageContext.request.contextPath}/admins/decompany",
							data : {
								companyId : cid
							},
							success : function(data) {
								if (data == "OK") {
									alert('회원이 탈퇴처리되었습니다.');
									$itemEle.remove();
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
