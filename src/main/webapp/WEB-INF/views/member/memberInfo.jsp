<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>알바의 민족 회원정보 수정</title>
<!-- Favicon -->
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/resources/assets/images/logo/favicon.png"
	type="image/x-icon">

<!-- CSS Files -->
<link rel="stylesheet"
	href="<c:url value="/resources/assets/css/almin.css"/>">
<style>
.social-name {
	color: black;
	font-size: 1.2rem;
	font-weight: bold;
}

.active {
	color: #1fa5fd;
}

#container {
	position: relative;
	width: 920px;
	margin: 0 auto;
	padding: 30px 0;
}

.mInfoWrap {
	overflow: hidden;
	margin-top: 15px;
	font-family: Malgun Gothic, "\B9D1\C740 \ACE0\B515", dotum, "\B3CB\C6C0",
		arial, sans-serif;
	font-size: 12px;
}

.mInfo {
	position: relative;
	float: left;
	width: 390px;
	height: 350px;
	margin: 0 15px 15px 0;
	padding: 30px;
	border: 1px solid #ddd;
}

.mPw {
	position: relative;
	float: left;
	width: 390px;
	height: 350px;
	padding: 30px;
	border: 1px solid #ddd;
}

.mSns {
	padding: 30px;
	border: 1px solid #ddd;
	float: left;
	width: 390px;
	height: 350px;
}

.mName {
	font-size: 1.5em;
}

.id {
	font-color: dodgerblue
}

tr>td {
	width: 70px;
}

tr>td:last-child {
	width: 90px;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {
	})
