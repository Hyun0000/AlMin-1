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
<link rel="stylesheet" href="<c:url value='/resources/member/css/member.css'/>">
</head>
<body>
<!-- 공통헤더 템플릿 -->
<c:import url="/WEB-INF/views/template/header.jsp"/>
<section class="contact-form section-padding3">
<table>
    <tr>
	    <td>
	        <a href="${pageContext.request.contextPath}/members/id" class="box-sizing">아이디 찾기</a>
	        <a href="${pageContext.request.contextPath}/members/pwd" class="box-sizing">비밀번호 찾기</a>
	    </td>
    </tr>
</table>
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-top text-center">
                        <h2>아이디 찾기 결과</h2>
                        입력하신 정보와 일치하는 <span class="mon-orange">아이디가 <span>1</span>개</span> 있습니다.
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

            <div class="search-buttons section-padding2">
                <button type="button" class="genric-btn primary radius" onclick="openLogin()">로그인</button>
            </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
	<!-- 공통푸터 템플릿 -->
<c:import url="/WEB-INF/views/template/footer.jsp"/>
<script>
function openLogin(){
	location.href = "${pageContext.request.contextPath}/logins"
}
</script>
</body>
</html>