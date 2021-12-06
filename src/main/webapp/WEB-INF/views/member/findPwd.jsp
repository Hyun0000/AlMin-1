<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>알바의 민족 비밀번호 찾기</title>
<!-- Favicon -->
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/resources/assets/images/logo/favicon.png" type="image/x-icon">
<!-- CSS Files -->
<link rel="stylesheet" href="<c:url value='/resources/assets/css/almin.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/member/css/member.css'/>">
<script>
$(document).ready(function(){
	var choose = "member";
 	$(".hide").hide(); 
	$("#memberBtn").css({
		"background-color":"#f8b600",
		"color":"white",
		"border":"3px solid #f8b600"
	});
	
	$("#mBtn").click(function(){
		console.log("개인회원 선택");
		choose="member";
		  $(".search_num").hide(); //사업자등록번호로 찾기
		$("#mBtn").css({
			"background-color":"#f8b600",
			"color":"white",
			"border":"3px solid #f8b600"
		});
		$("#cBtn").css({
			"background-color":"white",
			"color":"black",
			"border":"3px solid #FAE100"
		});
		})
	$("#cBtn").click(function(){
		console.log("기업회원 선택");
		  $(".search_num").show(); //사업자등록번호로 찾기
	    choose="company";
		$("#cBtn").css({
			"background-color":"#f8b600",
			"color":"white",
			"border":"3px solid #f8b600"
		});
		$("#mBtn").css({
			"background-color":"white",
			"color":"black",
			"border":"3px solid #FAE100"
		});
		})
		$("#dev_search_tel").change(function(){//연락처로 찾기
		    $("#dev_certForm1").show(); 
		    $("#dev_certForm5").hide(); //사업자번호 input
		    $("#dev_certForm2").hide(); 
		})
		$("#dev_search_mail").change(function(){//이메일로 찾기
		    $("#dev_certForm2").show(); 
		    $("#dev_certForm5").hide(); //사업자번호 input
		    $("#dev_certForm1").hide(); 
		})
		$("#dev_search_num").change(function(){//이메일로 찾기
		    $("#dev_certForm5").show(); //사업자번호 input
		    $("#dev_certForm1").hide(); 
		    $("#dev_certForm2").hide(); 
		})
});
</script>
</head>
<body>
<!-- 공통헤더 템플릿 -->
<c:import url="/WEB-INF/views/template/header.jsp"/>
<section>
<div class="find-userinfo">
            
<div class="tab btngroup">
        <button type="button" class="tab-item tab1" id="mBtn"
					autofocus>개인회원</button>
       <button type="button" class="tab-item tab1 active"
					id="cBtn">기업회원</button>
