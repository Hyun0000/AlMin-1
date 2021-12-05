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
<title>${recruitTitle}</title>
<link rel="stylesheet"
	href="<c:url value="/resources/recruits/css/detailjobinfo.css"/>">
<!-- Favicon -->
<link rel="shortcut icon"
	href="${pageContext.request.contextPath }/resources/assets/images/logo/favicon.png"
	type="image/x-icon">

<!-- CSS Files -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/assets/css/animate-3.7.0.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/assets/css/font-awesome-4.7.0.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/assets/fonts/flat-icon/flaticon.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/assets/css/bootstrap-4.1.3.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/assets/css/owl-carousel.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/assets/css/nice-select.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/assets/css/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<style>
.d-toggle {
	display: none;
}
</style>
</head>
<body>
	<c:import url="/WEB-INF/views/template/header.jsp" />
	<!-- Header Area End -->
	<section id="detailjob">
		<h2>${detailjobinfo.recruitTitle}</h2>
		<!-- ===========================모집조건====================================== -->
		<h2>모집요건</h2>
		<div id="recruitCondition" class="recdiv">
			<table class="rectable">

				<tr>
					<td>경력</td>
					<td>${detailjobinfo.recruitCareer }</td>
				</tr>
				<tr>
					<td>성별</td>
					<td>${detailjobinfo.recruitGender }</td>
				</tr>
				<tr>
					<td>인원</td>
					<td>${detailjobinfo.recruitPerson }명</td>
				</tr>

			</table>

		</div>
		<aside>
			<button type="button" class="template-btn">지원하기</button>
			<button class="template-btn like-btn" onclick="doLike(this);">
				<c:choose>
					<c:when test="${like == null}">
					찜하기
				</c:when>
					<c:otherwise>
					찜해제
				</c:otherwise>
				</c:choose>
			</button>
			<button class="template-btn" onclick="myFunction(this)">신고하기</button>
			<div class="d-toggle">
				<div class="col-lg-4">
					<div class="sidebar mt-5 mt-lg-0">
						<div class="single-item mb-4">
							<h4 class="mb-4">이 공고를 신고하는 이유를 알려주세요.</h4>
							<p style="display: none">${detailjobinfo.recruitNo}</p>
							<button class="sidebar-btn d-flex justify-content-between mb-3"
								onclick="report(this);" id="rno_1">
								<span>통장,신분증,비밀번호를 요구하는 경우</span>
							</button>
							<button class="sidebar-btn d-flex justify-content-between mb-3"
								onclick="report(this);" id="rno_2">
								<span>유흥업소 및 불건전 업소</span>
							</button>
							<button class="sidebar-btn d-flex justify-content-between mb-3"
								onclick="report(this);" id="rno_3">
								<span>허위 사기성 내용</span>
							</button>
							<button class="sidebar-btn d-flex justify-content-between mb-3"
								onclick="report(this);" id="rno_4">
								<span>다단계 및 피라미드성 통신상품 판매 업체</span>
							</button>
							<button class="sidebar-btn d-flex justify-content-between"
								onclick="report(this);" id="rno_5">
								<span>최저임금 미만의 급여</span>
							</button>
						</div>
					</div>
				</div>
			</div>
		</aside>

		<!-- =================================근무조건============================ -->
		<h2>근무조건</h2>
		<div id="workdingCondition" class="recdiv">

			<table class="rectable">
				<tr>
					<td>급여</td>
					<td>${detailjobinfo.recruitMoney }</td>
				</tr>
				<tr>
					<td>근무기간</td>
					<td>${detailjobinfo.recruitPeriod }</td>
				</tr>
				<tr>
					<td>근무요일</td>
					<td>${detailjobinfo.recruitDay }</td>
				</tr>
				<tr>
					<td>근무시간</td>
					<td>${detailjobinfo.recruitTime }</td>
				</tr>
			</table>

		</div>

		<!--  =====================근무지역=============================== -->
		<h2>근무지역</h2>
		<div id="workingArea">
			<p>${detailjobinfo.recruitAddress }</p>

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
	<section id="comments_container">
		<ul id="comments_box"></ul>
	</section>
	<!-- 후기 조회(select) -->
	<!-- 한줄 후기  & 근로계약서 -->
	<button id="insert_modal_showBtn">후기 등록</button>
	<div id="comments_insert_modal_back">
		<div id="comments_insert_box">
			<div class="comments_insert_top">
				<fieldset>
					<legend style="color: white;" id="comments_insert_legend">한줄 후기</legend>
					<div id="contract_box">
						<input name="ccContent" id="commentsLine"
							placeholder="100자 이내로 작성해주세요(공백포함)">
						<div id="radio_box">
							<h3>근로계약서 작성 여부</h3>
							<label for="contract_y">작성</label>
							<input type="radio" value="Y" name="ccContract" id="contract_y">
							<label for="contract_n">미작성</label>
							<input type="radio" value="N" name="ccContract" id="contract_n">
						</div>
					</div>
				</fieldset>
			</div>
			<!-- 후기 키워드 -->
			<div class="comments_insert_btm">
				<c:forEach var="map" items="${commentsMap}">
					<c:set var="dropNum" value="${dropNum + 1}" />
					<c:set var="dragNum" value="${dragNum + 1}" />

					<c:choose>
						<c:when test="${map.key == 1}"><div class="keyName">장점</div></c:when>
						<c:when test="${map.key == 2}"><div class="keyName">단점</div></c:when>
						<c:when test="${map.key == 3}"><div class="keyName">조건</div></c:when>
						<c:when test="${map.key == 4}"><div class="keyName">분위기</div></c:when>
						<c:when test="${map.key == 5}"><div class="keyName">급여</div></c:when>
					</c:choose>
					
					<div id="dropzone_${dropNum}" class="dropzoneClass" ondrop="drop(event)" ondragover="allowDrop(event)">
					</div>

					<div id="dragzone_${dragNum}" class="dragzoneClass">
						<c:forEach var="condition" items="${map.value}">
							<c:set var="idNum" value="${idNum + 1}" />
							<div id="drag_${idNum}" class="dragEle" draggable="true" ondragstart="drag(event);">
								<span class="keyword">${condition}</span><span class="xMark" onClick="deleteX()">&times;</span>
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
		// let xEle = document.getElementsByClassName('xMark');

		// <ul id="comments_box"></ul> : comments 전체를 담는 <ul>
		let commentsBoxEle = document.getElementById('comments_box');

		// userID
		let userId = "user01";

		// recruitNo(후기, 수정 삭제는 이 변수를 쓰면 안 된다. 로그인한 사용자가 매번 달라지기 때문)
		let recruitNo = '1';

		// 공고번호(recruitNo)
	</script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="<c:url value="/resources/recruits/js/detailjobinfo.js"/>"></script>
	<script src="<c:url value="/resources/template/js/almin.js"/>"></script>
	<!-- Footer Area Starts -->
	<c:import url="/WEB-INF/views/template/footer.jsp" />
	<c:if test="${!empty msg}">
		<script>
			alert("${msg}");
			<c:remove var="msg"/>
		</script>
	</c:if>
	<script>
		function myFunction(targetEle) {
			console.log(targetEle);
			var $togggleEle = $(targetEle).next();
			$togggleEle.toggle();
		}
	</script>
	<script>
		function doLike(e) {
			//location.href='${pageContext.request.contextPath}/recruits/like?recruitNo=${detailjobinfo.recruitNo}';
			$.ajax({
				url : '${pageContext.request.contextPath}/recruits/like',
				type : 'post',
				data : {
					recruitNo : '${detailjobinfo.recruitNo}'
				},
				success : function(data) {
					console.log(data);
					if (data == "1") {
						$(".template-btn.like-btn").text("찜하기");
					} else {
						// 0: 찜 등록완료, 1. 찜 해제완료
						$(".template-btn.like-btn").text("찜해제");
					}
				},
				error : function() {
					alert('오류 발생. 오류 코드: ' + error.code);
				}
			});
		}
	</script>
	<script>
		function report(e) {
			var selectedVal = $(e).attr("id").split("_");
			$.ajax({
				url : '${pageContext.request.contextPath}/recruits/report',
				type : 'post',
				data : {
					recruitNo : '${detailjobinfo.recruitNo}',
					reasonNo : selectedVal[1]
				},
				success : function(data) {
					console.log(data);
					alert('신고가 완료되었습니다.');
				},
				error : function() {
					alert('오류 발생. 오류 코드: ' + error.code);
				}
			});
		}
	</script>
</body>
</html>