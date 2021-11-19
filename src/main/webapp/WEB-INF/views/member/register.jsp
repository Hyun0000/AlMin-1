<!-- 웹폰트: Noto Sans Korean -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400&display=swap" rel="stylesheet">
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
<link rel="stylesheet" href="<c:url value="/resources/template/css/almin.css"/>">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/animate-3.7.0.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/font-awesome-4.7.0.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/fonts/flat-icon/flaticon.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/bootstrap-4.1.3.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/owl-carousel.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/nice-select.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/style.css">

</head>
<script type="text/javascript">
		$(document).ready(function(){
			// 
			$("#memberJoin").on("click", function(){
				location.href = "${pageContext.request.contextPath}/members";
			});
		};
</script>
<style>
  body{
      font-family: 'Noto Sans KR', sans-serif;
  }
  section {
 		 display: flex;
 		 flex-wrap: wrap;
         max-width: 1200px;
         padding: 0 0 30px 0;
          /* position: relative; */
         bottom: 170px;
         left: 600px;
     }
   .join-group {
   text-align: center;
   }
   .personal-member, .company-member {
   display: inline-block;
   width: 300px;
   height: 500px;
   border: 1px solid #BDBDBD;
   }
</style>
<body>
<!-- 공통헤더 템플릿 -->
<c:import url="/WEB-INF/views/template/header.jsp"/>
<section>
<h2>알바의 민족<br>회원가입을 환영합니다.</h2>
<div class="join-group">
<div class="personal-member">
<h3>이력서를 등록하고<br>알바를 찾아보세요</h3>
<img src="${pageContext.request.contextPath}/resources/assets/images/regist_member.png" alt="개인회원 캐릭터">
<button class="btn1" type="button" id="memberJoin">개인회원가입</button>
</div>
<div class="company-member">
<h3>공고를 등록하고<br>인재를 찾아보세요</h3>
<img src="${pageContext.request.contextPath}/resources/assets/images/regist_company.png" alt="기업회원 캐릭터">
<button class="btn1" type="button" id="companyJoin">기업회원가입</button>
<p class="notice">※ 알바를 채용하시려는 개인사업자, 사업체직원 포함</p>
</div>

</div>
<div></div>
</section>
<!-- 공통푸터 템플릿 -->
<c:import url="/WEB-INF/views/template/footer.jsp"/>
</body>
</html>