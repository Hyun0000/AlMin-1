<!-- 웹폰트: Noto Sans Korean -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400&display=swap"
	rel="stylesheet">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>알바의 민족 구인공고리스트</title>
<!-- Favicon -->
<link rel="shortcut icon"
	href="${pageContext.request.contextPath }/resources/assets/images/logo/favicon.png" type="image/x-icon">

<!-- CSS Files -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/css/animate-3.7.0.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/assets/css/font-awesome-4.7.0.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/assets/fonts/flat-icon/flaticon.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/assets/css/bootstrap-4.1.3.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/css/owl-carousel.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/css/nice-select.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/css/style.css">
<style>
table{
	width:1000px;
	 margin-left:auto; 
    margin-right:auto;
}
table, tr, td {
	
	border: 1px solid black;
	border-collapse: collapse;
	text-align:center;
	}
</style>
</head>
<body>
<!-- 공통헤더 템플릿 -->
<header>
<c:import url="/WEB-INF/views/template/header.jsp"/>
	<!-- Header Area End -->
	</header>
	<section>
		<table>
			<tr>
				<td>지역</td>
				<td>제목</td>
				<td>시급</td>
				<td>등록일</td>
			</tr>
			<c:forEach var="item" items="${jobinfolist }">
				<tr>
				<!-- item.jobDistrictName -->
				
					<td>${item.district.jobDistrictName }</td>        
					
					<c:url value="/recruits/detailjobinfo" var="jobinfo">
					<c:param name="resultTitle" value="${item.recruitTitle }"></c:param>
					</c:url>
					<td><a href="${jobinfo }">${item.recruitTitle }</a></td>

					<td>${item.recruitMoney }</td>

					<td>${item.recruitDate }</td>


				</tr>
			</c:forEach>
		</table>
	
	</section>

	<footer>
	<!-- Footer Area Starts -->
	<c:import url="/WEB-INF/views/template/footer.jsp"/>
	</footer>
	<!-- Footer Area End -->
</body>
</html>