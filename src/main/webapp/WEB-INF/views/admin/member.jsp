<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">

<!-- Page Title -->
<title>회원 조회</title>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- Favicon -->
<link rel="shortcut icon"
	href="${pageContext.request.contextPath }/resources/assets/images/logo/favicon.png"
	type="image/x-icon">

<!-- CSS Files -->
<link rel="stylesheet"
	href="<c:url value="/resources/assets/css/almin.css"/>">

<style>
.topleft>ul>li>h4 {
	padding-right: 20px;
	padding-bottom: 20px;
}

.jobs-area {
	min-height: 60%;
}

.job-text>p {
	margin-top: 10px;
	margin-bottom: 10px;
}

.d-toggle {
	display: none;
}

button {
	border: 0;
	outline: 0;
	background-color: transparent
}

.search-bg form {
	background: none;
	margin-bottom: 0;
	padding-bottom: 20px;
	padding-top: 10px;
}

.search-bg form .template-btn {
	background: #1FA5FD
}

.search-bg form input {
	margin-left: 10px;
	margin-right: 10px;
}
</style>

</head>
<body>

	<!-- Preloader Starts -->
	<div class="preloader">
		<div class="spinner"></div>
	</div>
	<!-- Preloader End -->


	<!-- Header Area Starts -->
	<!-- 공통헤더 템플릿 -->

	<c:import url="/WEB-INF/views/template/header.jsp" />

	<!-- Header Area End -->


	<!-- Body Area Starts -->
	<section class="jobs-area section-padding3">
		<div class="container">

			<div class="topleft">
				<ul class="nav nav-tabs" id="myTabA" role="tablist">
					<li class="nav-item"><h4>
							<a class="nav-link active" id="home-tab"
								href="${pageContext.request.contextPath }/admins" role="tab"
								aria-controls="home" aria-selected="true">회원조회</a>
						</h4></li>
					<li class="nav-item"><h4>
							<a class="nav-link" id="profile-tab"
								href="${pageContext.request.contextPath }/report" role="tab"
								aria-controls="profile" aria-selected="false">의심공고</a>
						</h4></li>
				</ul>
			</div>

			<div class="row">
				<div class="col-lg-12">
					<div class="jobs-tab tab-item">
						<ul class="nav nav-tabs" id="myTabB" role="tablist">
							<li class="nav-item"><a class="nav-link" id="home-tab"
								data-toggle="tab" href="#member" role="tab" aria-controls="home">개인회원</a></li>
							<li class="nav-item"><a class="nav-link" id="profile-tab"
								data-toggle="tab" href="#company" role="tab"
								aria-controls="profile">기업회원</a></li>
						</ul>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-lg-12">
					<div class="tab-content" id="myTabContent">
						<div class="tab-pane fade" id="member" role="tabpanel"
							aria-labelledby="home-tab">
							<div class="single-job mb-4 d-lg-flex justify-content-between">
								<div class="job-text">
									<div class="search-area">
										<div class="search-bg">
											<div class="container">
												<div class="row">
													<div class="col-lg-12">
														<form class="d-md-flex" name="frmSearch"
															id="frmMemberSearch">
															<select name="searchOption" required>
																<option value="member_id">아이디</option>
																<option value="member_name">이름</option>
															</select> <input name="searchWord" id="searchWord" type="text"
																required> <input type="button"
																class="template-btn" id="btnMemberSearch" value="검색">
														</form>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div id="memberList">
									</div>
								</div>
							</div>
						</div>
						<div class="tab-pane fade" id="company" role="tabpanel"
							aria-labelledby="profile-tab">
							<div class="single-job mb-4 d-lg-flex justify-content-between">
								<div class="job-text">
									<div class="search-area">
										<div class="search-bg">
											<div class="container">
												<div class="row">
													<div class="col-lg-12">
														<form class="d-md-flex" name="frmSearch"
															id="frmCompanySearch">
															<select name="searchOption" required>
																<option value="company_id">아이디</option>
																<option value="company_name">상호</option>
															</select> <input name="searchWord" id="searchWord" type="text"
																required> <input type="button"
																class="template-btn" id="btnComapnySearch" value="검색">
														</form>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div id="companyList">
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Body Area End -->


	<!-- Footer Area Starts -->
	<footer>
		<c:import url="/WEB-INF/views/template/footer.jsp" />
	</footer>
	<!-- Footer Area End -->


	<!-- Javascript -->
	<script>
		$(function() {
			$("#btnMemberSearch").on('click', getSearchMemberItems);
			$("#btnComapnySearch").on('click', getSearchCompanyItems);
			$('a[data-toggle="tab"]').on('show.bs.tab', getItems);
			$('#myTabB a:first').tab('show');
		});
		function getSearchMemberItems(e) {
			var searchWord = $("#frmMemberSearch #searchWord").val().trim();
			if (searchWord != "") {
				var dataQuery = $("#frmMemberSearch").serialize();
				var url = "";
				url = "${pageContext.request.contextPath}/admins/member";
				$.ajax({
					type : "post",
					url : url,
					data : dataQuery,
					async : false, // show 에서 shown 되지 않도록 async false하여 응답 받을 때 까지 show 상태 유지 
					success : function(data) {
						console.log(data);
						displayMemberList(data, searchWord);
					},
					error : function(error) {
						alert('오류 발생. 오류 코드: ' + error.code);
					}
				});
			}
		}
		function getSearchCompanyItems(e) {
			var searchWord = $("#frmCompanySearch #searchWord").val().trim();
			if (searchWord != "") {
				var dataQuery = $("#frmCompanySearch").serialize();
				var url = "";
				url = "${pageContext.request.contextPath}/admins/company";
				$.ajax({
					type : "post",
					url : url,
					data : dataQuery,
					async : false, // show 에서 shown 되지 않도록 async false하여 응답 받을 때 까지 show 상태 유지 
					success : function(data) {
						console.log(data);
						displayCompanyList(data, searchWord);
					},
					error : function(error) {
						alert('오류 발생. 오류 코드: ' + error.code);
					}
				});
			}
		}
		function getItems(e) {
			var target = $(e.target).attr("href");
			var url = "";
			if ((target == '#member')) {
				url = "${pageContext.request.contextPath}/admins/member";
			} else {
				url = "${pageContext.request.contextPath}/admins/company";
			}
			$.ajax({
				type : "post",
				url : url,
				async : false, // show 에서 shown 되지 않도록 async false하여 응답 받을 때 까지 show 상태 유지 
				success : function(data) {
					console.log(data);
					if ((target == '#member')) {
						displayMemberList(data);
					} else {
						displayCompanyList(data);
					}
				},
				error : function(error) {
					alert('오류 발생. 오류 코드: ' + error.code);
				}
			});
		}
		function displayMemberList(data, searchWord) {
			var uHtml = "";
			if (searchWord != null) {
				uHtml += '<p>' + searchWord + ': 검색결과</p>';
			}
			for (var i = 0; i < data.length; i++) {
				uHtml += '<div class="memberItem">';
				uHtml += '<button onclick="myFunction(this)" class="mid">'
						+ data[i].memberId + '</button>';
				uHtml += '<div class="d-toggle">';
				uHtml += data[i].memberName + data[i].memberPhone + ' '
						+ data[i].memberAddress + ' ';
				uHtml += data[i].memberBirth + ' ' + data[i].memberEmail + ' '
						+ data[i].memberGender + ' ';
				uHtml += data[i].memberAge + ' ' + data[i].memberRegdate + ' ';
				uHtml += '<button class="genric-btn primary small deletemm">탈퇴</button>';
				uHtml += '</div>';
				uHtml += '</div>';
			}
			$("#memberList").html(""); // <div id="memberList"> 아래  모든 memberItem 삭제
			$("#memberList").append(uHtml); // <div id="memberList"> 아래 자식 태그로 uHtml 추가

			// .deletemm 엘리먼트가 추가된 후 다시 설정되어야 함.
			// 만약 이 방식이 신경쓰기 힘들다면 myFunction(this) 과 같은 방식으로 작성하세요.
			$("#memberList .deletemm").click(deletemm);
		}
		function displayCompanyList(data, searchWord) {
			var uHtml = "";
			if (searchWord != null) {
				uHtml += '<p>' + searchWord + ': 검색결과</p>';
			}
			for (var i = 0; i < data.length; i++) {
				/* 
				<div class="companyItem">
				<button onclick="myFunction(this)" class="cid">${item.companyId}</button>
				<div class="d-toggle">
					${item.companyName}${item.companyTel} ${item.companyBoss}
					${item.companyEmail} ${item.companyAddress}
					${item.companyNum}
					<button class="genric-btn primary small deletecm">탈퇴</button>
				</div>
				</div> 
				 */
				uHtml += '<div class="companyItem">';
				uHtml += '<button onclick="myFunction(this)" class="cid">'
						+ data[i].companyId + '</button>';
				uHtml += '<div class="d-toggle">';
				uHtml += data[i].companyName + data[i].companyTel + ' '
						+ data[i].companyBoss + ' ';
				uHtml += data[i].companyEmail + ' ' + data[i].companyAddress
						+ ' ';
				uHtml += data[i].companyNum + ' ';
				uHtml += '<button class="genric-btn primary small deletecm">탈퇴</button>';
				uHtml += '</div>';
				uHtml += '</div>';
			}
			$("#companyList").html(""); // <div id="memberList"> 아래  모든 memberItem 삭제
			$("#companyList").append(uHtml); // <div id="memberList"> 아래 자식 태그로 uHtml 추가

			// .deletecm 엘리먼트가 추가된 후 다시 설정되어야 함.
			// 만약 이 방식이 신경쓰기 힘들다면 myFunction(this) 과 같은 방식으로 작성하세요.
			$("#companyList .deletecm").click(deletecm);
		}
	</script>
	<script>
		function myFunction(targetEle) {
			console.log(targetEle);
			var $togggleEle = $(targetEle).next();
			$togggleEle.toggle();
		}
	</script>
	<script>
		function deletemm() {
			var mid = $(this).parent().prev(".mid").text();
			var $itemEle = $(this).parents(".memberItem");
			if (confirm('정말 탈퇴처리하시겠습니까?')) {
				$.ajax({
					type : "post",
					url : "${pageContext.request.contextPath}/admins/demember",
					data : {
						memberId : mid
					},
					success : function(data) {
						if (data == "OK") {
							alert('회원이 탈퇴처리되었습니다.');
							$itemEle.remove();
						}
					},
					error : function(error) {
						alert('오류 발생. 오류 코드: ' + error.code);
					}
				});
			} else {
				return false;
			}
		}

		function deletecm() {
			var cid = $(this).parent().prev(".cid").text();
			var $itemEle = $(this).parents(".companyItem");
			if (confirm('정말 탈퇴처리하시겠습니까?')) {
				$.ajax({
							type : "post",
							url : "${pageContext.request.contextPath}/admins/decompany",
							data : {
								companyId : cid
							},
							success : function(data) {
								if (data == "OK") {
									alert('회원이 탈퇴처리되었습니다.');
									$itemEle.remove();
								}
							},
							error : function(error) {
								alert('오류 발생. 오류 코드: ' + error.code);
							}
						});
			} else {
				return false;
			}
		}
	</script>
</body>


</html>
