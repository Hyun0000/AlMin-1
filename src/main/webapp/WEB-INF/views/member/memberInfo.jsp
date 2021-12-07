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
<link rel="stylesheet" href="<c:url value="/resources/assets/css/almin.css"/>">
<link rel="stylesheet" href="<c:url value='/resources/member/css/member.css'/>">
<style>
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
    font-family: Malgun Gothic,"\B9D1\C740 \ACE0\B515",dotum,"\B3CB\C6C0",arial,sans-serif;
    font-size: 12px;
}
.mInfo {
    position: relative;
    float: left;
    width: 390px;
    height: 200px;
    margin: 0 15px 15px 0;
    padding: 30px;
    border: 1px solid #ddd;
}
.mPw {
    position: relative;
    float: left;
    width: 390px;
    height: 200px;
    padding: 30px;
    border: 1px solid #ddd;
}
.mSns {
    padding: 30px;
    border: 1px solid #ddd;
    float: left;
    width: 390px;
    height: 200px;
}
</style>
<script type="text/javascript">
$(document).ready(function(){
	// 취소
	$(".cancel").on("click", function(){
		
	});
	});
	
$.ajax({
	url : "/member/passChk",
	type : "POST",
	dateType : "json",
	data : $("#updateForm").serializeArray(),
	success: function(data){
		if(data==true){
			if(confirm("회원수정하시겠습니까?")){
1							}
		}else{
			alert("패스워드가 틀렸습니다.");
			return;
		}
	}
})
</script>
</head>
<body>
	<!-- 공통헤더 템플릿 -->
<c:import url="/WEB-INF/views/template/header.jsp" />
<section>
<div id="container">
		<p class="mName"><em class="id">chsh9410</em>님의 알바의 민족 <em>통합 회원정보</em></p>
		<p class="mTip">알바몬을 더 이상 이용하지 않는다면 <a href="http://www.albamon.com/customer/mon_leave_info.asp">회원탈퇴</a></p>
		<div class="mInfoWrap">

			<!--// 회원정보 -->
			<div class="mInfo">
				<h2><img src="/monimg/list/mlist/gg_tit_1.gif" alt="회원정보"></h2>
				<p class="txt">안전한 정보보호를 위해 연락처 일부만 확인가능하며,<br> 수정화면에서 정확한 연락처 확인이 가능합니다.</p>
				<dl>
					<dt>최근수정일</dt>
					<dd>2020-05-22</dd>
					<dt>연락처</dt>
					<dd>010-8***-***0</dd>
					<dt>e-메일</dt>
					<dd>ys****@n****.com</dd>
					<dt>주소</dt>
					<dd>서울 성동구  ******</dd>
				</dl>
				<p class="btn"><a href="/Account/mem/edit-check">수정</a></p>
			</div>


			<!--// 비밀번호-->
			<div class="mPw">
				<h2><img src="/monimg/list/mlist/gg_tit_2.gif" alt="비밀번호"></h2>

				<div class="snsMem">
				
					<p class="txt">비밀번호를 주기적으로 변경하여<br> 소중한 개인정보를 안전하게 보호하세요(6개월마다 알림)</p>
					<dl>
						<dt>최근변경일</dt>
						<dd>2009년 10월 25일
						(<em>21일</em> 후 변경 알림 예정)</dd>
						
					</dl>
					<p class="btn"><a href="/Account/mem/ChangePWD">변경</a></p>
				
				</div>
			</div>

			<!--// 간편 로그인 관리 -->
			<div class="mSns">
				<h2><img src="/monimg/list/mlist/gg_tit_4.gif" alt="간편 로그인 관리"></h2>
				<p class="txt">소셜서비스 계정과 연결하면, 소셜 로그인으로 간편하게 로그인 할 수 있습니다.</p>
				<div class="social-list">
					
					<div class="social-icon sns-naver">
						<span class="social-name">네이버</span>
						<button id="btn_nv" onclick="connection()">연결</button>
					</div>
					
					<div class="social-icon sns-kakao">
						<span class="social-name">카카오</span>
						<button id="btn_ka">연결</button>
					</div>
					
					<div class="social-icon sns-facebook">
						<span class="social-name">페이스북</span>
						<button id="btn_fb">연결</button>
					</div>
					
				</div>
			</div>
			
		</div>

	</div>
	<script>
	function connection(){
		$.ajax({
			url: "https://nid.naver.com/oauth2.0/token?grant_type=delete&client_id=LV_HERZOVT4XTBBoYuEl&client_secret=ONiMpnqaLD&access_token=ACCESS_TOKEN",
			type: "post",
			 // data : 서버(컨트롤러)로 보내는 데이터.
			 // json데이터를 JSON.stringify를 이용하여 String으로 형변환
			data: JSON.stringify(json),
			//이때 전달한 String데이터는 JSON형태의 데이터임을 알려줌.
			contentType : "application/json; charset=utf-8",
			success: function(result){
				if(result == 0){
					alert("아이디와 비밀번호를 다시 확인해주세요.");
				} else {
					console.log("로그인 성공")
	    		$(".modal").hide(); 
				$("#login-state").show();//로그아웃, 마이페이지
				$("#logout-state").hide();//로그인, 회원가입
				}
			//location.href ="${pageContext.request.contextPath}/main"
		},
		error:function(request,status,error){
			alert("code:"+request.status+"\n"+"message:"+request.responseText+
					"\n"+"error:"+error);
		}
		});
	}
	</script>
</section>
	<!-- Start blog-posts Area -->
<section class="blog-posts-area section-padding">
	<div class="container">
		<div class="row">

			<div class="col-lg-8 post-list blog-post-list">
				<div class="single-post">

						<!-- Start comment-sec Area -->
<section class="comment-sec-area py-5">
		<c:forEach var="item" items="${recruits}">
				<div class="container">
					<div class="row flex-column">

						<div class="comment-list">
							<div class="single-comment justify-content-between d-flex">
								<div class="user justify-content-between d-flex">
									<div class="thumb"></div>
									<div class="desc">
										<h5>
											<a href="#">${item.recruitTitle}</a>
										</h5>
										<p class="rno" style="display: none">${item.recruitNo}</p>
										<p class="date">${item.recruitDate}</p>
										<div class="reply-btn">
											<button type="button" class="template-btn">지원하기</button>
											<button class="template-btn" onclick="location.href='${pageContext.request.contextPath}/recruits/dislike?recruitNo=${item.recruitNo}'">	찜 해제</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
		</c:forEach>
	</section>
<!-- End comment-sec Area -->
<!-- 공통 사이드바 jsp -->
<c:import url="/WEB-INF/views/template/mypage_aside.jsp" />
					</div>
				</div>
				
			</div>
		</div>
	</section>
	<!-- End blog-posts Area -->
	<c:import url="/WEB-INF/views/template/footer.jsp" />
</body>
</html>