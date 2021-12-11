<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>알바의 민족 회원정보 수정 전 단계</title>
<!-- Favicon -->
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/resources/assets/images/logo/favicon.png" type="image/x-icon">
<!-- CSS Files -->
<link rel="stylesheet" href="<c:url value='/resources/assets/css/almin.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/member/css/member.css'/>">
<script>
$(document).ready(function(){
	var choose = "edit"; //회원정보수정 / 비밀번호 변경 선택여부
	
 	$(".hide").hide(); 
	$("#edit").css({
		"background-color":"#f8b600",
		"color":"white",
		"border":"3px solid #f8b600"
	});
	$("#changeForm").hide();
	$("#editForm").show();
	
	$("#edit").click(function(){
		console.log("회원정보수정 선택");
		choose="edit";
		$("#edit").css({
			"background-color":"#f8b600",
			"color":"white",
			"border":"3px solid #f8b600"
		});
		$("#change").css({
			"background-color":"white",
			"color":"black",
			"border":"3px solid #FAE100"
		});
		$("#changeForm").hide();
		$("#editForm").show();
		})
		
	$("#change").click(function(){
		console.log("비밀번호 변경 선택");
	    choose="change";
		$("#change").css({
			"background-color":"#f8b600",
			"color":"white",
			"border":"3px solid #f8b600"
		});
		$("#edit").css({
			"background-color":"white",
			"color":"black",
			"border":"3px solid #FAE100"
		});
		$("#editForm").hide();
		$("#changeForm").show();
		})
		var pwPattern =/^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$^!%*#?&])[A-Za-z\d$@$!^%*#?&]{6,}$/;
			
		$("#newPw").on("keyup", function(){
			var userPass = $("#newPw").val();
			var html = "";
			console.log("입력한 비밀번호: "+userPass);
			if(!pwPattern.test(userPass)){
				console.log("정규식XXX");
				 html+="영문, 숫자, 특수문자 포함 6자 이상 입력";
			} else{
				html+="비밀번호 양식에 부합합니다.";
				$("#pwCmt").css({"color":"green"});
			}  $("#pwCmt").html(html);
		})
		
		$("#newPwChk").on("keyup", function(){
				var userPass = $("#newPw").val();
				var pwChk = $("#newPwChk").val();
				var html = "";
				if($("#newPw").val()==""){
					 html+="먼저 비밀번호를 입력해주세요.";
					$("#newPw").focus();
				} else if(userPass != pwChk){
					 html+="비밀번호가 일치하지 않습니다.";
				} else{
					 html+="비밀번호가 일치합니다.";
					$("#pwChkCmt").css({"color":"green"});
				}
				$("#pwChkCmt").html(html);
			})
		
		$("#editBtn").click(function(){ //확인 클릭 시***회원정보 수정 페이지로 이동**비번일치여부 확인***
		console.log("확인버튼 클릭");
		if(choose == "edit"){
			var url="${pageContext.request.contextPath}/members/mypage/pwd";
			var json = {
					'memberPw':$("#userPw").val(),
					'memberId':$("#uid").html()
						};
			
		} else if(choose == "change"){//비밀번호 변경
				if($("#userName").val()==""){
					alert("비밀번호를 입력해주세요.")
					return false;
				}  else{
					var url="${pageContext.request.contextPath}/members/id/phone";
					json = {
							//'memberPw':$("#userPw").val(),
							//'memberId':$("#uid").html()
					}
				}
		}
		
		console.log(json);
		$.ajax({
			url: url,
			type: "post",
			 // data : 서버(컨트롤러)로 보내는 데이터.
			 // json데이터를 JSON.stringify를 이용하여 String으로 형변환
			data: JSON.stringify(json),
			//이때 전달한 String데이터는 JSON형태의 데이터임을 알려줌.
			contentType : "application/json; charset=utf-8",
			success: function(result){
				if(result == false){
					alert("비밀번호가 일치하지 않습니다.");
				} else {
					//TODO: 일치하는 n개의 아이디를 찾았습니다(화면 생성)
					alert("비밀번호가 일치합니다.");
				console.log($("#uid").html());
			location.href ="${pageContext.request.contextPath}/members/mypage/edit?userId="+$("#uid").html() //회원정보수정
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
<div class="tab btngroup">
        <button type="button" class="tab-item tab1" id="edit"
					autofocus>회원정보수정</button>
       <button type="button" class="tab-item tab1 active"
					id="change">비밀번호 변경</button>
</div>
<div id="editForm" class="hide">
	<ul>
		<li>회원님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한 번 입력해 주세요.</li>
		<li>비밀번호는 타인에게 노출되지 않도록 주의해 주세요.</li>
	</ul>
    <table class="find-form">
     <tr>
            <!-- 회원정보에 등록된 아이디 -->
		<th>아이디</th>
		<td id="uid">${sessionScope.loginInfo.memberId}</td>
	</tr>
	<tr>
		<th>비밀번호</th>
		<td><input type="password" name="userPw" id="userPw"
				maxlength="20" placeholder="비밀번호"></td>
	</tr>
  </table>
   <div class="search-buttons">
          <button type="button" class="btn1" id="editBtn">확인</button>
     </div>
</div>

 <div id="changeForm" class="hide">
 <ul>
	<li>개인정보를 안전하게 보호하기 위해  비밀번호를 주기적(6개월)으로 변경해 주세요.</li>
	<li>비밀번호는 6~16자의 영문 대소문자, 숫자, 특수문자를 조합하여 사용하실 수 있습니다.<br></li>
	<li class="tooltip">안전한 비밀번호 설정
	<span class="tooltiptext">안전한 비밀번호 작성법
	비밀번호 작성시 타인 또는 컴퓨터 프로그램을 이용하여
	쉽게 비밀번호를 알아 낼 수 없도록 숫자, 영문자, 특수문자 조합을 권장 합니다.</span>
	</li>
</ul>
 <table class="find-form">
    <tr>
		<th>현재 비밀번호</th>
			<td><input type="password" name="nowPw" id="nowPw"
							maxlength="20" placeholder="현재 비밀번호">
              <span id="nwpwCmt"></span>
           </td>
	<tr>
		<th>새 비밀번호</th>
			<td><input type="password" name="newPw" id="newPw"
							maxlength="20" placeholder="새 비밀번호">
              <span id="pwCmt"></span>
           </td>
	</tr>
	<tr>
		<th>새 비밀번호 확인</th>
			<td><input type="password" name="newPwChk" id="newPwChk"
							maxlength="20" placeholder="새 비밀번호 확인">
              <span id="pwChkCmt"></span>
           </td>
	</tr>
  </table>
  <div class="btnGroup">
          <button type="button" class="btn1" id="changeBtn">수정완료</button>
     </div>
</div>

</section>
	<!-- 공통푸터 템플릿 -->
<c:import url="/WEB-INF/views/template/footer.jsp"/>
</body>
</html>