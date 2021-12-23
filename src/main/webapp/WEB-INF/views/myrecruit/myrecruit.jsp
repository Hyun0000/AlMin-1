<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400&display=swap">
<link rel="stylesheet" href="<c:url value="/resources/myrecruit/css/myrecruit.css"/>">
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>공고 지원 용사들</title>

<!-- Favicon -->
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/assets/images/logo/favicon.png" type="image/x-icon">

<!-- CSS Files -->
<link rel="stylesheet" href="<c:url value="/resources/assets/css/almin.css"/>">

<style>
.search-bg {z-index: 100;}
</style>
</head>
<body>
<!-- Preloader Starts -->
<div class="preloader">
	<div class="spinner"></div>
</div>
<!-- Preloader End -->

<!-- 공통헤더 템플릿 -->
<c:import url="/WEB-INF/views/template/header.jsp" />

<!-- =========================================== 모달창 =========================================== -->
<div id="modal_back" style="display: none;">
    <div id="candidate_box_id">
        <ul id="candidate_info_ul">
            <li id="candidate_info_id">
                <div id="candidate_name_box">
                    <h3 style="margin: 0;" id="candidate_name_id"></h3>
                </div>
                <div>
                    <h4 style="margin: 0;" id="candidate_birth_id"></h4>
                    <h4 style="margin-top: 10px;" id="candidate_gender_id"></h4>
                </div>
            </li>
            <li style="font-weight: bolder; margin-top: 10px;" id="candidate_phone_id"></li>
            <li style="font-weight: bolder; margin-top: 10px;" id="candidate_email_id"></li>
        </ul>

        <div id="careerChartDiv">
            <canvas id="careerChart"></canvas>
            <div id="alterImage_div">
            	<img src="${pageContext.request.contextPath}/resources/assets/images/recruitMemberCareerNo.png" id="alterImage">
            </div>
        </div>
    </div>
</div>
<!-- =========================================== 모달창 =========================================== -->
<c:choose>
	<c:when test="${resultMsg eq 'yes'}">
		<h2 id="candidate_title">공고에 지원한 용사들</h2>
		<section id="candidate_container">
			<c:forEach var="selectRecruitMember" items="${resultMap}">
			<c:set var="k" value="${1+k}"></c:set>
			
			<div class="candidate_box">
			        <ul class="candidate_list">
			            <li class="candidate_info">
			                <div>
			                    <h2 class="candidate_name_class" style="margin: 0;">${selectRecruitMember.MEMBER_NAME}</h2>
			                    <!-- 경력 차트 조회용 아이디 -->
			                    <span style="display: none" class="candidate_memberId_class">${selectRecruitMember.RWM_MEMBER_ID}</span>
			               </div>
			               <div class="candidate_birth">
			                   <h4 class="candidate_birth_class" style="margin: 0;">${selectRecruitMember.MEMBER_BIRTH}</h4>
			                   <c:choose>
			                   <c:when test="${selectRecruitMember.MEMBER_GENDER == 'F'}">
			                   		<h4 class="candidate_gneder_class" style="margin-top: 10px;">여자</h4>
			                   </c:when>
			                   <c:when test="${selectRecruitMember.MEMBER_GENDER == 'M'}">
			                   		<h4 class="candidate_gneder_class" style="margin-top: 10px;">남자</h4>
			                   </c:when>
			                   </c:choose>
			               </div>
			           </li>
			           <li class="candidate_phone_class" style="font-weight: bolder; margin-top: 10px;">${selectRecruitMember.MEMBER_PHONE}</li>
			           <li class="candidate_email_class" style="font-weight: bolder; margin-top: 10px;">${selectRecruitMember.MEMBER_EMAIL}</li>
			        </ul>
			</div>
			</c:forEach>
		</section>
	</c:when>
	<c:when test="${resultMsg eq 'no'}">
		<section id="alter_container">
			<div id="alter_container_div">
				<img id="alter_container_img" src="${pageContext.request.contextPath}/resources/assets/images/no_recruiter.png" id="no_recruiter_alterImage">
			</div>
		</section>
	</c:when>
</c:choose>
<!-- 공통푸터 템플릿 -->
<c:import url="/WEB-INF/views/template/footer.jsp" />
<script>
	function search() {
		$("#searchRecruit").attr("action",
				"${pageContext.request.contextPath }/recruits").attr(
				"method", "get").submit();
	}
</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.6.0/chart.min.js" integrity="sha512-GMGzUEevhWh8Tc/njS0bDpwgxdCJLQBWG3Z2Ct+JGOpVnEmjvNx6ts4v6A2XJf1HOrtOsfhv3hBKpK9kE5z8AQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="<c:url value="/resources/template/js/almin.js"/>"></script>
<script src="<c:url value="/resources/myrecruit/js/myrecruit.js"/>"></script>
</body>
</html>
<!--
공고 지원자 전체 조회 / 특정 지원자 상세 조회 / 지원자 면접 제의
-->