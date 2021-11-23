<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value="/resources/career/css/main.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/career/css/career.css"/>">
<!-- bootstrap -->
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<!-- bootstrap -->
</head>
<body>
<!-- bootstrap -->
<div class="btn-group">
    <button type="button" class="btn btn-danger dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
      구직관리
    </button>
    <ul class="dropdown-menu">
      <li><a class="dropdown-item" href="#">지원일자</a></li>
      <li><a class="dropdown-item" href="#">면접일자</a></li>
      <li><hr class="dropdown-divider"></li>
      <li><a class="dropdown-item" href="#">통합조회</a></li>
    </ul>
</div>
<button type="button" class="btn btn-danger">근무관리</button>
<button type="button" class="btn btn-danger">경력관리</button>
<!-- bootstrap -->
<button type="button" id="textJsAjax">textJsAjax</button>
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