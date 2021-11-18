<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value="/resources/recruits/css/detailjobinfo.css"/>">
</head>
<body>
<!-- 후기 조회(select) --><!-- 후기 조회(select) --><!-- 후기 조회(select) --><!-- 후기 조회(select) --><!-- 후기 조회(select) --><!-- 후기 조회(select) -->
    <section id="comments_container">
        <ul id="comments_box">
        <!-- 동적 생성 -->
<!--
             <li class="comments_list">
                <div class="comments_top_bar">
                    <div class="comments_top_bar_left">
                        <h2>염라대왕</h2>
                        <h3>2021.11.18</h3>
                    </div>

                    <div class="comments_top_bar_right">
                        <button>수정</button>
                        <button>삭제</button>
                    </div>
                </div>

                <div class="comments_btm_bar">
                    <div class="left_comments_box">
                        <h3>장점</h3>
                    </div>

                    <div class="right_comments_box">
                        <ul class="right_comments_box_ul">
                            <li>박정원</li>
                            <li>박정원</li>
                            <li>박정원</li>
                            <li>박정원</li>
                            <li>박정원</li>
                            <li>박정원</li>
                            <li>박정원</li>
                            <li>박정원</li>
                            <li>박정원</li>
                            <li>박정원</li>
                            <li>박정원</li>
                            <li>박정원</li>
                        </ul>
                    </div>
                </div>
            </li>
-->
        </ul>
    </section>
<!-- 후기 조회(select) --><!-- 후기 조회(select) --><!-- 후기 조회(select) --><!-- 후기 조회(select) --><!-- 후기 조회(select) --><!-- 후기 조회(select) -->    
<!-- 한줄 후기  & 근로계약서 --><!-- 한줄 후기  & 근로계약서 --><!-- 한줄 후기  & 근로계약서 --><!-- 한줄 후기  & 근로계약서 --><!-- 한줄 후기  & 근로계약서 -->
	<button id="insert_modal_showBtn">후기 등록</button>
	<div id="comments_insert_modal_back"  style="display: none;">
		<div id="comments_insert_box">
			<div class="comments_insert_top">
			    <fieldset>
			        <legend>한줄 후기</legend>
			        <input name="ccContent" id="commentsLine" placeholder="100자 이내로 작성해주세요(공백포함)">
				    <div id="contract_box">
				    	<h3>근로계약서 작성 여부</h3>
					    <label for="contract_y">작성</label>
					    <input type="radio" value="Y" name="ccContract" id="contract_y">
					    <label for="contract_n">미작성</label>
					    <input type="radio" value="N" name="ccContract" id="contract_n">
				    </div>
			    </fieldset>
		    </div>
<!-- 후기 키워드 --><!-- 후기 키워드 --><!-- 후기 키워드 --><!-- 후기 키워드 --><!-- 후기 키워드 --><!-- 후기 키워드 --><!-- 후기 키워드 --><!-- 후기 키워드 -->
			<div class="comments_insert_btm">
				<c:forEach var="map" items="${commentsMap}">
					<c:set var="dropNum" value="${dropNum + 1}"/>
					<c:set var="dragNum" value="${dragNum + 1}"/>
					
					<div id="dropzone_${dropNum}" class="dropzoneClass" ondrop="drop(event)" ondragover="allowDrop(event)">
						<c:choose>
							<c:when test="${map.key == 1}">장점</c:when>
							<c:when test="${map.key == 2}">단점</c:when>
							<c:when test="${map.key == 3}">조건</c:when>
							<c:when test="${map.key == 4}">분위기</c:when>
							<c:when test="${map.key == 5}">급여</c:when>
						</c:choose>
					</div>
					
					<div id="dragzone_${dragNum}" class="dragzoneClass">
						<c:forEach var="condition" items="${map.value}">
							<c:set var="idNum" value="${idNum + 1}"/>
							<div id="drag_${idNum}" class="dragEle" draggable="true" ondragstart="drag(event);"><span class="keyword">${condition}</span><span class="xMark">&times;</span></div>
						</c:forEach>
					</div>
				</c:forEach>
		    </div>
		    <div id="btnBox">
				<button type="button" id="submitBtn">등록</button>
			</div>
		</div>
	</div>
<!-- 후기 키워드 --><!-- 후기 키워드 --><!-- 후기 키워드 --><!-- 후기 키워드 --><!-- 후기 키워드 --><!-- 후기 키워드 --><!-- 후기 키워드 --><!-- 후기 키워드 -->
<script>
	console.log("${pageContext.request.contextPath}");

	// item을 놓는 장소인 dropzone : <div id="dropzone">
	// let dropzoneEle = document.getElementById('dropzone');
	let dropzoneEle = document.getElementsByClassName('dropzoneClass');
	
	// 기존 item을 저장하는 장소인 dragzone : <div id="dragzone">
	// let dragzoneEle = document.getElementById('dragzone');dragzoneClass
	let dragzoneEle = document.getElementsByClassName('dragzoneClass');
	
	// drag할 각 item
	let dragItemEle = document.getElementsByClassName('dragEle');
	
	// x마크
	let xEle = document.getElementsByClassName('xMark');
</script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="<c:url value="/resources/recruits/js/detailjobinfo.js"/>"></script>
<script src="<c:url value="/resources/template/js/almin.js"/>"></script>
</body>
</html>