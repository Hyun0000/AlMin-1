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
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- Favicon -->
<link rel="shortcut icon"
	href="${pageContext.request.contextPath }/resources/assets/images/logo/favicon.png"
	type="image/x-icon">

<!-- CSS Files -->
<link rel="stylesheet"
	href="<c:url value="/resources/assets/css/almin.css"/>">

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
</style>

</head>
<body>
	<!-- Preloader Starts -->
	<div class="preloader">
		<div class="spinner"></div>
	</div>
	<!-- Preloader End -->

	<c:import url="/WEB-INF/views/template/header.jsp" />

	<!-- Body Area Starts -->
	<section class="jobs-area section-padding3">
		<div class="container">

			<div class="topleft">
				<ul class="nav nav-tabs" id="myTab" role="tablist">
					<li class="nav-item"><h4>
							<a class="nav-link" id="home-tab"
								href="${pageContext.request.contextPath }/admins" role="tab"
								aria-controls="home" aria-selected="true">회원조회</a>
						</h4></li>
					<li class="nav-item"><h4>
							<a class="nav-link active" id="profile-tab"
								href="${pageContext.request.contextPath }/report" role="tab"
								aria-controls="profile" aria-selected="false">의심공고</a>
						</h4></li>
				</ul>
			</div>


			<div class="row">
				<div class="col-lg-12">
					<div class="tab-content" id="myTabContent">
						<div class="tab-pane fade show active" id="recent" role="tabpanel"
							aria-labelledby="home-tab">
							<div class="single-job mb-4 d-lg-flex justify-content-between">
								<div class="job-text">
									<c:forEach var="item" items="${reportview}">
										<div class="reportItem">
											<button onclick="myFunction(this)">${item.recruitCompanyId}</button>
											<div class="d-toggle">
												<div style="display: none" class="rt">${item.recruitNo}</div>
												<div>${item.recruitTitle}${item.recruitDate}</div>
												<button class="genric-btn primary small" onclick="">공고보기</button>
												<button class="genric-btn primary small deletert">삭제</button>
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
	<footer>
		<c:import url="/WEB-INF/views/template/footer.jsp" />
	</footer>
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
		$(".deletert").click(deletert);

		function deletert() {
			var rt = $(this).prevAll(".rt").text();
			var $itemEle = $(this).parents(".reportItem");
			if (confirm('정말 삭제하시겠습니까?')) {
				$.ajax({
					type : "post",
					url : "${pageContext.request.contextPath}/report/dereport",
					data : {
						rtno : rt
					},
					success : function(data) {
						if (data == "OK") {
							alert('공고가 삭제되었습니다.');
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
