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
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">

<title>우리가 어떤 민족입니까?알바의 민족 이력서 조회</title>
<!-- Favicon -->
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/resources/assets/images/logo/favicon.png"
	type="image/x-icon">

<!-- CSS Files -->
<link rel="stylesheet"
	href="<c:url value="/resources/assets/css/almin.css"/>">
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
<header>
<c:import url="/WEB-INF/views/template/header.jsp" />
</header>
<section>
	<h1>My이력서</h1>
    <div class="row">
        <div class="col-lg-12">
            <div class="tab-content">
                <div class="tab-pane fade show active" role="tabpanel"
                    aria-labelledby="home-tab">
                    <div class="single-job mb-4 d-lg-flex justify-content-between">
                        <div class="job-text">
                            <c:forEach var="item" items="${allResume}">
                            	<c:if test="${item.resumeTitle==null}">
                            		<div class="rt">등록한 이력서가 없습니다.</div>
                            	</c:if>
                                <div class="reportItem">
                                    <div class="d-toggle">
                                        <div class="rt"><a href="${pageContext.request.contextPath}/resumes/resume?resumeNo=${item.resumeNo }">${item.resumeTitle }</a></div>
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
</body>
</html>