<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>알바의 민족 전체회원조회</title>
<!-- Favicon -->
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/resources/assets/images/logo/favicon.png" type="image/x-icon">
<!-- CSS Files -->
<link rel="stylesheet" href="<c:url value='/resources/assets/css/almin.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/member/css/member.css'/>">
<style>
  table {
  text-align: center;
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
<c:import url="/WEB-INF/views/template/header.jsp"/>
<h1>회원리스트<h1>
<c:if test="${memberview != null || ''}">
<table>
<tr>
<th>아이디</th> 
<th>회원타입</th>
<th>이름</th>
</tr>
<!--ArrayList니까 for문 돌리기!! -->
<c:forEach items="${memberview}" var = "list">
<tr>
<td>${list.memberId}</td><!-- 대소문자 틀리면 출력안됨. -->
<c:if test="${list.memberType == 0}">
<td>관리자</td>
</c:if>
<c:if test="${list.memberType == 1}">
<td>개인</td>
</c:if>
<c:if test="${list.memberType == 2}">
<td>기업</td>
</c:if>
<td>${list.memberName}</td>
</tr>
</c:forEach>
</table>
</c:if>
<!-- 공통푸터 템플릿 -->
<c:import url="/WEB-INF/views/template/footer.jsp"/>
</body>
</html>