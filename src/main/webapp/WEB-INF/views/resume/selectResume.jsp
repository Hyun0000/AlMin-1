<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<style type="text/css">
button {
	margin-left: 50%;
	width: 100px;
	color: gray;
}
  
section {
	margin-left: 300px;
}
</style>
</head>
<body>
	<header>
		<c:import url="/WEB-INF/views/template/header.jsp" />
	</header>

	<section>
		
		<h2>개인기본정보</h2>
		<div>
			<strong>사진</strong><br>
			<div>

				<!-- 사진 -->
				<img id="myimg" src="data:image/jpg;base64,+data.image+"
					width="95px" height="128px" />
			</div>
			<strong>핸드폰 번호</strong> ${resum.resumePhone }
		</div>
		<hr>
		<h2>이력서 제목</h2>
		${resum.resumeTitle }
		<hr>
		<h2>지역</h2>
		<div>
			 ${resum.district.jobDistrictName }
		</div>
		<hr>
		<h2>경력</h2>
		<div>${resum.jobType.jobTypeName }${resum.period.periodType }
			${resum.jobCareers }</div>
		<br>
		<button class="template-btn" onclick="history.back();">확인</button>
		<button class="template-btn" onclick="location.href='${pageContext.request.contextPath}/resumes/deleteResume?resumeNo=${resum.resumeNo}'">삭제</button>
		<button class="template-btn" onclick="location.href='${pageContext.request.contextPath}/resumes/update?resumeNo=${resum.resumeNo}'">수정</button>
		
		<button class="template-btn like-btn" onclick="doLike(this);">
			<c:choose>
				<c:when test="${like == null}">
					찜하기
				</c:when>
				<c:otherwise>
					찜해제
				</c:otherwise>
			</c:choose>
		</button>

	</section>

	<footer>
		<c:import url="/WEB-INF/views/template/footer.jsp" />
	</footer>

	<script>
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