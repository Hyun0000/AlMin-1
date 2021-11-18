<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="<c:url value="/resources/recruits/css/detailjobinfo.css"/>">
<style>
.rectable {
	border: none;
}

.recdiv {
	background-color: ivory;
	width: 50%;
}
</style>
</head>
<body>
	<section>
		<h1>제목나와라뚜욱닥</h1>
		<c:forEach var="item" items="${detailjobinfo }">
			<h1>${item.recruitTitle }</h1>
		</c:forEach>
		<!-- ===========================모집조건====================================== -->
		<h2>모집요건</h2>
		<div id="recruitCondition" class="recdiv">
			<table class="rectable">

				<tr>
					<td>경력</td>
					<td>${item.recruitCareer }</td>
				</tr>
				<tr>
					<td>성별</td>
					<td>${item.recruitGender }</td>
				</tr>

				<tr>
					<td>연령</td>
					<td>${item.recruitAge }</td>
				</tr>
				<tr>
					<td>인원</td>
					<td>${item.recruitPerson }명</td>
				</tr>

			</table>

		</div>
		<aside>
			<button type="button">지원하기</button>
			<button type="button">찜하기</button>
			<button type="button">신고하기</button>
		</aside>

		<!-- =================================근무조건============================ -->
		<h2>근무조건</h2>
		<div id="workdingCondition" class="recdiv">

			<table class="rectable">
				<tr>
					<td>급여</td>
					<td>${item.recruitMoney }</td>
				</tr>
				<tr>
					<td>근무기간</td>
					<td>${item.recruitPeriod }</td>
				</tr>
				<tr>
					<td>근무요일</td>
					<td>${item.recruitDay }</td>
				</tr>
				<tr>
					<td>근무시간</td>
					<td>${item.recruitTime }</td>
				</tr>
			</table>

		</div>

		<!--  =====================근무지역=============================== -->
		<h2>근무지역</h2>
		<div id="workingArea">
			<p>${item.recruitAddress }</p>

			<div id="map" style="width: 700px; height: 350px;"></div>

			<script type="text/javascript"
				src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a26931e0dc5588e1068857f8559fe26e&libraries=services"></script>
			<script>
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				mapOption = {
					center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
					level : 3
				// 지도의 확대 레벨
				};

				// 지도를 생성합니다    
				var map = new kakao.maps.Map(mapContainer, mapOption);

				// 주소-좌표 변환 객체를 생성합니다
				var geocoder = new kakao.maps.services.Geocoder();

				// 주소로 좌표를 검색합니다
				geocoder
						.addressSearch(
								'서울특별시 중구 남대문로 120 대일빌딩',
								function(result, status) {

									// 정상적으로 검색이 완료됐으면 
									if (status === kakao.maps.services.Status.OK) {

										var coords = new kakao.maps.LatLng(
												result[0].y, result[0].x);

										// 결과값으로 받은 위치를 마커로 표시합니다
										var marker = new kakao.maps.Marker({
											map : map,
											position : coords
										});

										// 인포윈도우로 장소에 대한 설명을 표시합니다
										var infowindow = new kakao.maps.InfoWindow(
												{
													content : '<div style="width:150px;text-align:center;padding:6px 0;">kh정보교육원</div>'
												});
										infowindow.open(map, marker);

										// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
										map.setCenter(coords);
									}
								});
			</script>
		</div>
		<!-- ======================상세모집요강==================================== -->
		<h2>상세모집요강</h2>
		<div id="recruitGuide"></div>


	</section>


	<!-- 후기 조회(select) -->
	<!-- 후기 조회(select) -->
	<!-- 후기 조회(select) -->
	<!-- 후기 조회(select) -->
	<!-- 후기 조회(select) -->
	<!-- 후기 조회(select) -->
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
	<!-- 후기 조회(select) -->
	<!-- 후기 조회(select) -->
	<!-- 후기 조회(select) -->
	<!-- 후기 조회(select) -->
	<!-- 후기 조회(select) -->
	<!-- 후기 조회(select) -->
	<!-- 한줄 후기  & 근로계약서 -->
	<!-- 한줄 후기  & 근로계약서 -->
	<!-- 한줄 후기  & 근로계약서 -->
	<!-- 한줄 후기  & 근로계약서 -->
	<!-- 한줄 후기  & 근로계약서 -->
	<button id="insert_modal_showBtn">후기 등록</button>
	<div id="comments_insert_modal_back" style="display: none;">
		<div id="comments_insert_box">
			<div class="comments_insert_top">
				<fieldset>
					<legend>한줄 후기</legend>
					<input name="ccContent" id="commentsLine"
						placeholder="100자 이내로 작성해주세요(공백포함)">
					<div id="contract_box">
						<h3>근로계약서 작성 여부</h3>
						<label for="contract_y">작성</label> <input type="radio" value="Y"
							name="ccContract" id="contract_y"> <label
							for="contract_n">미작성</label> <input type="radio" value="N"
							name="ccContract" id="contract_n">
					</div>
				</fieldset>
			</div>
			<!-- 후기 키워드 -->
			<!-- 후기 키워드 -->
			<!-- 후기 키워드 -->
			<!-- 후기 키워드 -->
			<!-- 후기 키워드 -->
			<!-- 후기 키워드 -->
			<!-- 후기 키워드 -->
			<!-- 후기 키워드 -->
			<div class="comments_insert_btm">
				<c:forEach var="map" items="${commentsMap}">
					<c:set var="dropNum" value="${dropNum + 1}" />
					<c:set var="dragNum" value="${dragNum + 1}" />

					<div id="dropzone_${dropNum}" class="dropzoneClass"
						ondrop="drop(event)" ondragover="allowDrop(event)">
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
							<c:set var="idNum" value="${idNum + 1}" />
							<div id="drag_${idNum}" class="dragEle" draggable="true"
								ondragstart="drag(event);">
								<span class="keyword">${condition}</span><span class="xMark">&times;</span>
							</div>
						</c:forEach>
					</div>
				</c:forEach>
			</div>
			<div id="btnBox">
				<button type="button" id="submitBtn">등록</button>
			</div>
		</div>
	</div>
	<!-- 후기 키워드 -->
	<!-- 후기 키워드 -->
	<!-- 후기 키워드 -->
	<!-- 후기 키워드 -->
	<!-- 후기 키워드 -->
	<!-- 후기 키워드 -->
	<!-- 후기 키워드 -->
	<!-- 후기 키워드 -->
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