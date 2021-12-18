<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="<c:url value="/resources/career/css/main.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/career/css/calender.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/career/css/app.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/career/css/smallcalendar.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/career/css/mdtimepicker.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/career/css/chart.css"/>">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400&display=swap" rel="stylesheet">
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/assets/images/logo/favicon.png" type="image/x-icon">
<link rel="stylesheet" href="<c:url value="/resources/assets/css/almin.css"/>">

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyCalender</title>
<style type="text/css">
</style>
</head>
<body>
	<!-- Preloader Starts -->
	<div class="preloader">
		<div class="spinner"></div>
	</div>
	<!-- Preloader End -->
	
<c:import url="/WEB-INF/views/template/header.jsp" />
    <section id="calender_top">
        <!-- <div> -->
            <div id="top_title" style="color:black;"></div>
            <div id="top_btn">
            </div>
        <!-- </div> -->
    </section>
<!-- ================================================== 모달창 ================================================== -->
<div id="ModalBg">
    <!-- <div id="exampleModal"  tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true"> -->
    <div id="exampleModal"  tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <!-- <div class="modal-dialog" style="margin-top: 0; padding: 10px;"> -->
        <div style="margin-top: 0; padding: 10px;">
        	<!-- <form> -->
	            <!-- <div class="modal-content" style="border: none;"> -->
	            <div style="border: none;">
	            	<!-- 색깔 및 버튼-->
	                <div class="modal-header" style="padding: 10px;">
	                    <h5 class="modal-title" id="exampleModalLabel" style="font-size: 1.5rem; font-weight: bolder;"></h5>
	                    <div id="insertBtnBox">
	                        <div>
	                            <input type="color" id="colorPicker">
	                        </div>
	                        <div id="labelBox">
	                            <!--  style="display: none;" -->
								<label id="goLabel" class="modalTypeLabel" for="go">지원</label>
	                            <input class="typeRadio" value="G" type="radio" id="go" name="test" style="display: none;">
	                            
	                            <label id="meetLabel" class="modalTypeLabel" for="meet">면접</label>
	                            <input class="typeRadio" value="M" type="radio" id="meet" name="test" style="display: none;">
	
<!-- 	                            <label id="workLabel" class="modalTypeLabel" for="work">근무</label>
	                            <input class="typeRadio" value="W" type="radio" id="work" name="test"> -->
	                        </div>
	                    </div>
	                </div>
	                <!-- <div class="modal-body" style="padding: 20px;"> -->
	                <div style="padding: 10px; color: black;" class="modalPopBody">
	                        <!-- 제목 -->
	                        <div class="mb-3" id="insertTitleBox">
	                            <div id="insertTitleDiv">
	                            	<div><label for="message-text" class="col-form-label" style="text-align: left;">제목</label></div>
	                            	<div id="work_time_money_box">
	                            		<label class="work_time_money_label" for="money_input" id="money_label_id">시급
	                            			<input id="money_input" class="work_time_money_input" type="text" placeholder="숫자만">
	                            		</label>
	                            		
	                            		<label class="work_time_money_label" for="time_input" id="time_label_id">일 근무시간
	                            			<input id="time_input" class="work_time_money_input" type="text" placeholder="숫자만">
	                            		</label>
	                            	</div>
	                            </div>
	                            <!-- <div id="insertTitleBox_input">제목</div> -->
	                            <hr>
	                            <input type="text" class="form control" id="recipient-name" placeholder="글자수 제한">
	                        </div>
	                        <!-- 날짜 -->
	                        <div class="mb-3" id="insertDayBox">
	                            <label for="message-text" class="col-form-label">날짜</label>
	                            <hr>
	                                <div>
	                                    <table id="insertDateTable">
	                                        <tr>
	                                            <td class="insertTableTitle">시작일</td>
	                                            <td id="startDay" class="insertTableDate" onclick="miniCalUp();"></td>
	                                        </tr>
	                                        <tr>
	                                            <td class="insertTableTitle">종료일</td>
	                                            <td id="endDay" class="insertTableDate" onclick="miniCalUp();"></td>
	                                        </tr>
	                                    </table>
	                                </div>
	                        </div>
	                        <!-- 시간 -->
	                        <div class="mb-3" id="insertTimeBox">
	                            <label for="message-text" class="col-form-label">시간</label>
	                            <hr>
	                            <table id="timeTable">
	                                <tr>
	                                    <!-- <td><label for="startTime" class="insertTimeTitle">시작 시간</label></td> -->
	                                    <td class="insertTimeTitle">시작 시간</td>
	                                    <td><input type="text" class="timepicker insertTime" id="startTime"/></td>
	                                </tr>
	                                <tr>
	                                    <!-- <td><label for="endTime" class="insertTimeTitle">종료 시간</label></td> -->
	                                    <td class="insertTimeTitle">종료 시간</td>
	                                    <td><input type="text" class="timepicker insertTime" id="endTime"/></td>
	                                </tr>
	                            </table>
	                        </div>
	             		</div>
	                <div class="modal-footer" style="padding: 10px;">
	                    <!-- <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button> -->
	                    <button type="button" class="btn btn-primary" id="calUpdateBtn">수정</button>
	                    <button type="button" class="btn btn-primary" id="calSubmitBtn">등록</button>
	                    <button type="button" class="btn btn-secondary" id="calDeleteBtn">삭제</button>
	                    <button type="button" class="btn btn-secondary" id="insertBoxClose" onclick="modalClose();">취소</button>
	                </div>
	            </div>
            <!-- </form> -->
        </div>
    </div>
