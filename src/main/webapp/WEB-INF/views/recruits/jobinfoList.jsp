<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="shortcut icon"
	href="${pageContext.request.contextPath }/resources/assets/images/logo/favicon.png"
	type="image/x-icon">
<link rel="stylesheet"
	href="<c:url value="/resources/assets/css/almin.css"/>">
<title>구인공고</title>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style>
.nice-select span.current {
	line-height: 0;
}

.job-text {
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

.tab {
	color: #1FA5FD;
}
</style>
</head>
<body>
	<header>
		<c:import url="/WEB-INF/views/template/header.jsp" />
	</header>

	<!-- Job Single Content Starts -->
	<section class="job-single-content section-padding">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="jobs-tab tab-item">
						<h4 class="tab listTitle">구인공고&emsp;</h4>
					</div>
					<div id="here"></div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-8">

					<c:if test="${empty recruits}">
						<div class="more-job-btn mt-5 text-center">
							<input type="button" class="template-btn" onclick="search()"
								id="btnshow" value="목록으로 돌아가기">
						</div>
					</c:if>

					<c:forEach var="item" items="${recruits}">
						<div class="main-content">

							<div class="single-content1">
								<div class="single-job mb-4 d-lg-flex justify-content-between">
									<div class="job-text">
										<h4>${item.recruitTitle}</h4>
										<ul class="mt-4">
											<li class="mb-3"><h5>
													<i class="fa fa-map-marker"> ${item.recruitDate} </i>
												</h5></li>
										</ul>
										<button class="genric-btn primary small"
											onclick="location.href='${pageContext.request.contextPath}/recruits/detailjobinfo?recruitNo=${item.recruitNo}'">상세보기</button>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>

				</div>
				<div class="col-lg-4">
					<form id="searchRecruit">
						<div class="sidebar mt-5 mt-lg-0">
							<div class="single-item mb-4">
								<h4 class="mb-4">지역</h4>
								<div class="default-select">
									<select name="recruitJobDistrict" id="district">
										<option value="100">무관</option>
										<option value="18">서울</option>
										<option value="1">경기</option>
										<option value="2">인천</option>
										<option value="3">대전</option>
										<option value="4">대구</option>
										<option value="5">부산</option>
										<option value="6">울산</option>
										<option value="7">광주</option>
										<option value="8">강원</option>
										<option value="9">세종</option>
										<option value="10">충북</option>
										<option value="11">충남</option>
										<option value="12">경북</option>
										<option value="13">경남</option>
										<option value="14">전북</option>
										<option value="15">전남</option>
										<option value="16">제주</option>
										<option value="17">전국</option>
									</select>
								</div>
							</div>
							<div class="single-item mb-4">
								<h4 class="mb-4">업종</h4>
								<div class="default-select">
									<select name="recruitJobType" id="type">
										<option value="100">무관</option>
										<option value="1">외식/음료</option>
										<option value="2">유통/판매</option>
										<option value="3">문화/여가</option>
										<option value="4">서비스</option>
										<option value="5">사무/회계</option>
										<option value="6">고객상담</option>
										<option value="7">생산/건설/인력</option>
										<option value="8">IT/미디어</option>
										<option value="9">교육/강사/학원</option>
										<option value="10">디자인</option>
										<option value="11">배달/운전</option>
										<option value="12">병원/간호</option>
									</select>
								</div>
							</div>
							<div class="single-item mb-4">
								<h4 class="mb-4">대상</h4>
								<div class="default-select">
									<select name="recruitJobWho" id="who">
										<option value="100">무관</option>
										<option value="1">청소년</option>
										<option value="2">대학생</option>
										<option value="3">중장년</option>
										<option value="4">장애인</option>
										<option value="5">주부</option>
										<option value="6">외국인 가능</option>
										<option value="7">초보 가능</option>
										<option value="8">재택 가능</option>
									</select>
								</div>
							</div>
							<div class="single-item mb-4">
								<h4 class="mb-4">브랜드</h4>
								<div class="default-select">
									<select name="recruitJobBranch" id="branch">
										<option value="X">무관</option>
										<option value="Y">브랜드알바 보기</option>
										<option value="N">브랜드알바 제외</option>
									</select>
								</div>
							</div>
							<div class="single-item mb-4">
								<h4 class="mb-4">키워드</h4>
								<input type="text" placeholder="키워드 검색"
									onfocus="this.placeholder = ''"
									onblur="this.placeholder = '키워드 검색'" name="searchKeyword"
									id="keyword">
							</div>
							<div class="more-job-btn mt-5 text-center">
								<input type="button" class="template-btn" onclick="search()"
									id="btnSearch" value="검색" /> <input type="button"
									class="template-btn" onclick="location.href='${pageContext.request.contextPath}/recruits'"
									value="전체보기" />
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>
	<!-- Job Single Content End -->

	<footer>
		<c:import url="/WEB-INF/views/template/footer.jsp" />
	</footer>

	<script>
		function search() {
			$("#searchRecruit").attr("action",
					"${pageContext.request.contextPath }/recruits").attr(
					"method", "get").submit();
		}
	</script>
	<c:if test="${!empty msg}">
		<script>
			alert("${msg}");
			<c:remove var="msg"/>
		</script>
	</c:if>
	<c:if test="${!empty slist}">
		<script>
		function isNull(obj) {
			   return (typeof obj != "undefined" && obj != null && obj != "") ? false : true;
		}
		
		var recruitJobDistrict="${slist.recruitJobDistrict}";
		var recruitJobType="${slist.recruitJobType}";
		var recruitJobWho="${slist.recruitJobWho}";
		var recruitJobBranch="${slist.recruitJobBranch}";
		var searchKeyword="${slist.searchKeyword}";
		var searchHtml = "";
		var isSearchResult = false;
		if(!isNull(recruitJobDistrict)){
			isSearchResult = true;
			switch(recruitJobDistrict){
			case "1":
				searchHtml += " #경기";
				break;
			case "2":
				searchHtml += " #인천";
				break;
			case "3":
				searchHtml += " #대전";
				break;
			case "4":
				searchHtml += " #대구";
				break;
			case "5":
				searchHtml += " #부산";
				break;
			case "6":
				searchHtml += " #울산";
				break;
			case "7":
				searchHtml += " #광주";
				break;
			case "8":
				searchHtml += " #강원";
				break;
			case "9":
				searchHtml += " #세종";
				break;
			case "10":
				searchHtml += " #충북";
				break;
			case "11":
				searchHtml += " #충남";
				break;
			case "12":
				searchHtml += " #경북";
				break;
			case "13":
				searchHtml += " #경남";
				break;
			case "14":
				searchHtml += " #전북";
				break;
			case "15":
				searchHtml += " #전남";
				break;
			case "16":
				searchHtml += " #제주";
				break;
			case "17":
				searchHtml += " #전국";
				break;
			case "18":
				searchHtml += " #서울";
				break;
			default:
				searchHtml += "";
				break;
			}
		}
		if(!isNull(recruitJobType)){
			isSearchResult = true;
			switch(recruitJobType){
			case "100":
				searchHtml += "";
				break;
			case "1":
				searchHtml += " #외식/음료";
				break;
			case "2":
				searchHtml += " #유통/판매";
				break;
			case "3":
				searchHtml += " #문화/여가";
				break;
			case "4":
				searchHtml += " #서비스";
				break;
			case "5":
				searchHtml += " #사무/회계";
				break;
			case "6":
				searchHtml += " #고객상담";
				break;
			case "7":
				searchHtml += " #생산/건설/인력";
				break;
			case "8":
				searchHtml += " #IT/미디어";
				break;
			case "9":
				searchHtml += " #교육/강사/학원";
				break;
			case "10":
				searchHtml += " #디자인";
				break;
			case "11":
				searchHtml += " #배달/운전";
				break;
			case "12":
				searchHtml += " #병원/간호";
				break;
			default:
				searchHtml += "";
				break;
			}
		}
		if(!isNull(recruitJobWho)){
			isSearchResult = true;
			switch(recruitJobWho){
			case "100":
				searchHtml += "";
				break;
			case "1":
				searchHtml += " #청소년 ";
				break;
			case "2":
				searchHtml += " #대학생";
				break;
			case "3":
				searchHtml += " #중장년";
				break;
			case "4":
				searchHtml += " #장애인";
				break;
			case "5":
				searchHtml += " #주부";
				break;
			case "6":
				searchHtml += " #외국인 가능";
				break;
			case "7":
				searchHtml += " #초보 가능";
				break;
			case "8":
				searchHtml += " #재택 가능";
				break;
			default:
				searchHtml += "";
				break;
			}
		}
		if(!isNull(recruitJobBranch)){
			isSearchResult = true;
			switch(recruitJobBranch){
			case "Y":
				searchHtml += " #브랜드알바";
				break;
			case "X":
				searchHtml += " #브랜드제외";
				break;
			default:
				searchHtml += "";
				break;
			}
		}
		if(!isNull(searchKeyword)){
			isSearchResult = true;
			searchHtml += " #"+searchKeyword;			
		}
		if(isSearchResult){
			$("#here").html(searchHtml);
		}
		</script>
	</c:if>
	
				
</body>
</html>