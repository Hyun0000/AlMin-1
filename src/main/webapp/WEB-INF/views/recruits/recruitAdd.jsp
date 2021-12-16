<!-- 웹폰트: Noto Sans Korean -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400&display=swap" rel="stylesheet">

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://cdn.ckeditor.com/ckeditor5/29.1.0/classic/ckeditor.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="shortcut icon"
	href="${pageContext.request.contextPath }/resources/assets/images/logo/favicon.png"
	type="image/x-icon">
<link rel="stylesheet"
	href="<c:url value="/resources/assets/css/almin.css"/>">
<title>공고 등록</title>
<style>
.ck.ck-editor {
	max-width: 1000px;
}

.ck-editor__editable {
	min-height: 500px;
}
th {
width: 150px;
}

</style>
</head>
<body>
	<header>
	<c:import url="/WEB-INF/views/template/header.jsp" />
	</header>

	<section>
	
	<c:if test="${!empty msg}">

		<script>
			alert("${msg}");

			<c:remove var="msg"/>
		</script>

	</c:if>
	<div class="container">
            <div class="row">
                <div class="col-lg-8">
                    <div class="main-content">
                        <div class="single-content1">
                        </div>
                        <div class="single-content2 py-4">
                        <h1>공고등록</h1>
                            <p>양식에 맞게 채용공고를 등록해주세요.</p>
                        </div>
                          <form action="addrecruit" method="get">
                        <div class="single-content3 py-4">
                       
			<h2>제목</h2>
				 <input type="text" name="recruitTitle" placeholder="공고 제목 입력해주세요." class="single-input" required>
                        </div>
                        <div class="single-content4 py-4">
                            <h2>모집조건</h2>
                            <table>
				<tr>
					<th>성별</th>
					<td><select name="recruitGender">
							<option value="남자">남자</option>
							<option value="여자">여자</option>
					</select></td>
				</tr>
				<tr>
					<th>연령</th>
					<td><input type="number" name="recruitStartAge" class="single-input"
						placeholder="최소연령" required>~<input type="number"
						name="recruitEndAge" class="single-input" placeholder="최대연령" required></td>
				</tr>
				<tr>
					<th>학력</th>
					<td><select name="recruitEducation">
							<option value="1">초등학교</option>
							<option value="2">중학교</option>
							<option value="3">고등학교</option>
							<option value="4">대학(2,3년)</option>
							<option value="5">대학(4년)</option>
							<option value="6">대학원</option>
					</select></td>
				</tr>
				<tr>
					<th>모집인원</th>
					<td><input type="number" name="recruitPerson" class="single-input" placeholder="00" required>명</td>
				</tr>
				<tr>
					<th>대상</th>
					<td><select name="recruitJobWho">
							<option value="1">청소년</option>
							<option value="2">대학생</option>
							<option value="3">중장년</option>
							<option value="4">장애인</option>
							<option value="5">주부</option>
							<option value="6">외국인가능</option>
							<option value="7">초보가능</option>
							<option value="8">재택가능</option>
					</select></td>
				</tr>
			</table>
                            <ul>
                                <li class="mb-2">2022년 최저임금은 9,160원입니다.</li>
                                <li class="mb-2">근로기준법상 취업을 시킬 수 있는 최저 나이는 만15세 이상 입니다.</li>
                            </ul>
                        </div>
                        <div class="single-content5 py-4">
			<h2>근무조건</h2>
			<table>
				<tr>
					<th>급여</th>
					<td><input type="number" name="recruitMoney" class="single-input" placeholder="급여 입력" required></td>
				</tr>
				<tr>
					<th>근무기간</th>
					<td><select name="recruitPeriod" class="default-select">
							<option value="1">1주일</option>
							<option value="2">1주일~1개월</option>
							<option value="3">1개월~3개월</option>
							<option value="4">3개월~6개월</option>
							<option value="5">6개월~1년</option>
							<option value="6">1년이상</option>
					</select></td>
				</tr>
				<tr>
					<th>근무요일</th>
					<td><input type="text" name="recruitDay" placeholder="주중" class="single-input" required></td>
					<td>**주중, 주 #일, 월~금, 주말(토,일) 등 형식으로 작성해주세요.</td>
				</tr>
				<tr>
					<th>근무시간</th>
					<td><input type="text" name="recruitTime" class="single-input" placeholder="시간협의" required></td>
					<td>**시간협의, ##:##~##:##(휴게시간 #분) 등 형식으로 작성해주세요.</td>
				</tr>
				<tr>
					<th>업직종</th>
					<td><select name="recruitJobType">
							<option value="1">외식/음료</option>
							<option value="2">유통/판매</option>
							<option value="3">문화/여가</option>
							<option value="4">서비스</option>
							<option value="5">사무/회계</option>
							<option value="6">고객상담</option>
							<option value="7">생산/건설/인력</option>
							<option value="8">IT/미디어</option>
							<option value="9">교육/강사/학원</option>
							<option value="10">디자인</option>
							<option value="11">배달/운전</option>
							<option value="12">병원/간호</option>
					</select></td>
				</tr>
			</table>
                        </div>
                        <div class="single-content6 py-4">
                            <h2>근무지역</h2>
			<h4>주소 입력</h4>
			<select name="recruitJobDistrict" required>
        <option value="1">경기도</option>
        <option value="2">인천</option>
        <option value="3">대전</option>
        <option value="4">대구</option>
        <option value="5">부산</option>
        <option value="6">울산</option>
        <option value="7">광주</option>
        <option value="8">강원</option>
        <option value="9">세종</option>
        <option value="10">충북</option>
        <option value="11">충남</option>
        <option value="12">경북</option>
        <option value="13">경남</option>
        <option value="14">전북</option>
        <option value="15">전남</option>
        <option value="16">제주</option>
        <option value="17">전국</option>
        <option value="18">서울</option>
    </select><br>
			<input type="text" name="recruitAddress" class="single-input" placeholder="상세 주소 입력해주세요.">
                        </div>
                        <div class="single-content7 py-4">
                            <h2>상세모집요강</h2>
			<div>
				<textarea id="ckeditor" name="recruitContent"></textarea>
			</div>
			<hr>
			<strong>브랜드</strong> <br> <input type="radio"
				name="recruitJobBranch" value="Y">Y <input type="radio"
				name="recruitJobBranch" value="N">N <br> <strong>공개여부</strong>
			<br> <input type="radio" name="recruitPub" value="Y">공개
			<input type="radio" name="recruitPub" value="N">비공개 <br>
			<button type="submit" id="submit" class="template-btn">등록</button>
		
                        </div>
                         </form>
                    </div>
                </div>
               
                <div class="col-lg-4">
                    <div class="sidebar">
                        <div class="single-item mb-4">
                            <h4 class="mb-4">jobs type</h4>
                            <a href="#" class="sidebar-btn d-flex justify-content-between mb-3">
                                <span>Full Time</span>
                                <span class="text-right">25 job</span>
                            </a>
                            <a href="#" class="sidebar-btn d-flex justify-content-between mb-3">
                                <span>Part Time</span>
                                <span class="text-right">25 job</span>
                            </a>
                            <a href="#" class="sidebar-btn d-flex justify-content-between">
                                <span>Internship</span>
                                <span class="text-right">25 job</span>
                            </a>
                        </div>
                        <div class="single-item mb-4">
                            <h4 class="mb-4">job by location</h4>
                            <a href="#" class="sidebar-btn d-flex justify-content-between mb-3">
                                <span>New York</span>
                                <span class="text-right">25 job</span>
                            </a>
                            <a href="#" class="sidebar-btn d-flex justify-content-between mb-3">
                                <span>California</span>
                                <span class="text-right">25 job</span>
                            </a>
                            <a href="#" class="sidebar-btn d-flex justify-content-between mb-3">
                                <span>Swizerland</span>
                                <span class="text-right">25 job</span>
                            </a>
                            <a href="#" class="sidebar-btn d-flex justify-content-between mb-3">
                                <span>Canada</span>
                                <span class="text-right">25 job</span>
                            </a>
                            <a href="#" class="sidebar-btn d-flex justify-content-between">
                                <span>Sweden</span>
                                <span class="text-right">25 job</span>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
	</section>

	<footer>
		<c:import url="/WEB-INF/views/template/footer.jsp" />
	</footer>

