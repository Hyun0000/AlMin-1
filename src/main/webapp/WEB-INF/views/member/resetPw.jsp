<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>알바의 민족 새 비밀번호 입력</title>
<!-- Favicon -->
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/resources/assets/images/logo/favicon.png" type="image/x-icon">
<!-- CSS Files -->
<link rel="stylesheet" href="<c:url value='/resources/assets/css/almin.css'/>">
<style>
th {
width:150px;
}
.box-sizing{
width: 200px;
}
/* 입력란 */
input[type=text], input[type=password]{
background-color: #f9f9ff;
border: none;
  padding: 12px;
  border-radius: 4px;
  margin: 8px 0;
  opacity: 0.85;
  display: inline-block;
  font-size: 17px;
  line-height: 20px;
  text-decoration: none;
}
</style>
<script>
$(document).ready(function(){
	var pwPattern =/^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$^!%*#?&])[A-Za-z\d$@$!^%*#?&]{6,}$/;
	$("#userPass").on("keyup", function(){
		var userPass = $("#userPass").val();
		var html = "";
		console.log("입력한 새 비밀번호: "+userPass);
		if(!pwPattern.test(userPass)){
			console.log("정규식XXX");
			 html+="영문, 숫자, 특수문자 포함 6자 이상 입력";
		} else{
			html+="비밀번호 양식에 부합합니다.";
			$("#pwCmt").css({"color":"green"});
		}  $("#pwCmt").html(html);
	})
	
	$("#pwChk").on("keyup", function(){
		var userPass = $("#userPass").val();
		var pwChk = $("#pwChk").val();
		var html = "";
		if($("#userPass").val()==""){
			 html+="먼저 비밀번호를 입력해주세요.";
			$("#userPass").focus();
		} else if(userPass != pwChk){
			 html+="비밀번호가 일치하지 않습니다.";
		} else{
			 html+="비밀번호가 일치합니다.";
			$("#pwChkCmt").css({"color":"green"});
		}
		$("#pwChkCmt").html(html);
	})
	
	$("#nextBtn").on("click", function(){
			if($("#userPass").val()==""){
				alert("새 비밀번호를 입력해주세요.");
				$("#userPass").focus();
				return false;
			}else{
				var json = {
						'memberPw': $("#userPass").val()
						};
		console.log(json);
		$.ajax({
			url: "${pageContext.request.contextPath}/members/pwd",
			type: "put",
			 // data : 서버(컨트롤러)로 보내는 데이터.
			 // json데이터를 JSON.stringify를 이용하여 String으로 형변환
			data: JSON.stringify(json),
			//이때 전달한 String데이터는 JSON형태의 데이터임을 알려줌.
			contentType : "application/json; charset=utf-8",
			success: function(result){
				if(result == false){
					alert("비밀번호 수정 실패");
				} else {
					alert("비밀번호 수정 성공");
			location.href ="${pageContext.request.contextPath}/members/mypage"
				}
		},
		error:function(request,status,error){
			alert("code:"+request.status+"\n"+"message:"+request.responseText+
					"\n"+"error:"+error);
		}
		});
			}//else문 끝
		})
});
</script>
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
                         <h3>새 비밀번호를 입력해 주세요.</h3><br>
           <br>
   <table class="section-top">
    <tr>
    <td> <h4>비밀번호</h4></td>
    <td><input type="password" id="userPass" placeholder="8~16자 영문, 숫자, 특수문자"  required></td>
    <td><span id="pwCmt" class="cmt"></span></td>
	</tr>
	<tr>
                  <td><br><h4>비밀번호 확인</h4></td>
                  <td><input type="password" id="pwChk" ></td>
                  <td><span id="pwChkCmt" class="cmt"></span></td>
	</tr>
   </table>
<div class="search-buttons">
                        <button type="submit" class="genric-btn primary radius" id="nextBtn">다음</button>
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
</body>
</html>