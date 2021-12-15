<!-- 웹폰트: Noto Sans Korean -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400&display=swap"
	rel="stylesheet">

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공고 상세</title>
<!-- Favicon -->
<link rel="shortcut icon"
	href="${pageContext.request.contextPath }/resources/assets/images/logo/favicon.png"
	type="image/x-icon">

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="shortcut icon"
	href="${pageContext.request.contextPath }/resources/assets/images/logo/favicon.png"
	type="image/x-icon">
<link rel="stylesheet"
	href="<c:url value="/resources/assets/css/almin.css"/>">
<link rel="stylesheet"
	href="<c:url value="/resources/recruits/css/detailjobinfo.css"/>">

<style>
.d-toggle {
	display: none;
}
form{display:inline 
}
</style>
</head>
<body>
	<c:import url="/WEB-INF/views/template/header.jsp" />
	<!-- Header Area End -->
	<section class="job-single-content section-padding">
		<div class="container">
			<div class="row">
				<div class="col-lg-8">
					<div class="main-content">
						<div class="single-content2 py-4">
							<h3>${detailjobinfo.recruitTitle}</h3>
						</div>
						<div class="single-content4 py-4">
							<h4>모집요건</h4>
							<table>
								<tr>
									<td>경력 :&nbsp;</td>
									<td>${detailjobinfo.recruitCareer }</td>
								</tr>
								<tr>
									<td>성별 :&nbsp;</td>
									<td>${detailjobinfo.recruitGender }</td>
								</tr>
								<tr>
									<td>인원 :&nbsp;</td>
									<td>${detailjobinfo.recruitPerson }명</td>
								</tr>
							</table>
						</div>
						<div class="single-content5 py-4">
							<h4>근무조건</h4>
							<table>
								<tr>
									<td>급여 :&nbsp;</td>
									<td>${detailjobinfo.recruitMoney }</td>
								</tr>
								<tr>
									<td>근무기간 :&nbsp;</td>
									<td>${detailjobinfo.recruitPeriod }</td>
								</tr>
								<tr>
									<td>근무요일 :&nbsp;</td>
									<td>${detailjobinfo.recruitDay }</td>
								</tr>
								<tr>
									<td>근무시간 :&nbsp;</td>
									<td>${detailjobinfo.recruitTime }</td>
								</tr>
							</table>
						</div>
						<div class="single-content6 py-4">
							<h4>근무지역</h4>
							<div>
								<p>${detailjobinfo.recruitAddress }</p>

								<div id="map" style="width: 700px; height: 350px;"></div>
								<script type="text/javascript"
									src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a26931e0dc5588e1068857f8559fe26e&libraries=services"></script>
								<script>
									var mapContainer = document
											.getElementById('map'), // 지도를 표시할 div 
									mapOption = {
										center : new kakao.maps.LatLng(
												33.450701, 126.570667), // 지도의 중심좌표
										level : 3
									// 지도의 확대 레벨
									};

									// 지도를 생성합니다    
									var map = new kakao.maps.Map(mapContainer,
											mapOption);

									// 주소-좌표 변환 객체를 생성합니다
									var geocoder = new kakao.maps.services.Geocoder();

									// 주소로 좌표를 검색합니다
									geocoder
											.addressSearch(
													'${detailjobinfo.recruitAddress}',
													function(result, status) {

														// 정상적으로 검색이 완료됐으면 
														if (status === kakao.maps.services.Status.OK) {

															var coords = new kakao.maps.LatLng(
																	result[0].y,
																	result[0].x);

															// 결과값으로 받은 위치를 마커로 표시합니다
															var marker = new kakao.maps.Marker(
																	{
																		map : map,
																		position : coords
																	});

															// 인포윈도우로 장소에 대한 설명을 표시합니다
															var infowindow = new kakao.maps.InfoWindow(
																	{
																		content : '<div style="width:150px;text-align:center;padding:6px 0;">${detailjobinfo.recruitAddress}</div>'
																	});
															infowindow
																	.open(map,
																			marker);

															// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
															map
																	.setCenter(coords);
														}
													});
								</script>

							</div>
						</div>
						<div class="single-content7 py-4">
							<h4>상세모집요강</h4>
							<div>되는 청춘에서만 할지니, 피는 그들은 노래하며 스며들어 봄바람이다. 같으며, 무엇이 사랑의 하는
								이것이다. 가치를 예가 얼마나 인생에 있음으로써 것이다. 원대하고, 곧 영원히 보배를 되려니와, 고행을 사랑의
								두손을 청춘이 위하여서. 풀이 듣기만 피부가 되려니와, 설레는 스며들어 노년에게서 별과 있다.<br>
								것은 보내는 새 원대하고, 착목한는 인류의 것이다. 열매를 그들의 귀는 있을 원질이 것이다. 그들은 시들어 속에서 힘차게 커다란
								끓는다. 산야에 꽃이 위하여, 인간의 사랑의 생생하며, 그와 것은 피어나기 것이다. 할지라도 이상의 대고, 같은
								품에 피가 만천하의 것이다. 그들에게 그들의 주는 가지에 얼음이 끓는 풀밭에 그들에게 든 이것이다. 불러 할지라도
								피고 우리의 무엇을 수 때문이다. 봄바람을 앞이 그것을 듣는다. 앞이 같이 실현에 따뜻한 이것을 교향악이다. 것은
								얼음이 지혜는 고동을 앞이 그림자는 쓸쓸하랴? 오아이스도 있는 원대하고, 바로 갑 물방아 거선의 원질이 넣는 있다.
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="sidebar">
						<div class="single-item mb-4">
							<h4 class="mb-4">매장 후기</h4>
							<button type="button" class="commentsBtns" id="insert_modal_showBtn">후기등록</button>
							<button type="button" class="commentsBtns" id="show_most_keyword">가장 많이 선택된 후기</button>
