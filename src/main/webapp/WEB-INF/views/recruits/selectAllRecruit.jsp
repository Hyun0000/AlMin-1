<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="shortcut icon"
   href="${pageContext.request.contextPath }/resources/assets/images/logo/favicon.png"
   type="image/x-icon">
<link rel="stylesheet" href="<c:url value="/resources/assets/css/almin.css"/>">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<header>
		<c:import url="/WEB-INF/views/template/header.jsp" />
	</header>

	<section>
		<h1>My공고</h1>
		<div class="row">
			<div class="col-lg-12">
				<div class="tab-content">
					<div class="tab-pane fade show active" role="tabpanel"
						aria-labelledby="home-tab">
						<div class="single-job mb-4 d-lg-flex justify-content-between">
							<div class="job-text">
								<c:forEach var="item" items="${allRecruit}">
									<c:if test="${item.recruitTitle==null}">
										<div class="rt">등록한 이력서가 없습니다.</div>
									</c:if>
									<div class="reportItem">
										<div class="d-toggle">
											<div class="rt">
												<a
													href="${pageContext.request.contextPath}/recruits/recruit?recruitNo=${item.recruitNo }">${item.recruitTitle }</a>

											</div>
										</div>
									</div>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<footer>
		<c:import url="/WEB-INF/views/template/footer.jsp" />
	</footer>
</body>
</html>