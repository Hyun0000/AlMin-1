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
<section id="candidate_container">
<!-- foreach -->
	<div class="candidate_box">
	    <a href="#1" class="detailInfo_Link">
	        <ul class="candidate_list">
	            <li class="candidate_info">
	                <div>
	                    <h2 style="margin: 0;">박정원</h2>
	               </div>
	               <div class="candidate_birth">
	                   <h4 style="margin: 0;">19951017</h4>
	                   <h4 style="margin-top: 10px;">남자</h4>
	               </div>
	           </li>
	           <li style="font-weight: bolder; margin-top: 10px;">010-0000-0000</li>
	           <li style="font-weight: bolder; margin-top: 10px;">apple@apple.com</li>
	        </ul>
	    </a>
	</div>
	
    <div class="candidate_box">
        <a href="#2" class="detailInfo_Link">
            <ul class="candidate_list">
                <li class="candidate_info">
                    <div>
                        <h2 style="margin: 0;">박정원</h2>
                    </div>
                    <div class="candidate_birth">
                        <h4 style="margin: 0;">19951017</h4>
                        <h4 style="margin-top: 10px;">남자</h4>
                    </div>
                </li>
                <li style="font-weight: bolder; margin-top: 10px;">010-0000-0000</li>
                <li style="font-weight: bolder; margin-top: 10px;">apple@apple.com</li>
            </ul>
        </a>
    </div>
<!-- foreach -->
</section>
</body>
</html>
<!--
공고 지원자 전체 조회 / 특정 지원자 상세 조회 / 지원자 면접 제의
-->