</div>
            <div class="ui-message gray">
                <div class="list-type message-content">
                    <p class="list-item">아이디 찾기 방법을 선택해 주세요.</p>
                </div>
            </div>

            <div class="change-option box-sizing">
                <div class="item-group">
                    <div class="search-item">
                        <input type="radio" name="certType" id="dev_search_tel" data-val="1" value="PHONE" checked="checked">
                        <label for="dev_search_tel">연락처로 찾기</label>
                    </div>
                    <div class="search-item search_num">
                        <input type="radio" name="certType" id="dev_search_num" data-val="5" value="IDENT" checked="checked">
                        <label for="dev_search_num">사업자등록번호로 찾기</label>
                    </div>
                    <div class="search-item">
                        <input type="radio" name="certType" id="dev_search_mail" data-val="2" value="EMAIL">
                        <label for="dev_search_mail">이메일로 찾기</label>
                    </div>
                </div>
            </div>


            <!-- 회원정보에 등록된 연락처 -->
            <div id="dev_certForm1" class="hide">
                <div class="ui-message white wide">
                    <p class="message-content strong">회원정보에 등록된 연락처로 아이디를 찾을 수 있습니다.</p>
                </div>
                <div class="find-to-result">
                    <div class="find-form">
                        <div class="form-item">
                        <table>
                        <tr><th><label for="userId">아이디</label></th>
		<td><input type="text" id="userId" name="userId"  placeholder="6~50자 영문, 숫자" maxlength="50" required></td>
		</tr>
		<tr>
          <th>이름</th>
          <td><input type="text" name="certPhoneName" id="dev_certPhoneName" title="가입자명" placeholder="가입자명" maxlength="12"></td>
		</tr>
		</table>
                        </div>
                        <div class="form-item">
                            <div class="form-table form-title">연락처</div>
                            <div class="form-table form-data user-contact">
                                <span class="contact-type">
                                    <select name="certPhoneType" id="dev_certPhoneType" title="연락처 타입">
                                        <option value="1">휴대폰</option>
                                        <option value="2">유선전화</option>
                                    </select>
                                </span>
                                <span class="front-number">
                                    <select name="tabPhone" id="dev_tabPhone1" title="휴대폰국번">
                                        <option value="010">010</option>
                                        <option value="011">011</option>
                                        <option value="016">016</option>
                                        <option value="017">017</option>
                                        <option value="018">018</option>
                                        <option value="019">019</option>
                                    </select>

                                    <select name="tabPhone" id="dev_tabPhone2" title="유선국번" style="display: none;">
                                        <option value="02">02</option>
                                        <option value="031">031</option>
                                        <option value="032">032</option>
                                        <option value="033">033</option>
                                        <option value="041">041</option>
                                        <option value="042">042</option>
                                        <option value="043">043</option>
                                        <option value="044">044</option>
                                        <option value="051">051</option>
                                        <option value="052">052</option>
                                        <option value="053">053</option>
                                        <option value="054">054</option>
                                        <option value="055">055</option>
                                        <option value="061">061</option>
                                        <option value="062">062</option>
                                        <option value="063">063</option>
                                        <option value="064">064</option>
                                        <option value="070">070</option>
                                        <option value="0">직접입력</option>
                                    </select>
                                </span>
                                <span class="last-number">
                                    <input type="tel" name="certPhoneNum" id="dev_certPhoneNum" title="전화번호" maxlength="8">
                                </span>
                                <p class="mon-warn hide"></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <!-- 이메일 -->
            <div id="dev_certForm2" class="hide">
                <div class="ui-message white wide">
                    <p class="message-content strong">회원정보에 등록된 이메일로 아이디를 찾을 수 있습니다.</p>
                </div>
                <div class="find-to-result">
                    <div class="find-form">
                        <div class="form-item">
                        <label for="userId2">아이디</label>
                        <input type="text" id="userId2" name="userId2"  placeholder="6~50자 영문, 숫자" maxlength="50" required>
                            <div class="form-table form-title">이름</div>
                            <div class="form-table form-data">
                                <input type="text" name="certEmailName" id="dev_certEmailName" title="가입자명" placeholder="가입자명" maxlength="12">
                                <p class="mon-warn hide"></p>
                            </div>
                        </div>
                        <div class="form-item">
                            <div class="form-table form-title">이메일</div>
                            <div class="form-table form-data">
                                <input type="text" name="certEmail" id="dev_certEmail" title="이메일 (예. example@email.com)" placeholder="이메일 (예. example@email.com)" maxlength="100">
                                <p class="mon-warn hide"></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- 사업자등록번호 인증 -->
            <div id="dev_certForm5" class="hide">
                <div class="ui-message white wide">
                    <p class="message-content strong">회원정보에 등록된 사업자번호로 아이디를 찾을 수 있습니다.</p>
                </div>
                <div class="find-to-result">
                    <div class="find-form">
                        <div class="form-item">
                        <label for="userId3">아이디</label>
                        <input type="text" id="userId3" name="userId3"  placeholder="6~50자 영문, 숫자" maxlength="50" required>
                            <div class="form-table form-title">이름</div>
                            <div class="form-table form-data">
                                <input type="text" name="certIdentName" id="dev_certIdentName" title="가입자명" placeholder="가입자명" maxlength="12">
                                <p class="mon-warn hide"></p>
                            </div>
                        </div>
                        <div class="form-item">
                            <div class="form-table form-title">사업자등록번호</div>
                            <div class="form-table form-data">
                                <input type="text" name="certIdent" id="dev_certIdent" title="사업자등록번호" placeholder="사업자등록번호 ( - 포함)" maxlength="10">
                                <p class="mon-warn hide"></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="search-buttons">
                <button type="button" class="btn1" id="nextBtn">다음</button>
            </div>
        </div>
</section>
	<!-- 공통푸터 템플릿 -->
<c:import url="/WEB-INF/views/template/footer.jsp"/>
</body>
</html>