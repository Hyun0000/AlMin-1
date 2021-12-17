<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>알바의 민족 아이디 찾기</title>
<!-- Favicon -->
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/resources/assets/images/logo/favicon.png" type="image/x-icon">
<!-- CSS Files -->
<link rel="stylesheet" href="<c:url value='/resources/assets/css/almin.css'/>">
<style>
.box-sizing{
width: 200px;
}
</style>
</head>
<body>
<!-- 공통헤더 템플릿 -->
<c:import url="/WEB-INF/views/template/header.jsp"/>
<section class="job-single-content section-padding">
	<div class="container">
			<div class="row">
				<div class="col-lg-8">
						<div class="main-content">
							<div class="single-content1">
								<div class="mb-4 d-lg-flex justify-content-between">
									<div class="job-text">
    <h2>아이디 찾기 결과</h2>
           <br>
  <div class="content-wrap">
 <div class="item-group">
     입력하신 정보와 일치하는 <span class="mon-orange">아이디가 <span>1</span>개</span> 있습니다.
      <br><br>
</div>																		
</div>
<div class="desc">
   <div class="section-top text-center">
                        
                         <div class="find-form">
                            <div class="form-item match-list">
                                <div class="form-table form-title">
                                    <span class="">아이디: ${vo.memberId}</span>
                                </div>
                                <div class="form-table form-data">
                                    <span>가입일 : ${vo.memberRegdate}</span>
                                </div>
                            </div>
                </div>
                    </div>
<div class="search-buttons">
                <a href="${pageContext.request.contextPath}/logins"><button type="button" class="genric-btn primary radius">로그인</button></a>
            </div>
 </div>
									</div>
								</div>
							</div>
						</div>
				</div>
				<div class="col-lg-4">
						<div class="sidebar mt-5 mt-lg-0">
							<div class="mb-4">
							<ul>
      <li><a href="${pageContext.request.contextPath}/members/id" class="box-sizing genric-btn success medium">아이디 찾기</a></li>
      <li><a href="${pageContext.request.contextPath}/members/pwd" class="box-sizing genric-btn success-border medium">비밀번호 찾기</a></li>
                           </ul>
								</div>
							</div>
						</div>
				</div>
			</div>
		</div>
</section>
	<!-- 공통푸터 템플릿 -->
<c:import url="/WEB-INF/views/template/footer.jsp"/>
<script>
$("#mBtn").css({
	"background-color":"#f8b600",
	"color":"white",
	"border":"3px solid transparent"
});

$("#mBtn").click(function(){
	console.log("개인회원 선택");
	$("#mBtn").css({
		"background-color":"#f8b600",
		"color":"white",
		"border":"3px solid transparent"
	});
	$("#cBtn").css({
		"background-color":"#f9f9ff",
		"color":"black",
		"border":"3px solid transparent"
	});
	})
	
$("#cBtn").click(function(){
	console.log("기업회원 선택");
	$("#cBtn").css({
		"background-color":"#f8b600",
		"color":"white",
		"border":"3px solid transparent"
	});
	$("#mBtn").css({
		"background-color":"#f9f9ff",
		"color":"black",
		"border":"3px solid transparent"
	});
	})
</script>
</body>
</html>