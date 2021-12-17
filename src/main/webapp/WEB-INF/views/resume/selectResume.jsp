<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon"
	href="${pageContext.request.contextPath }/resources/assets/images/logo/favicon.png"
	type="image/x-icon">
<link rel="stylesheet"
	href="<c:url value="/resources/assets/css/almin.css"/>">
<title>상세 이력서 조회</title>
<style>
.section-padding {
	padding-bottom: 100px;
}
</style>
</head>
<body>
	<header>
		<c:import url="/WEB-INF/views/template/header.jsp" />
	</header>

	<section class="job-single-content section-padding">
		<div class="container">
			<div class="row">
				<div class="col-lg-8">
					<div class="main-content">
						<div class="single-content2 py-4">
							<h3>${resum.resumeTitle }</h3>
							<img id="myimg" src="data:image/jpg;base64,+data.image+"
								width="95px" height="128px" />
						</div>
						<div class="single-content4 py-4">
							<h4>이력서</h4>
							<table>
								<tr>
									<td>연락처 :&nbsp;</td>
									<td>${resum.resumePhone }</td>
								</tr>
								<tr>
									<td>지역 :&nbsp;</td>
									<td>${resum.district.jobDistrictName }</td>
								</tr>
								<tr>
									<td>경력 :&nbsp;</td>
									<td>${resum.jobType.jobTypeName }${resum.period.periodType }
										${resum.jobCareers }</td>
								</tr>
							</table>
						</div>
					</div>
					<button class="template-btn" onclick="history.back();">확인</button>
					<button class="template-btn"
						onclick="location.href='${pageContext.request.contextPath}/resumes/deleteResume?resumeNo=${resum.resumeNo}'">삭제</button>
					<button class="template-btn"
						onclick="location.href='${pageContext.request.contextPath}/resumes/update?resumeNo=${resum.resumeNo}'">수정</button>
					<button class="template-btn like-btn" onclick="doLike(this);">
					</button>
					<button id="print" class="template-btn" onclick="window.print()">인쇄하기</button>
				</div>
			</div>
		</div>
	</section>

	<footer>
		<c:import url="/WEB-INF/views/template/footer.jsp" />
	</footer>

	<script>
	$(document).ready(function isLiked() {
			$.ajax({
				url : '${pageContext.request.contextPath}/applicants/isliked',
				type : 'post',
				data : {
					resumeNo : '${resum.resumeNo}'
				},
				success : function(data) {
					console.log(data);
					if (data == "1") {
						$(".template-btn.like-btn").text("찜해제");
					} else {
						$(".template-btn.like-btn").text("찜하기");
					}
				},
				error : function() {
					alert('오류 발생. 오류 코드: ' + error.code);
				}
			});
	});
		function doLike(e) {
			$.ajax({
				url : '${pageContext.request.contextPath}/applicants/like',
				type : 'post',
				data : {
					resumeNo : '${resum.resumeNo}'
				},
				success : function(data) {
					console.log(data);
					if (data == "1") {
						$(".template-btn.like-btn").text("찜하기");
					} else {
						// 0: 찜 등록완료, 1. 찜 해제완료
						$(".template-btn.like-btn").text("찜해제");
					}
				},
				error : function() {
					alert('오류 발생. 오류 코드: ' + error.code);
				}
			});
		}
	</script>
</body>