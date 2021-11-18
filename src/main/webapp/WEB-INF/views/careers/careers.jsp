<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value="/resources/career/css/main.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/career/css/career.css"/>">
</head>
<body>
<button type="button" id="textJsAjax">textJsAjax</button>
<!-- 상단 툴바 --><!-- 상단 툴바 --><!-- 상단 툴바 --><!-- 상단 툴바 --><!-- 상단 툴바 --><!-- 상단 툴바 --><!-- 상단 툴바 --><!-- 상단 툴바 --><!-- 상단 툴바 -->
    <div id='topbar'>
        <div id="topbar_name">
            <h3>박정원님의 calendar</h3>
            <!-- <h2>박정원님의 구직관리</h2> -->
        </div>

        <div id="">
            <button>Work calendar</button>
            <button>Recruit calendar</button>
        </div>

        <div id="topbar_btn">
        <button data-codepen class='codepen-button'>Edit in CodePen</button>
        </div>
    </div>
<!-- drop item box --><!-- drop item box --><!-- drop item box --><!-- drop item box --><!-- drop item box --><!-- drop item box --><!-- drop item box --><!-- drop item box -->
	<div id="allContainer">
	    <div id='external-events'>
	        <p>
	            <h3>박정원님의 스케줄</h3>
	        </p>
	
	        <div class='fc-event fc-h-event fc-daygrid-event fc-daygrid-block-event'>
	            <div class='fc-event-main'>My Event 1</div>
	        </div>
	        <div class='fc-event fc-h-event fc-daygrid-event fc-daygrid-block-event'>
	            <div class='fc-event-main'>My Event 2</div>
	        </div>
	        <div class='fc-event fc-h-event fc-daygrid-event fc-daygrid-block-event'>
	            <div class='fc-event-main'>My Event 3</div>
	        </div>
	        <div class='fc-event fc-h-event fc-daygrid-event fc-daygrid-block-event'>
	            <div class='fc-event-main'>My Event 4</div>
	        </div>
	        <div class='fc-event fc-h-event fc-daygrid-event fc-daygrid-block-event'>
	            <div class='fc-event-main'>My Event 5</div>
	        </div>
	
	        <!-- drop item 삭제 여부 --><!-- drop item 삭제 여부 -->
	        <p>
	            <input type='checkbox' id='drop-remove' />
	            <label for='drop-remove'>등록한 일정 삭제</label>
	        </p>
	    </div>
<!-- calendar --><!-- calendar --><!-- calendar --><!-- calendar --><!-- calendar --><!-- calendar --><!-- calendar --><!-- calendar -->
	    <div id='calendar-container'>
	        <div id='calendar'></div>
	    </div>
	</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="<c:url value="/resources/career/js/main.js"/>"></script>
<script src="<c:url value="/resources/career/js/career.js"/>"></script>
<script src="<c:url value="/resources/template/js/almin.js"/>"></script>
</body>
</html>