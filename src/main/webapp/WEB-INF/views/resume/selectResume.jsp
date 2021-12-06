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
	<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<title>상세 이력서 조회</title>
<style type="text/css">
	#updateResume{
	margin-left:300px;
	}
	.resumbtn{
	width:100px;
	color:gray;
	}
	section{
		margin-left:300px;
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
		<%-- ${resum.district.districtName }--%>
		</div>
		<hr>
		<h2>경력</h2>
		<div>
		${resum.jobType.jobTypeName } ${resum.period.periodType } ${resum.jobCareers }
		</div>
		<br>
		<div>
		<button id="updateResume" class="resumbtn">수정</button>
		<button id="deleteResume" class="resumbtn" onclick="location.href='${pageContext.request.contextPath}/resumes/deleteResume?resumeNo=${resum.resumeNo}'">삭제</button>
		<button class="resumbtn" onclick="history.back();">확인</button>
		</div>
	</section>

	<footer>
		<c:import url="/WEB-INF/views/template/footer.jsp" />
	</footer>
	
	<script>
	
	</script>
</body>