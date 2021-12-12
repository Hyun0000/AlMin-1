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
<link rel="stylesheet" href="<c:url value='/resources/member/css/member.css'/>">
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
			}else if(userPass != pwChk){
				alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
				return false;
			} else{
				var json = {//'memberId':  $("#userId").val(),
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
				if(result == ""){
					alert("비밀번호 수정 실패");
				} else {
					alert("비밀번호 수정 성공");
			location.href ="${pageContext.request.contextPath}/main"
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

<table>
    <tr>
	    <td>
	        <a href="${pageContext.request.contextPath}/members/id" class="box-sizing">아이디 찾기</a>
	        <a href="${pageContext.request.contextPath}/members/pwd" class="box-sizing">비밀번호 찾기</a>
	    </td>
    </tr>
</table>
<section class="contact-form section-padding3">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 mb-5 mb-lg-0">
                    <div class="d-flex">
                        <div class="into-icon">
                            <i class="fa fa-home"></i>
                        </div>
                        <div class="info-text">
                        </div>
                    </div>
                    <div class="d-flex">
                        <div class="into-icon">
                            <i class="fa fa-phone"></i>
                        </div>
                        <div class="info-text">
                        </div>
                    </div>
                    <div class="d-flex">
                        <div class="into-icon">
                            <i class="fa fa-envelope-o"></i>
                        </div>
                        <div class="info-text">
                        </div>
                    </div>
                </div>
                <div class="col-lg-9">
                    <form action="#">
                        <div>
                           <h3>새 비밀번호를 입력해 주세요.</h3><br>
                            <h4>비밀번호</h4>
                           <input type="password" id="userPass" placeholder="8~16자 영문, 숫자, 특수문자" required><span id="pwCmt" class="cmt"></span>
                            <br><h4>비밀번호 확인</h4>
                            <input type="password" id="pwChk"><span id="pwChkCmt" class="cmt"></span>
                        <button type="submit" class="template-btn" id="nextBtn">다음</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>
	<!-- 공통푸터 템플릿 -->
<c:import url="/WEB-INF/views/template/footer.jsp"/>
</body>
</html>