</div>
<div id="mimiCalbg">
    <div class="calendar" id="miniCal" style="display: none;">
        <div class="calendar-header">
            <!-- <span class="month-picker" id="month-picker">February</span> -->
            <span class="month-picker" id="month-picker"></span>
            <div class="year-picker">
                <span class="year-change" id="prev-year">
                    <pre><</pre>
                </span>
                <!-- <span id="year">2021</span> -->
                <span id="year"></span>
                <span class="year-change" id="next-year">
                    <pre>></pre>
                </span>
            </div>
        </div>
        <div class="calendar-body">
            <div class="calendar-week-day">
                <div class="dayName">Sun</div>
                <div class="dayName">Mon</div>
                <div class="dayName">Tue</div>
                <div class="dayName">Wed</div>
                <div class="dayName">Thu</div>
                <div class="dayName">Fri</div>
                <div class="dayName">Sat</div>
            </div>
            <div class="calendar-days"></div>
        </div>
        <div class="month-list" id="apple"></div>
    </div>
</div>
<!-- ================================================== 모달창 ================================================== -->
<section id="calendar_section">
	<div id='calendar-wrap'>
	    <div id="side_calendar">
	        <div id="btn_box">
	            <button id="needCalBtn" class="calendarBtn" style="width: 100%;">지원 / 면접일자</button>
	            <button id="workCalBtn" class="calendarBtn" style="width: 100%;">근무관리</button>
	            <button id="careerCalBtn" class="calendarBtn" style="width: 100%;">경력관리</button>
	        </div>
	        <div id="side_calendar_img_box">
				<img src="${pageContext.request.contextPath}/resources/assets/images/calender_side1.png" id="slide_first_img">
				<img src="${pageContext.request.contextPath}/resources/assets/images/calender_side2.png" id="slide_second_img" style="display: none;">
				<img src="${pageContext.request.contextPath}/resources/assets/images/calender_side3.png" id="slide_third_img" style="display: none;">
				<!-- 경력 추가 --><!-- 경력 추가 --><!-- 경력 추가 --><!-- 경력 추가 -->
	 			<div id="careerInputTable_box">
				    <table id="careerInputTable" style="display: none;">
				    
<!-- 				        <tr>
				            <td class="careerInputFirstTd" style="padding: 5px 5px; background-color: #f9f9f9;">
				                <label for="job_type">업무직종</label>
				            </td>
			            </tr> -->
			            
						<tr>
				            <td class="careerInputSecondTd" style="padding: 5px 5px; background-color: #f9f9f9; text-align: center;">
				                <select name="job_type" id="job_type" style="text-align: center;">
				                    <option value="job_type_no">-------업무 직종-------</option>
				                    <option value="1">외식 / 음료</option>
				                    <option value="2">유통 / 판매</option>
				                    <option value="3">문화 / 여가</option>
				                    <option value="4">서비스</option>
				                    <option value="5">사무 / 회계</option>
				                    <option value="6">고객상담</option>
				                    <option value="7">생산 / 건설 / 인력</option>
				                    <option value="8">IT / 미디어</option>
				                    <option value="9">교육 / 강사 / 학원</option>
				                    <option value="10">디자인</option>
				                    <option value="11">배달 / 운전</option>
				                    <option value="12">병원 / 간호</option>
				                </select>
				            </td>
				        </tr>
				
