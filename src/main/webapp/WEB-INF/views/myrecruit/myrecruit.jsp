<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="<c:url value="/resources/myrecruit/css/myrecruit.css"/>">
<title>공고 지원한 용사들</title>
</head>
<body>
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
        </div>
    </div>
</div>
<!-- =========================================== 모달창 =========================================== -->
<section id="candidate_container">
	<c:forEach var="selectRecruitMember" items="${resultMap}">
	<c:set var="k" value="${1+k}"></c:set>
	
	<div class="candidate_box">
	        <ul class="candidate_list">
	            <li class="candidate_info">
	                <div>
	                    <h2 class="candidate_name_class" style="margin: 0;">${selectRecruitMember.MEMBER_NAME}</h2>
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.6.0/chart.min.js" integrity="sha512-GMGzUEevhWh8Tc/njS0bDpwgxdCJLQBWG3Z2Ct+JGOpVnEmjvNx6ts4v6A2XJf1HOrtOsfhv3hBKpK9kE5z8AQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="<c:url value="/resources/template/js/almin.js"/>"></script>
<script src="<c:url value="/resources/myrecruit/js/myrecruit.js"/>"></script>
</body>
</html>
<!--
공고 지원자 전체 조회 / 특정 지원자 상세 조회 / 지원자 면접 제의
-->