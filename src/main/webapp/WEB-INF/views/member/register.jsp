<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 선택페이지</title>

<!-- Favicon -->
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/resources/assets/images/logo/favicon.png" type="image/x-icon">

<!-- CSS Files -->
<link rel="stylesheet" href="<c:url value='/resources/assets/css/almin.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/member/css/member.css'/>">
</head>
<script type="text/javascript">
		$(document).ready(function(){
			// 
			$("#memberJoin").on("click", function(){
				location.href = "${pageContext.request.contextPath}/members";
			});
		});
</script>
<style>
   .personal-member, .company-member { /* flex-direction와 flex-wrap의 단축 속성 */
   	display: inline-flex;
	/* row, row-reverse, column, column-reverse 
	nowrap wrap wrap-reverse */
	flex-flow: column wrap;
	/* flex-start, flex-end, center, space-between, space-around */
	justify-content: flex-start;
	align-content: stretch;
	align-items: center;
   text-align: center;
   margin: 0 100px 0 0;
   width: 400px;
   height: 600px;
   border: 1px solid #BDBDBD;
   }
</style>
<body>
<!-- 공통헤더 템플릿 -->
<c:import url="/WEB-INF/views/template/header.jsp"/>
<section class="container">
<h2>알바의 민족<br>회원가입을 환영합니다.</h2>
<div class=" section-padding2">
<div class="personal-member section-padding">
<h3 class="item">이력서를 등록하고<br>알바를 찾아보세요</h3>
<img src="${pageContext.request.contextPath}/resources/assets/images/regist_member.png" class="item" alt="개인회원 캐릭터">
<button class="btn1 item" type="button" id="memberJoin">개인회원가입</button>
</div>
<div class="company-member section-padding">
<h3 class="item">공고를 등록하고<br>인재를 찾아보세요</h3>
<img src="${pageContext.request.contextPath}/resources/assets/images/regist_company.png" class="item" alt="기업회원 캐릭터">
<button class="btn1 item" type="button" id="companyJoin">기업회원가입</button>
<p class="notice item">※ 알바를 채용하시려는 개인사업자, 사업체직원 포함</p>
</div>

</div>
<div></div>
</section>
<!-- 공통푸터 템플릿 -->
<c:import url="/WEB-INF/views/template/footer.jsp"/>
</body>
</html>