<script>
    ClassicEditor
            .create( document.querySelector( '#ckeditor' ))
            .catch( error => {
                console.error( error );
            } );
    //등록 버튼 클릭 시
    $("#submit").on("click", function(){
    	if($('input[name=recruitTitle]').val()==""){
    	    alert("공고 제목을 입력해주세요.");
    	    $('input[name=recruitTitle]').focus();
    	    return false;
    	}
    	if($('input[name=recruitStartAge]').val()==""){
    	    alert("최소연령을 입력해주세요.");
    	    $('input[name=recruitStartAge]').focus();
    	    return false;
    	}else if($('input[name=recruitEndAge]').val()==""){
    	    alert("최대연령을 입력해주세요.");
    	    $('input[name=recruitEndAge]').focus();
    	    return false;
    	}
    	if($('input[name=recruitPerson]').val()==""){
    	    alert("모집인원을 입력해주세요.");
    	    $('input[name=recruitPerson]').focus();
    	    return false;
    	}
    	if($('input[name=recruitMoney]').val()==""){
    	    alert("급여를 입력해주세요.");
    	    $('input[name=recruitMoney]').focus();
    	    return false;
    	}
    	if($('input[name=recruitPeriod]').val()==""){
    	    alert("근무기간을 입력해주세요.");
    	    $('input[name=recruitPeriod]').focus();
    	    return false;
    	}
    	if($('input[name=recruitDay]').val()==""){
    	    alert("근무요일을 입력해주세요.");
    	    $('input[name=recruitDay]').focus();
    	    return false;
    	}
    	if($('input[name=recruitTime]').val()==""){
    	    alert("근무시간을 입력해주세요.");
    	    $('input[name=recruitTime]').focus();
    	    return false;
    	}
    	if($('input[name=recruitAddress]').val()==""){
    	    alert("상세주소를 입력해주세요.");
    	    $('input[name=recruitAddress]').focus();
    	    return false;
    	}
    	//TODO: 상세모집요강이 공백이면 등록 못하도록 or 기본값 만들어서 자동채우기
    	})
</script>
</body>
</html>