<!-- 				        <tr>
				            <td class="careerInputFirstTd" style="padding: 5px 5px; background-color: #f9f9f9;">
				                <label for="job_period">기간</label>
				            </td>
						</tr> -->
						
						<tr>
				            <td class="careerInputSecondTd" style="padding: 5px 5px; background-color: #f9f9f9;">
				                <select name="job_period" id="job_period">
				                    <option value="job_period_no">-------기간-------</option>
				                    <option value="1">1주일</option>
				                    <option value="2">1주일 ~ 1개월</option>
				                    <option value="3">1개월 ~ 3개월</option>
				                    <option value="4">3개월 ~ 6개월</option>
				                    <option value="5">6개월 ~ 1년</option>
				                    <option value="6">1년 이상</option>
				                </select>
				            </td>
				        </tr>
				
				        <tr>
				            <td class="careerInputFirstTd" style="padding: 5px 5px; background-color: #f9f9f9;">
				                <label for="careerTitle">담당업무</label>
				            </td>
						</tr>
						
						<tr>
				            <td class="careerInputSecondTd" style="padding: 5px 5px; background-color: #f9f9f9;">
				                <input type="text" id="careerTitle" placeholder="15자 이내 입력">
				            </td>
				        </tr>
				        
			        	<tr>
			        		<td colspan="2" id="insertBtnTd" style="padding: 5px 5px; background-color: #f9f9f9;">
			        			<button id="career_insert_btn" class="template-btn btn0">경력추가</button>
			        		</td>
			        	</tr>
				    </table>
				</div>
				<!-- 경력 추가 --><!-- 경력 추가 --><!-- 경력 추가 --><!-- 경력 추가 -->
	        </div>
	    </div>
	<!-- ================================================== calender ================================================== -->
	    <div id='calendar'></div><!-- 얘는 고정값으로 가야한다. -->
	<!-- ================================================== chart.js ================================================== -->
	    <div id="chartBox" style="display: none">
		    <div id="top_box">
		       	<!-- <h1>우리의 민족!!! 칠갑산님의 Chart</h1> -->
		       	<h1></h1>
		        <div id="top_box_right_innerBox">
		            <input id="yearInput" type="number" min="0000" max="9999"><span class="dateTypeSpan">년</span>
		            <input id="monthInput" type="number" min="1" max="12"><span class="dateTypeSpan">월</span>
		            <button type="button" id="date_input_btn" class="template-btn btn0">조회</button>
		        </div>
		    </div>
		    <div id="allChartBox">
		        <div id="firstChartBox">
		            <div id="needChartDiv">
		           		<canvas id="needChart"></canvas>
		            	<img src="${pageContext.request.contextPath}/resources/assets/images/no_need_data.png" id="needChart_alterImage">
		            	<!--  style="width: 400px" -->
		           	</div>
		            <div id="careerChartDiv">
		            	<canvas id="careerChart"></canvas>
		            	<!-- <button id="career_in_modal_up">경력추가</button> -->
		            	<img src="${pageContext.request.contextPath}/resources/assets/images/no_career_data.png" id="careerChart_alterImage">
		           	</div>
		        </div>
		
		        <div id="secondChartBox">
		            <div id="workChartDiv">
		            	<canvas id="workChart"></canvas>
		            	<img src="${pageContext.request.contextPath}/resources/assets/images/no_work_data.png" id="workChart_alterImage">
		           	</div>
		            <div id="moneyTabel">
		                <table id="moneyTabelReal"></table>
		            </div>
		        </div>
		    </div>
		</div>
	</div>
</section> 
<c:import url="/WEB-INF/views/template/footer.jsp" />
<!-- ================================================== chart.js ================================================== -->
<script>
	// 현재 로그인한 개인 회원
	let userId = "${loginInfo.memberId}";
	
	// 현재 로그인한 기업 회원
	let loginCompId = "${loginInfo.companyId}";
	
	// 현재 로그인한 계정의 type
	let loginType = "${loginInfo.sessionType}";
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script src="<c:url value="/resources/assets/js/vendor/wow.min.js"/>"></script>
<script src="<c:url value="/resources/assets/js/main.js"/>"></script>


<script src="<c:url value="/resources/template/js/almin.js"/>"></script>
<script src="<c:url value="/resources/career/js/main.js"/>"></script>
<script src="<c:url value="/resources/career/js/ko.js"/>"></script>
<script src="<c:url value="/resources/career/js/calendervar.js"/>"></script>
<script src="<c:url value="/resources/career/js/calender.js"/>"></script>
<script src="<c:url value="/resources/career/js/app.js"/>"></script>
<script src="<c:url value="/resources/career/js/mdtimepicker.js"/>"></script>
<script src="<c:url value="/resources/career/js/calenderCRUD.js"/>"></script>
<script src="<c:url value="/resources/career/js/chart.js"/>"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.6.0/chart.min.js" integrity="sha512-GMGzUEevhWh8Tc/njS0bDpwgxdCJLQBWG3Z2Ct+JGOpVnEmjvNx6ts4v6A2XJf1HOrtOsfhv3hBKpK9kE5z8AQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script>$(document).ready(function () {$('.timepicker').mdtimepicker();});</script>
<script type="text/javascript">
	let apples = document.getElementsByClassName("ggCalEvent");
	console.log("QQQQQQQQQQQQQQQQQQQQQQQQQQQQ");
	console.log(apples);
	console.log(apples[0]);
	console.log(apples.length);
	console.log("QQQQQQQQQQQQQQQQQQQQQQQQQQQQ");
	
	let kiwis = document.querySelectorAll(".ggCalEvent");
	console.log("QQQQQQQQQQQQQQQQQQQQQQQQQQQQ");
	console.log(kiwis);
	console.log(kiwis[0]);
	console.log(kiwis.length);
	console.log("QQQQQQQQQQQQQQQQQQQQQQQQQQQQ");
</script>
</body>
</html>