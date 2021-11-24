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
</head>
<body>
<!-- ================================================== 모달창 ================================================== -->
<div id="ModalBg">
    <div id="exampleModal"  tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">일정 추가</h5>
                    <div id="insertBtnBox">
                        <label class="modalTypeLabel" for="go">지원</label>
                        <input type="radio" id="go" name="test" style="display: none;">

                        <label class="modalTypeLabel" for="meet">면접</label>
                        <input type="radio" id="meet" name="test" style="display: none;">

                        <label class="modalTypeLabel" for="work">근무</label>
                        <input type="radio" id="work" name="test" style="display: none;">

                        <label class="modalTypeLabel" for="other">기타</label>
                        <input type="radio" id="other" name="test" style="display: none;">
                    </div>
                </div>
                <div class="modal-body" style="padding: 20px;">
                    <form>
                        <!-- 제목 -->
                        <div class="mb-3" id="insertTitleBox">
                            <div id="insertTitleBox_input">제목</div>
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
                                            <td id="endDay" class="insertTableDate"  onclick="miniCalUp();"></td>
                                        </tr>
                                    </table>
                                </div>
                                <div id="timeCheckbox">
                                    <input type="checkbox" id="checkbox_id">
                                    <label for="checkbox_id">시간 설정</label>
                                    
                                </div>
                        </div>
                        <!-- 시간 -->
                        <div class="mb-3">
                            <table>
                                <tr>
                                    <td><label for="startTime">시작 시간</label></td>
                                    <td><input type="text" class="timepicker" id="startTime"/></td>
                                </tr>
                                <tr>
                                    <td><label for="endTime">종료 시간</label></td>
                                    <td><input type="text" class="timepicker" id="endTime"/></td>
                                </tr>
                            </table>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <!-- <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button> -->
                    <button type="button" class="btn btn-secondary" id="insertBoxClose" onclick="modalClose();">취소</button>
                    <button type="button" class="btn btn-primary">등록</button>
                </div>
            </div>
        </div>
    </div>

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
        <div class="month-list"></div>
    </div>
</div>
<!-- ================================================== 모달창 ================================================== -->
    <div id='calendar-wrap'>
        <div id="side_calendar">
            <div id="btn_box">
                <!-- bootstrap -->
                <div class="btn-group">
                    <button type="button" class="btn btn-danger dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">구직관리</button>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#">지원일자</a></li>
                        <li><a class="dropdown-item" href="#">면접일자</a></li>
                        <li>
                            <hr class="dropdown-divider">
                        </li>
                        <li><a class="dropdown-item" href="#">통합조회</a></li>
                    </ul>
                </div>
                <button type="button" class="btn btn-danger">근무관리</button>
                <button type="button" class="btn btn-danger">경력관리</button>
                <!-- bootstrap -->
            </div>
        </div>
        <div id='calendar'></div><!-- 얘는 고정값으로 가야한다. -->
    </div>
<!-- ================================================== 모달창 ================================================== -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="<c:url value="/resources/career/js/main.js"/>"></script>
<script src="<c:url value="/resources/career/js/ko.js"/>"></script>
<script src="<c:url value="/resources/career/js/calender.js"/>"></script>
<script src="<c:url value="/resources/career/js/app.js"/>"></script>
<script src="<c:url value="/resources/career/js/mdtimepicker.js"/>"></script>
<script src="<c:url value="/resources/template/js/almin.js"/>"></script>
<script>$(document).ready(function () {$('.timepicker').mdtimepicker();});</script>
</body>
</html>