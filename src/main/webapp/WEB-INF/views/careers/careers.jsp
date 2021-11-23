<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value="/resources/career/css/main.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/career/css/calender.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/career/css/app.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/career/css/smallcalendar.css"/>">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
    <div id='calendar-wrap'>
        <div id="side_calendar">
            <div id="btn_box">
                <!-- bootstrap -->
                <div class="btn-group">
                    <button type="button" class="btn btn-danger dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                        구직관리
                    </button>
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
<!-- ================================================== 미니 달력 ================================================== -->
    <div class="calendar" id="miniCal" style="display: none;" onclick="modalUp()">
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
<!-- ================================================== 미니 달력 ================================================== -->
<!-- ================================================== 모달창 ================================================== -->
    <!-- <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal"
    data-bs-whatever="@mdo">Open modal for @mdo</button> -->

    <div id="exampleModal" style="display: none;" onclick="modalUp();"  tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">일정 추가</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="mb-3">
                            <input type="radio" value="면접일자">
                            <input type="radio" value="지원일자">
                            <input type="radio" value="근무일자">
                            <input type="radio" value="기타">
                            <label for="recipient-name" class="col-form-label">제목</label>
                            <input type="text" class="form접control" id="recipient-name">
                        </div>
                        <div class="mb-3">
                            <label for="message-text" class="col-form-label">날짜</label>
                            <div>시작일</div>
                            <div>종료일</div>
                            <!-- <textarea class="form-control" id="message-text"></textarea> -->
                        </div>
                        <div class="mb-3">
                            <label for="message-text" class="col-form-label">시간</label>
                            <input type="time">
                            <div>종일</div>
                            <!-- <textarea class="form-control" id="message-text"></textarea> -->
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary">Send message</button>
                </div>
            </div>
        </div>
    </div>
<!-- ================================================== 모달창 ================================================== -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="<c:url value="/resources/career/js/main.js"/>"></script>
<script src="<c:url value="/resources/career/js/calender.js"/>"></script>
<script src="<c:url value="/resources/career/js/app.js"/>"></script>
<script src="<c:url value="/resources/template/js/almin.js"/>"></script>
</body>
</html>