</script>
</head>
<body>
	<!-- 공통헤더 템플릿 -->
	<c:import url="/WEB-INF/views/template/header.jsp" />

	<section class="job-single-content section-padding">
		<div class="container">
			<div class="row">

				<div class="col-lg-8 post-list blog-post-list">
					<div class="single-post">

						<!-- Start comment-sec Area -->
						<section class="comment-sec-area py-5">
							<div class="container">
								<c:choose>
									<c:when test="${sessionScope.loginInfo.sessionType eq '1'}">
										<p class="mName">
										<h2>
											<b>${sessionScope.loginInfo.memberId}</b>님의 알바의 민족 <b
												style="color: dodgerblue">통합 회원정보</b>
										</h2>
										</p>
									</c:when>
									<c:when test="${sessionScope.loginInfo.sessionType eq '2'}">
										<p class="mName">
										<h2>
											<b>${sessionScope.loginInfo.companyId}</b>님의 알바의 민족 <b
												style="color: dodgerblue">통합 회원정보</b>
										</h2>
										</p>
									</c:when>
								</c:choose>
								<div class="row flex-column">

									<div class="comment-list">
										<div class="single-comment justify-content-between d-flex">
											<div class="user justify-content-between d-flex">
												<div class="thumb"></div>
												<div class="desc">
													<p class="txt">
														안전한 정보보호를 위해 회원정보 일부만 확인가능하며, <br> 수정화면에서 전체 회원정보 열람이
														가능합니다.
													</p>
													<div class="jobs-title">
														<ul class="unordered-list">
															<li>생년월일</li>
															<li>${vo.memberBirth}</li>
															<li>연락처</li>
															<li>${vo.memberPhone}</li>
															<li>e-메일</li>
															<li>${vo.memberEmail}</li>
														</ul>
													</div>
													<a
														href="${pageContext.request.contextPath}/members/mypage/pwCheck?type=1">
														<button type="button" class="genric-btn info-border">수정</button>
													</a>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</section>
						<!-- End comment-sec Area -->
						<!-- Start comment-sec Area -->
						<section class="comment-sec-area py-5">
							<div class="container">
								<h2>비밀번호</h2>
								<div class="row flex-column">
									<div class="comment-list">
										<div class="single-comment justify-content-between d-flex">
											<div class="user justify-content-between d-flex">
												<div class="thumb"></div>
												<div class="desc">
													<p class="txt jobs-title">
														비밀번호를 주기적으로 변경하여<br> 소중한 개인정보를 안전하게 보호하세요(6개월마다 알림)
													</p>
													<p class="rno" style="display: none">${item.recruitNo}</p>
													<div class="reply-btn">
														<a
															href="${pageContext.request.contextPath}/members/mypage/pwCheck?type=2">
															<button type="button" class="genric-btn info-border">변경</button>
														</a>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</section>
						<c:choose>
							<c:when test="${sessionScope.loginInfo.sessionType eq '1'}">
								<!-- Start comment-sec Area -->
								<section class="comment-sec-area py-5">
									<div class="container">
										<h2>간편 로그인 관리</h2>
										<div class="row flex-column">
											<div class="comment-list">
												<div class="single-comment justify-content-between d-flex">
													<div class="user justify-content-between d-flex">
														<div class="thumb"></div>
														<div class="desc jobs-title">
															<p class="txt">소셜서비스 계정과 연결하면, 소셜 로그인으로 간편하게 로그인 할 수
																있습니다.</p>
															<table class="social-icon sns-naver">
																<tr>
																	<td><img
																		src="${pageContext.request.contextPath}/resources/assets/images/naver.png""></td>
																	<td class="social-name">네이버</td>
																	<td><button id="btn_nv" class="genric-btn default"
																			onclick="connection()">연결</button></td>
																</tr>
															</table>
															<!--
					<div class="social-icon sns-kakao">
						<span><img src="${pageContext.request.contextPath}/resources/assets/images/kakao.png""></span>
						<span class="social-name">카카오</span>
						<button id="btn_ka">연결</button>
					</div>
					
					<div class="social-icon sns-facebook">
						<span><img src=""></span>
						<span class="social-name">페이스북</span>
						<button id="btn_fb">연결</button>
					</div>-->
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</section>
							</c:when>
						</c:choose>
						<!-- End comment-sec Area -->

					</div>
				</div>

				<c:choose>
					<c:when
						test="${!empty sessionScope.loginInfo.memberId or !empty sessionScope.loginInfo.companyId }">
						<c:choose>
							<c:when test="${not empty sessionScope.loginInfo.memberId}">
								<!-- 개인회원 노출 -->
								<div class="col-lg-4 sidebar mt-5 mt-lg-0">
									<div class="single-widget category-widget">
										<h4 class="title">마이페이지</h4>
										<ul>
											<li><a
												href="${pageContext.request.contextPath}/members/mypage"
												class="justify-content-between align-items-center d-flex"><span
														class="active">회원정보</span></a></li>
											<li><a
												href="${pageContext.request.contextPath}/recruits/appforyou"
												class="justify-content-between align-items-center d-flex ">맞춤공고
											</a></li>
											<li><a
												href="${pageContext.request.contextPath}/recruits/myrecruits"
												class="justify-content-between align-items-center d-flex ">관심공고</a></li>
											<li><a
												href="${pageContext.request.contextPath}/resumes/allres"
												class="justify-content-between align-items-center d-flex">이력서
													관리</a></li>
										</ul>
									</div>
								</div>
							</c:when>
							<c:otherwise>
								<!-- 기업회원 노출 TODO: 기업서비스-->
								<div class="col-lg-4 sidebar mt-5 mt-lg-0">
									<div class="single-widget category-widget">
										<h4 class="title">마이페이지</h4>
										<ul>
											<li><a
												href="${pageContext.request.contextPath}/members/mypage"
												class="justify-content-between align-items-center d-flex"><span
														class="active">회원정보</span></a></li>
											<li><a
												href="${pageContext.request.contextPath}/applicants/myapplicants"
												class="justify-content-between align-items-center d-flex ">관심인재
											</a></li>
											<li><a
												href="${pageContext.request.contextPath}/recruits/myallrecruit"
												class="justify-content-between align-items-center d-flex ">공고관리
											</a></li>
										</ul>
									</div>
								</div>
							</c:otherwise>
						</c:choose>
					</c:when>
				</c:choose>


			</div>
		</div>
	</section>
	<script>
		function connection() {
			$
					.ajax({
						url : "https://nid.naver.com/oauth2.0/token?grant_type=delete&client_id=LV_HERZOVT4XTBBoYuEl&client_secret=ONiMpnqaLD&access_token=ACCESS_TOKEN",
						type : "post",
						// data : 서버(컨트롤러)로 보내는 데이터.
						// json데이터를 JSON.stringify를 이용하여 String으로 형변환
						data : JSON.stringify(json),
						//이때 전달한 String데이터는 JSON형태의 데이터임을 알려줌.
						contentType : "application/json; charset=utf-8",
						success : function(result) {
							if (result == 0) {
								alert("아이디와 비밀번호를 다시 확인해주세요.");
							} else {
								console.log("로그인 성공")
							}
							//location.href ="${pageContext.request.contextPath}/main"
						},
						error : function(request, status, error) {
							alert("code:" + request.status + "\n" + "message:"
									+ request.responseText + "\n" + "error:"
									+ error);
						}
					});
		}

		let maskingFunc = {
			checkNull : function(str) {
				if (typeof str == "undefined" || str == null || str == "") {
					return true;
				} else {
					return false;
				}
			},
			/* ※ 이메일 마스킹 ex1) 원본 데이터 : abcdefg12345@naver.com 
			변경 데이터 : ab**********@naver.com ex2) 
			원본 데이터 : abcdefg12345@naver.com 
			변경 데이터 : ab**********@nav****** */
			email : function(str) {
				let originStr = str;
				let emailStr = originStr
						.match(/([a-zA-Z0-9._-]+@[a-zA-Z0-9._-]+\.[a-zA-Z0-9._-]+)/gi);
				let strLength;
				if (this.checkNull(originStr) == true
						|| this.checkNull(emailStr) == true) {
					return originStr;
				} else {
					strLength = emailStr.toString().split('@')[0].length - 3;
					// ex1) abcdefg12345@naver.com => ab**********@naver.com 
					// return originStr.toString().replace(new RegExp('.(?=.{0,' + strLength + '}@)', 'g'), '*'); 
					// ex2) abcdefg12345@naver.com => ab**********@nav****** 
					return originStr.toString().replace(
							new RegExp('.(?=.{0,' + strLength + '}@)', 'g'),
							'*').replace(/.{6}$/, "******");
				}
			},
			/* ※ 휴대폰 번호 마스킹 
			ex1) 원본 데이터 : 01012345678, 변경 데이터 : 010****5678 
			ex2) 원본 데이터 : 010-1234-5678, 변경 데이터 : 010-****-5678 
			ex3) 원본 데이터 : 0111234567, 변경 데이터 : 011***4567 
			ex4) 원본 데이터 : 011-123-4567, 변경 데이터 : 011-***-4567 */
			phone : function(str) {
				let originStr = str;
				let phoneStr;
				let maskingStr;
				if (this.checkNull(originStr) == true) {
					return originStr;
				}
				if (originStr.toString().split('-').length != 3) {
					// 1) -가 없는 경우 phoneStr = originStr.length < 11 ? originStr.match(/\d{10}/gi) : originStr.match(/\d{11}/gi); 
					if (this.checkNull(phoneStr) == true) {
						return originStr;
					}
					if (originStr.length < 11) {
						// 1.1) 0110000000 
						maskingStr = originStr.toString().replace(
								phoneStr,
								phoneStr.toString().replace(
										/(\d{3})(\d{3})(\d{4})/gi, '$1***$3'));
					} else { // 1.2) 01000000000 
						maskingStr = originStr.toString().replace(
								phoneStr,
								phoneStr.toString().replace(
										/(\d{3})(\d{4})(\d{4})/gi, '$1****$3'));
					}
				} else { // 2) -가 있는 경우
					phoneStr = originStr.match(/\d{2,3}-\d{3,4}-\d{4}/gi);
					if (this.checkNull(phoneStr) == true) {
						return originStr;
					}
					if (/-[0-9]{3}-/.test(phoneStr)) {
						// 2.1) 00-000-0000 
						maskingStr = originStr.toString().replace(
								phoneStr,
								phoneStr.toString().replace(/-[0-9]{3}-/g,
										"-***-"));
					} else if (/-[0-9]{4}-/.test(phoneStr)) {
						// 2.2) 00-0000-0000 
						maskingStr = originStr.toString().replace(
								phoneStr,
								phoneStr.toString().replace(/-[0-9]{4}-/g,
										"-****-"));
					}
				}
				return maskingStr;
			},

		}
	</script>
	<!-- End blog-posts Area -->
	<c:import url="/WEB-INF/views/template/footer.jsp" />
</body>
</html>