<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>알바의 민족 회원정보 수정</title>
<!-- Favicon -->
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/resources/assets/images/logo/favicon.png" type="image/x-icon">
<!-- CSS Files -->
<link rel="stylesheet" href="<c:url value='/resources/assets/css/almin.css'/>">
<script>
$(document).ready(function(){
		$("#editBtn").click(function(){ //수정완료 클릭 시
		console.log("수정완료버튼 클릭");
	var uid2 = $("#uid2").html();
		console.log("id: "+uid2);
		var json = {
				'memberId':$("#uid2").html(),
				'memberPhone':$("#memberPhone").val(),
				'memberEmail':$("#memberEmail").val()
			};
				//'memberPhone':$("#phone1").val()+"-"+$("#phone2").val()+"-"+$("#phone3").val()
		console.log(json);
		$.ajax({
			url: "${pageContext.request.contextPath}/members",
			type: "put",
			 // data : 서버(컨트롤러)로 보내는 데이터.
			 // json데이터를 JSON.stringify를 이용하여 String으로 형변환
			data: JSON.stringify(json),
			//이때 전달한 String데이터는 JSON형태의 데이터임을 알려줌.
			contentType : "application/json; charset=utf-8",
			success: function(result){
				if(result == ""){
					alert("회원정보 수정 실패");
				} else {
					alert("회원정보 수정 성공");
					//TODO: 회원정보 페이지로 이동
			location.href ="${pageContext.request.contextPath}/members/mypage"
				}
		},
		error:function(request,status,error){
			alert("code:"+request.status+"\n"+"message:"+request.responseText+
					"\n"+"error:"+error);
		}
		});
	})
});
</script>
</head>
<body>
<!-- 공통헤더 템플릿 -->
<c:import url="/WEB-INF/views/template/header.jsp"/>
<section>
<h2>회원정보수정</h2>
<div id="editForm" class="hide">
	<ul>
	<li>회원정보는 <a href="#">개인정보처리방침</a>에 따라 안전하게 보호되며, 회원님의 동의 없이 공개 또는 제 3자에게 제공되지 않습니다.</li>
		<li>이름, 생년월일, 성별 정보는 고객센터를 통해 수정하실 수 있습니다.  </li>
	</ul>
    <table class="find-form">
     <tr>
            <!-- 회원정보에 등록된 아이디 -->
		<th>아이디</th>
		<td id="uid2">${vo.memberId}</td>
	</tr>
     <tr>
		<th>이름</th>
		<td>${vo.memberName}</td>
	</tr>
     <tr>
		<th>생년월일(나이)</th>
		<td>${vo.memberBirth}(${vo.memberAge}세)</td>
	</tr>
     <tr>
		<th>성별</th>
		<td>${vo.memberGender}</td>
	</tr>
     <tr>
		<th>휴대폰</th>
		<td ><input id="memberPhone" type="text" value="${vo.memberPhone}"></td>
	</tr>
     <tr>
		<th>이메일</th>
		<td><input id="memberEmail" type="text" value="${vo.memberEmail}"></td>
	</tr>
     <tr>
		<th>가입일</th>
		<td>${vo.memberRegdate}</td>
	</tr>
  </table>
   <div class="search-buttons">
          <button type="button" class="btn1" id="editBtn">수정완료</button>
     </div>
</div>
</section>
	<!-- 공통푸터 템플릿 -->
<c:import url="/WEB-INF/views/template/footer.jsp"/>
</body>
</html>