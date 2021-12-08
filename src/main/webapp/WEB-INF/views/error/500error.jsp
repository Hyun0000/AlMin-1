<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>500ERROR</title>
<link rel="shortcut icon"
	href="${pageContext.request.contextPath }/resources/assets/images/logo/favicon.png"
	type="image/x-icon">
<link rel="stylesheet"
	href="<c:url value="/resources/assets/css/almin.css"/>">
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style>
.error {
	text-align: center;
}

.img {
	width: 600px;
}
</style>
</head>
<body>
	<c:import url="/WEB-INF/views/template/header.jsp" />
	<div class="error">
		<a href="main"><img class="img"
			src="${pageContext.request.contextPath}/resources/assets/images/500error.png"></a>
	</div>
	<c:import url="/WEB-INF/views/template/footer.jsp" />
</body>
</html>