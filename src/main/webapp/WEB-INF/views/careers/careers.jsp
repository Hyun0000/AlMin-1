<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="<c:url value="/resources/career/css/main.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/career/css/calender.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/career/css/app.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/career/css/smallcalendar.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/career/css/mdtimepicker.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/career/css/chart.css"/>">
</head>
<body>
    <section id="calender_top">
        <!-- <div> -->
            <div id="top_title"></div>
            <div id="top_btn">
                <!-- <button type="button" class="insert_btn_class">저장</button> -->
                <button type="button" class="insert_btn_class" id="insert_evnet_btn">일정추가</button>
            </div>
        <!-- </div> -->
    </section>
<!-- ================================================== 모달창 ================================================== -->
<div id="ModalBg">
    <div id="exampleModal"  tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
        	<!-- <form> -->
	            <div class="modal-content">
	            	<!-- 색깔 및 버튼-->
	                <div class="modal-header">
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
	
	                            <label id="workLabel" class="modalTypeLabel" for="work">근무</label>
	                            <input class="typeRadio" value="W" type="radio" id="work" name="test" style="display: none;">
	
	                            <label id="otherLabel" class="modalTypeLabel" for="other">기타</label>
	                            <input class="typeRadio" value="O" type="radio" id="other" name="test" style="display: none;">
	                        </div>
	                    </div>
	                </div>
	                <div class="modal-body" style="padding: 20px;">
	                        <!-- 제목 -->
	                        <div class="mb-3" id="insertTitleBox">
	                            <div id="insertTitleDiv">
	                            <label for="message-text" class="col-form-label" style="text-align: left;">제목</label>
	                            <label for="work_money" id="work_money_label" style="display: none;">시급<input type="text" id="work_money" placeholder="숫자만 입력"></label>
	                            <!-- style="display: none;" -->
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
	                <div class="modal-footer">
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
    <div id='calendar-wrap'>
        <div id="side_calendar">
            <div id="btn_box">
                <button id="needCalBtn" class="calendarBtn" style="width: 100%;">지원 / 면접일자</button>
                <!-- <button class="calendarBtn" style="width: 100%;">면접일자</button> -->
                <button id="workCalBtn" class="calendarBtn" style="width: 100%;">근무관리</button>
                <button id="careerCalBtn" class="calendarBtn" style="width: 100%;">경력관리</button>
            </div>
            <div>지원횟수 면접횟수 --> chart.js</div>
            <div>근무관련 데이터 --> chart.js</div>
            <div>경력관련 데이터 --> chart.js</div>
        </div>
        <div id='calendar'></div><!-- 얘는 고정값으로 가야한다. -->
    </div>
<!-- ================================================== chart.js ================================================== -->
    <div id="firstDiv">
        <canvas id="myChart"></canvas>
    </div>
    <div id="secondDiv">
        <canvas id="myChart2"></canvas>
    </div>
    <div id="thirdDiv">
        <canvas id="myChart3"></canvas>
    </div>
<script>
	let userId = "user01";
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
</body>
</html>