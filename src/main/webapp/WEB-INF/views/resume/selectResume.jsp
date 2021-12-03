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
		<img id="myimg" src="data:image/jpg;base64,+data.image+" width="95px" height="128px"/>
		</div>
		<strong>핸드폰 번호</strong>
		${resum.resumePhone }
		</div>
		<hr>
		<h2>이력서 제목</h2>
		${resum.resumeTitle }
		<hr>
		<h2>지역</h2>
		<div>
		${resum.jobDistrictNo }
		</div>
		<hr>
		<h2>경력</h2>
		<div>
		${resum.jobTypeNo } ${resum.periodNo } ${resum.jobCareers }
		</div>
		<button onclick="history.back();">확인</button>
	</section>

	<footer>
		<c:import url="/WEB-INF/views/template/footer.jsp" />
	</footer>
	
	<script>
	
	</script>
</body>