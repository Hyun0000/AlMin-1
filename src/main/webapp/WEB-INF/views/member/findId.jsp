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
th {
width:150px;
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
.primary-border{
width: 300px;
}
a {
text-decoration:none;
}
.box-sizing{
width: 200px;
}
.job-text{
margin: 0 auto;
}
</style>
<script>
$(document).ready(function(){
	var choose = "member"; //개인회원 / 기업회원 선택여부
	var way = "tel"; //연락처 / 이메일 / 사업자번호 선택여부
	
 	$(".hide").hide(); 
 	$("#dev_certForm1").show(); 
    
	$("#mBtn").css({
		"background-color":"#f8b600",
		"color":"white",
		"border":"3px solid transparent"
	});
	
	$("#mBtn").click(function(){
		console.log("개인회원 선택");
		choose="member";
		  $(".search_num").hide(); //사업자등록번호로 찾기
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
		  $(".search_num").show(); //사업자등록번호로 찾기
	    choose="company";
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
		var namePattern = /^[a-zA-Z가-힣]*$/;
			
		$("#dev_search_tel").change(function(){//연락처로 찾기
			way = "tel";
		    $("#dev_certForm1").show(); 
		    $("#dev_certForm5").hide(); //사업자번호 input
		    $("#dev_certForm2").hide(); 
		    $("#userName").on("keyup", function(){
		    	var userName = $("#userName").val();
				var html = "";
				if(!namePattern.test(userName)){
					 html+="영문 또는 한글만 입력해주세요.";
				} $("#nmCmt").html(html);
			})
		});
		$("#dev_search_mail").change(function(){//이메일로 찾기
			way = "mail";
		    $("#dev_certForm2").show(); 
		    $("#dev_certForm5").hide(); //사업자번호 input
		    $("#dev_certForm1").hide(); 
		    $("#userName2").on("keyup", function(){
				var userName = $("#userName2").val();
				var html = "";
				if(!namePattern.test(userName)){
					 html+="영문 또는 한글만 입력해주세요.";
				} $("#nm2Cmt").html(html);
			})
		});
		$("#dev_search_num").change(function(){//사업자번호로 찾기
			way = "num";
		    $("#dev_certForm5").show(); //사업자번호 input
		    $("#dev_certForm1").hide(); 
		    $("#dev_certForm2").hide(); 
		    $("#userName3").on("keyup", function(){
				var userName = $("#userName3").val();
				var html = "";
				if(!namePattern.test(userName)){
					 html+="영문 또는 한글만 입력해주세요.";
				} $("#nm3Cmt").html(html);
			})
		});
		
		
		$("#email_3").change(function(){
			$("#email_3 option:selected").each(function () { 
				if($(this).val()== '1'){ //직접입력일 경우
					$("#email_2").val(''); //값 초기화
					$("#email_2").attr("disabled",false); //활성화
					}else{ //직접입력이 아닐경우
						$("#email_2").val($(this).text()); //선택값 입력
						$("#email_2").attr("disabled",true); //비활성화
						}
				});
		});

		$("#nextBtn").click(function(){ //다음 클릭 시*************************************
		console.log("다음버튼 클릭");
			//choose="member"- Member테이블 / "company" - Company테이블
			var url="${pageContext.request.contextPath}/members/id/phone";//개인 아이디찾기(연락처)
			var json = {
					'memberName':$("#userName").val(),
					'memberPhone':$("#phone1").val()+"-"+$("#phone2").val()+"-"+$("#phone3").val()
						};
				
		if(choose == "member"){//개인회원
			if(way=="tel"){//연락처로 찾기
				if($("#userName").val()==""){
					alert("성명을 입력해주세요.")
					return false;
				} else if($("#phone2").val()==""){
					alert("휴대폰 가운데 번호를 입력해주세요.")
					return false;
				} else if($("#phone3").val()==""){
					alert("휴대폰 뒷자리 번호를 입력해주세요.")
					return false;
				} else{
					var url="${pageContext.request.contextPath}/members/id/phone";
					json = {
							'memberName':$("#userName").val(),
							'memberPhone':$("#phone1").val()+"-"+$("#phone2").val()+"-"+$("#phone3").val()
					}
				}
			}
		}
		if(choose == "member"){//개인회원
			if(way=="mail"){//이메일로 찾기
				if($("#userName2").val()==""){
					alert("성명을 입력해주세요.")
					return false;
				} else if($("#email_1").val()==""){
					alert("이메일 주소를 입력해주세요.")
					return false;
				} else if($("#email_2").val()==""){
					alert("이메일 주소를 선택해주세요.")
					return false;
				} else{
					//TODO: url, json 선언 
					url="${pageContext.request.contextPath}/members/id/mail";
					json = {
							'memberName':$("#userName2").val(),
							'memberEmail':$("#email_1").val()+"@"+$("#email_2").val()
					}
				}
			}
		}
		
		if(choose == "company"){//기업회원
			if(way=="tel"){//연락처로 찾기
				if($("#userName").val()==""){
					alert("대표자명을 입력해주세요.")
					return false;
				} else if($("#phone2").val()==""){
					alert("가운데 전화번호를 입력해주세요.")
					return false;
				} else if($("#phone3").val()==""){
					alert("가운데 전화번호를 입력해주세요.")
					return false;
				} else{
					url="${pageContext.request.contextPath}/companies/id/tel";
					json = {
							'companyBoss':$("#userName").val(),
							'companyTel':$("#phone1").val()+"-"+$("#phone2").val()+"-"+$("#phone3").val()
					}
				}
			}
		}
		
		if(choose == "company"){//기업회원
			if(way=="mail"){//이메일로 찾기
				if($("#userName2").val()==""){
					alert("대표자명을 입력해주세요.")
					return false;
				} else if($("#email_1").val()==""){
					alert("이메일 주소를 입력해주세요.")
					return false;
				} else if($("#email_2").val()==""){
					alert("이메일 주소를 선택해주세요.")
					return false;
				} else{
					url="${pageContext.request.contextPath}/companies/id/mail";
					json = {
							'companyBoss':$("#userName2").val(),
							'companyEmail':$("#email_1").val()+"@"+$("#email_2").val()
					}
				}
			}
		}
		if(choose == "company"){//기업회원
			if(way=="num"){//사업자번호로 찾기
				if($("#userName3").val()==""){
					alert("대표자명을 입력해주세요.")
					return false;
				} else if($("#firstNum").val()==""){
					alert("사업자번호를 입력해주세요.")
					return false;
				} else if($("#midNum").val()==""){
					alert("사업자번호를 입력해주세요.")
					return false;
				}else if($("#endNum").val()==""){
					alert("사업자번호를 입력해주세요.")
					return false;
				} else{
					url="${pageContext.request.contextPath}/companies/id/num";
					json = {
							'companyBoss':$("#userName3").val(),
							'companyNum':$("#firstNum").val()+"-"+$("#midNum").val()+"-"+$("#endNum").val()
					}
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
				if(result == ""){
					alert("일치하는 아이디가 없습니다.");
				} else {
					console.log("아이디찾기 성공")
					alert("아이디는 "+result+" 입니다.");
			location.href ="${pageContext.request.contextPath}/members/id/result?userId="+result//id찾기 결과화면
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
<section class="job-single-content section-padding">
	<div class="container">
     <button type="button" class="tab-item genric-btn primary-border e-large" id="mBtn" autofocus>개인회원</button>
     <button type="button" class="tab-item genric-btn primary-border e-large"	id="cBtn">기업회원</button>
			<div class="row">
				<div class="col-lg-8">
						<div class="main-content">
							<div class="single-content1">
								<div class="mb-4 d-lg-flex justify-content-between">
									<div class="job-text">
									<br><br>
    <h3 class="list-item">아이디 찾기 방법을 선택해 주세요.</h3>
           <br>
  <div class="content-wrap">
 <div class="item-group">
                    <div class="search-item">
                 <input type="radio" name="certType" id="dev_search_tel" data-val="1" value="PHONE" checked="checked">
                 <label for="dev_search_tel">연락처로 찾기</label>
      </div>
      <div class="search-item search_num">
                  <input type="radio" name="certType" id="dev_search_num" data-val="5" value="IDENT">
                  <label for="dev_search_num">사업자등록번호로 찾기</label>
      </div>
      <div class="search-item">
                  <input type="radio" name="certType" id="dev_search_mail" data-val="2" value="EMAIL">
                  <label for="dev_search_mail">이메일로 찾기</label>
   </div><br><br>
</div>																		
</div>
<div class="desc">
   <!-- 회원정보에 등록된 연락처 -->
  <div id="dev_certForm1" class="hide">
                <div class="ui-message white wide">
                    <p class="message-content strong">회원정보에 등록된 연락처로 아이디를 찾을 수 있습니다.</p>
                </div>
                    <table class="find-form">
                        <tr class="form-item">
                            <th class="form-table form-title">이름</th>
                            <td class="form-table form-data">
                                <input type="text" name="certPhoneName" id="userName" class="single-input" title="가입자명" placeholder="가입자명" maxlength="12">
              <span id="nm2Cmt"></span>
                            </td>
		</tr>
         <tr class="form-item">
               <th class="form-table form-title">연락처</th>
               <td class="phone">
                <input type="text" name="phone1" id="phone1" maxlength="3" size = "3" required>
         - <input type="text" name="phone2" id="phone2" maxlength="4" size = "4" required> -
		<input type="text" name="phone3" id="phone3" maxlength="4" size = "4" required>
		<span id="pn2Cmt" class="cmt"></span>
		<span id="pn3Cmt" class="cmt"></span>
           </td>
          </tr>
</table>
</div>

 <!-- 사업자등록번호 인증 -->
<div id="dev_certForm5" class="hide">
  <p class="message-content strong">회원정보에 등록된 사업자번호로 아이디를 찾을 수 있습니다.</p>
 <table class="find-form">
   	<tr class="form-item">
        <th class="form-table form-title">이름</th>
          <td class="form-table form-data">
              <input type="text" class="single-input" name="userName" id="userName3" title="가입자명" placeholder="가입자명" maxlength="12">
              <span id="nm3Cmt"></span>
          </td>
    </tr>
    <tr>
		<th>사업자등록번호</th>
		<td>
			<input type="text" id="firstNum" maxlength="3" size="3" required> -
			<input type="text" id="midNum" maxlength="2" size = "2" required> -
			<input type="text" id="endNum" maxlength="5" size = "5" required>
		</td>
	</tr>
</table>							
 </div>

<!-- 이메일 -->
 <div id="dev_certForm2" class="hide">
          <p class="message-content strong">회원정보에 등록된 이메일로 아이디를 찾을 수 있습니다.</p>
                <div class="find-to-result">
 <table class="find-form">
   	<tr class="form-item">
              <th class="form-table form-title">이름</th>
              <td class="form-table form-data">
                   <input type="text" name="userName" id="userName2" class="single-input" title="가입자명" placeholder="가입자명" maxlength="12">
              <span id="nm2Cmt"></span>
              </td>
       </tr>
    <tr>
		<th>이메일</th>
		<td style="width:300px">
		<input type="text" id = "email_1" name="email_1" maxlength="30" size = "5" required>@
		<input type="text" id = "email_2" name="email_2" maxlength="30" size = "5" required disabled>
		</td>
		<td>
		<select id = "email_3" name="email_3" class="single-input" >
			<option value="1">직접입력</option> 
			<option value="naver.com" selected>naver.com</option> 
			<option value="hanmail.net">hanmail.net</option> 
			<option value="hotmail.com">hotmail.com</option> 
			<option value="gmail.com">gmail.com</option> 
			<option value="nate.com">nate.com</option> 
			<option value="daum.net">daum.net</option> 
			<option value="yahoo.co.kr">yahoo.co.kr</option> 
			<option value="dreamwiz.com">dreamwiz.com</option> 
		</select>
		</td>
	</tr>
  </table>
</div>
</div>
<div class="search-buttons jobs-title">
	          <button type="button" class="genric-btn info radius" id="nextBtn">다음</button>
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
</body>
</html>