<!-- 							<a href="#" class="commentsBtns" id="insert_modal_showBtn">후기등록</a>
							<a href="#" class="commentsBtns" id="show_most_keyword">가장 많이 선택된 후기 키워드</a> -->
							<!-- <a href="#" id="insert_modal_showBtn" class="sidebar-btn d-flex justify-content-between mb-3">후기등록</a> -->
							<div style="text-align: center; margin-top: 30px; display: none" id="alterImage_div">
								<img src="${pageContext.request.contextPath}/resources/assets/images/no_most_comments.png" id="most_comments_alterImage">
								<span style="color: black; font-size: 1.25rem;">등록된 후기가 없습니다.</span>
							</div>
							<ul id="mostCommentsUl" style="display: none;">
								<li class="mostCommentsList"></li>
								<li class="mostCommentsList"></li>
								<li class="mostCommentsList"></li>
								<li class="mostCommentsList"></li>
								<li class="mostCommentsList"></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<hr>
			<!-- ---------------------------------------------------------------------------------------------------------------------------------------------------- -->
			<div class="btninline">
			<button class="template-btn" onclick="location.href='${pageContext.request.contextPath}/myrecruit/${recruitNo}'">공고 지원자 보기</button>
			<form action="recruitgo" method="post">
				<!-- session 이용 필요 -->
				<input type="hidden" id="recruitGoId" value="test02" name="rwmMemberId">
				<input type="hidden" id="recruitGoNo" value="${recruitNo}" name="rwmRecruitNo">
				<button type="submit" class="template-btn" id="recruitGo">지원하기</button>
			</form>
			
				<c:if test="${recruitgomsg ne null}">
					<script>
						alert("${recruitgomsg}");
						<c:remove var="recruitgomsg"/>
					</script>
				</c:if>
			
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
							<button class="sidebar-btn justify-content-between mb-3"
								onclick="report(this);" id="rno_1">
								<span>통장,신분증,비밀번호를 요구하는 경우</span>
							</button>
							<button class="sidebar-btn justify-content-between mb-3"
								onclick="report(this);" id="rno_2">
								<span>유흥업소 및 불건전 업소</span>
							</button>
							<button class="sidebar-btn justify-content-between mb-3"
								onclick="report(this);" id="rno_3">
								<span>허위 사기성 내용</span>
							</button>
							<button class="sidebar-btn justify-content-between mb-3"
								onclick="report(this);" id="rno_4">
								<span>다단계 및 피라미드성 통신상품 판매 업체</span>
							</button>
							<button class="sidebar-btn justify-content-between"
								onclick="report(this);" id="rno_5">
								<span>최저임금 미만의 급여</span>
							</button>
						</div>
					</div>
				</div>
			</div>
			</div>
		</div>
	</section>
	<section id="comments_container">
		<hr style="border-bottom: 1px solid #707070">
		<h1 style="padding-left: 40px;">Review</h1>
		[[${loginInfo.memberId}]]
		<ul id="comments_box"></ul>
		<div id="comments_box_pageLink"></div>
	</section>

	<!-- Footer Area Starts -->
	<c:if test="${!empty msg}">
		<script>
			alert("${msg}");
			<c:remove var="msg"/>
		</script>
	</c:if>
	<c:import url="/WEB-INF/views/template/footer.jsp" />
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
					if(data == "1"){
					alert('신고가 완료되었습니다.');
					} else {
					alert('신고는 공고당 한 번만 가능합니다.');
					}
				},
				error : function() {
					alert('오류 발생. 오류 코드: ' + error.code);
				}
			});
		}
	</script>
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
		// let userId = "jinpark";
		// let userId = "giniuskang";
		// let userId = "minzi91";
		// let userId = "sjh1216";
		// let userId = "sy111k2";
		// let userId = "test01";
		let userId = "jinpark";

		// jinpark
		// giniuskang
		// minzi91
		// sjh1216
		// sy111k2
		// test01
		// test02

		// recruitNo(후기, 수정 삭제는 이 변수를 쓰면 안 된다. 로그인한 사용자가 매번 달라지기 때문)
		let recruitNo = "${recruitNo}";
		console.log("recruitNo : " + recruitNo);
		// 공고번호(recruitNo)
	</script>
	<!-- 후기 입력 모달창 import -->
	<c:import url="/WEB-INF/views/recruits/detailjobinfo_comments.jsp" />
	<!-- 후기 입력 모달창 import -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="<c:url value="/resources/template/js/almin.js"/>"></script>
	<script src="<c:url value="/resources/recruits/js/detailjobinfo.js"/>"></script>
</body>
</html>