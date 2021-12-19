// 로그인을 하지 않은 상태에서는 뒤로가기
// 1. 비로그인 상태
if(userId === "" && loginCompId === "") {
	alert("로그인을 먼저 진행해주세요");
	history.back();	
} else if(loginCompId != "") {
	alert("개인 회원만 이용가능합니다.");
	history.back();
}

// 캘린더 등록 이벤트 배열
let evnets = [];

//(지원 / 면접일자) 버튼 선택
needCalButn.onclick = () => {
	selectCal = "NG";
	calDiv.style.display = 'block';
	chartDiv.style.display = 'none';
	
	// 경력 추가 버튼 숨기기
	careerInsertBtn.style.display = "none";
	
	// 좌측 사이드 이미지
	document.getElementById('slide_first_img').style.display = "block";
	document.getElementById('slide_second_img').style.display = "none";
	document.getElementById('slide_third_img').style.display = "none";
	
	careerInputTable.style.display = "none";
	// topCalTitle.innerText = "우리의 민족!!! " + userId + "님의 구직관리 calendar";
	sendRequest("GET", getPath, null, calenderLoad);
}

workCalButn.onclick = () => {
	selectCal = "W";
	calDiv.style.display = 'block';
	chartDiv.style.display = 'none';
	
	// 경력 추가 버튼 숨기기
	careerInsertBtn.style.display = "none";
	
	// 좌측 사이드 이미지
	document.getElementById('slide_first_img').style.display = "none";
	document.getElementById('slide_second_img').style.display = "block";
	document.getElementById('slide_third_img').style.display = "none";
	
	careerInputTable.style.display = "none";
	sendRequest("GET", getWorkPath, null, calenderLoad);
	// topCalTitle.innerText = "우리의 민족!!! " + userId + "님의 근무관리 calendar";
}

// 처음 캘린더 페이지에 들어왔을 때 실행할 Ajax
sendRequest("GET", getPath, null, calenderLoad);
	
function calenderLoad() {
	if (httpRequest.readyState === 4) {
		if (httpRequest.status === 200) {
	console.log(httpRequest.responseText);
	
	let needCalData = JSON.parse(httpRequest.responseText);
	
//	let testGG =  {
//    	    googleCalendarId: ggCalId,
//    	    color: '#be5683'
//	}
//	console.log("=================================");
//	console.log(testGG.googleCalendarId);
//	console.log("=================================");
	
	if(selectCal === "NG" || selectCal === "") {
		topCalTitle.innerText = "우리의 민족!!! " + userId + "님의 구직관리 calendar";
		evnets = []; // 배열 초기화
		for (var i = 0; i < needCalData.length; i++) {
			let evnetObj = new Object();
			evnetObj.title = needCalData[i].NEED_TITLE;
			evnetObj.start = needCalData[i].STARTTIME.replace(" ", "T");
			evnetObj.end = needCalData[i].ENDTIME.replace(" ", "T");
			evnetObj.color = needCalData[i].NEED_COLOR;
			evnetObj.id = needCalData[i].NEED_MEMBER_NO;
			evnetObj.type = needCalData[i].NEED_GO_MEET;
			evnets[i] = evnetObj;
		}
	}
	
	if(selectCal === "W") {
		topCalTitle.innerText = "우리의 민족!!! " + userId + "님의 근무관리 calendar";
		evnets = []; // 배열 초기화
		for (var i = 0; i < needCalData.length; i++) {
			let evnetObj = new Object();
			evnetObj.title = needCalData[i].WORK_TITLE;
			evnetObj.start = needCalData[i].STARTTIME.replace(" ", "T");
			evnetObj.end = needCalData[i].ENDTIME.replace(" ", "T");
			evnetObj.color = needCalData[i].WORK_COLOR;
			evnetObj.id = needCalData[i].WORK_MEMBER_NO;
			evnetObj.type = needCalData[i].WORK_TYPE;
			evnetObj.dayWorkTime = needCalData[i].WORK_TIME;
			evnetObj.money =  needCalData[i].WORK_MONEY;
			evnets[i] = evnetObj;
		}
	}
	
	console.log("******************************************");
	console.log(evnets);
	console.log("******************************************");
	
//	let ggCals = document.getElementsByClassName('ggCalEvent');
//	console.log(ggCals);
//	console.log(ggCals.length);
	
	var calendarEl = document.getElementById('calendar');
    var calendar = new FullCalendar.Calendar(calendarEl, {
    	googleCalendarApiKey : "AIzaSyAbwR6yZe1SWMSCRpoRaYJCTKpIslPr0xw",
        headerToolbar: {
            left: 'prevYear,prev,next,nextYear today',
            center: 'title',
            right: 'dayGridMonth,dayGridWeek,listMonth'
        },
        initialView: 'dayGridMonth',
        locale: 'ko',
        slotMinTime: '00:00', // 시작 시간이 하루의 맨 처음(자정)임을 의미
        slotMaxTime: '24:00', // 종료 시간이 하루의 끝(자정)임을 의미합니다.
        selectable: true, // 클릭한 요일 배경색 변하기
        editable: true,
        navLinks: true, // 요일을 눌러서 해당 요일의 상세페이지로 이동할 수 있냐 없냐(뒤로가기 history.back() 하나 만들어야할듯)
        dayMaxEvents: true, // allow "more" link when too many events(이벤트 개수가 넘치면 +2 같은 형식으로 보여준다.)
        displayEventTime: true, // don't show the time column in list view
        // 드래그앤드랍 설정
        droppable: true, // this allows things to be dropped onto the calendar
        nowIndicator: true, // 현재 시간을 나타내는 마커를 표시할지 여부(표시기는 사용자가 달력을 보는 동안 자동으로 위치를 변경)
        eventDisplay : 'block', // 이벤트 디스플레이
        // 'auto'(기본값) : daygrid에 있을 때 이벤트가 하루 종일 또는 여러 날인 경우 이벤트를 단색 직사각형으로 렌더링, 시간 제한 이벤트인 경우 점으로 렌더링
        // eventOverlap : true,
        eventClick : (info) => { // 이벤트 클릭시 eventClickInfo
        	console.log(info.event);
            console.log(info.event.start);
            console.log(info.event.end);

            // 클릭한 이벤트의 시작 Date 관련 정보 배열
            let startTimeArr = info.event.start.toString().split(" ");
            
            // 클릭한 이벤트의 종료 Date 관련 정보 배열
            // let endTimeArr = info.event.end.toString().split(" ");
            
            // 클릭한 이벤트의 종료 Date 관련 정보 배열
            let endTimeArr;
            if (info.event.end == null) {endTimeArr = startTimeArr}
            else {endTimeArr = info.event.end.toString().split(" ");}

            // 조건으로 사용할 title
            let clickEventTitle = info.event.title;

            // 조건으로 사용할 startTime
            let clickEventStartTime = startTimeArr[4];

            // 조건으로 사용할 EndTime
            let clickEventEndTime = endTimeArr[4];

            // 종료 시간이 00시 00분일 경우 24시 00분으로 변환
            if (clickEventEndTime === "00:00:00") {clickEventEndTime = "24:00:00";}

            // 이벤트 상세보기 팝업
            detailEvent(clickEventTitle, clickEventStartTime, clickEventEndTime);
        }, 
        dateClick : () => { // 날짜 클릭하면 일정추가 모달창 팝업(이벤트 외의 부분 클릭)
            startDayEle.innerText = "";
            endDayEle.innerText = "";
            startTimeEle.value = "";
            endTimeEle.value = "";
            titleEle.value = "";
            colorEle.value = "#0d6efd";
            fourbtnEleVal = "";
            
            $(".modalTypeLabel").css({"background-color":"white","color":"royalblue"}); // 라벨 색깔 원래대로
            for (let i = 0; i < inputRadioEle.length; i++) {inputRadioEle[i].checked = false;} // 라디오 버튼 체크 해제
            
            calUpdateBtn.style.display = 'none'; // 수정 버튼 숨기기
            calSubmitBtn.style.display = 'block'; // 등록 버튼 보이기
            calDeleteBtn.style.display = 'none'; // 삭제 버튼 숨기기
            
            // 현재 선택한 calender의 종류에 따라 일정추가 type display 결정
            if(selectCal === "NG" || selectCal === "") {
                // 입력 모달창 타입 <label> 관련 코드
            	goLabelEle.style.display = 'block';
            	meetLabelEle.style.display = 'block';
            	/*workLabelEle.style.display = 'none';*/
            	
            	// 근무 & 시급 <input> & <label>
            	moneyLabel.style.display = 'none';
            	workLabel.style.display = 'none';
            } else {
                // 입력 모달창 타입 <label> 관련 코드
            	goLabelEle.style.display = 'none';
            	meetLabelEle.style.display = 'none';
            	/*workLabelEle.style.display = 'block';*/
            	
            	// 근무 & 시급 <label>
            	workMoneyInputEle.value = "";
            	workTimeInputEle.value = "";
            	moneyLabel.style.display = 'block';
            	workLabel.style.display = 'block';
            }

        	// 모달창 pop up
            modalBack.style.display = 'block';
        },
        eventDrop : (info) => { // 드래그 이벤트를 받은 객체에 대한 정보(그 날짜 그대로면 해당 이벤트는 실행 X)
            console.log("############eventDrop###########");
            // TODO
            // 여기서 ajax 써야할듯
            // console.log(info.event.title);
            // console.log(info.event.id);
//            console.log(info.event.start);
//            console.log(info.event.end);
//            console.log(typeof info.event.start);
//            console.log(typeof info.event.end);
//            console.log(typeof info.event.start.toString());
//            console.log(typeof info.event.end.toString());
            
            // 연도
            let startYear = info.event.start.toString().split(" ")[3];
            let endYear = info.event.end.toString().split(" ")[3];
            console.log("startYear : " + startYear);
            console.log("endYear : " + endYear);
            
            // 월            
            let startMonth = info.event.start.toString().split(" ")[1];
            let endMonth = info.event.end.toString().split(" ")[1];
            console.log("startMonth : " + startMonth);
            let startMonthNum = changeMonth(startMonth);
            console.log("startMonthNum : " + startMonthNum);
            
            console.log("endMonth : " + endMonth);
            let endMonthNum = changeMonth(endMonth);
            console.log("endMonthNum : " + endMonthNum);
            
            // 일
            let startDay = info.event.start.toString().split(" ")[2];
            let endDay = info.event.end.toString().split(" ")[2];
            console.log("startDay : " + startDay);
            console.log("endDay : " + endDay);
            
            // 합치기
            let startAll = startYear + "-" + startMonthNum + "-" + startDay;
            let endAll = endYear + "-" + endMonthNum + "-" + endDay;
            console.log("startAll : " + startAll);
            console.log("endAll : " + endAll);
            
            // 2021-11-03T11:00:00.000Z
            // 2021-11-03T12:00:00.000Z

            let draggedEventTitle = info.event.title;
            let draggedEventStartTime = info.event.start.toISOString().split('T')[0];
            let draggedEventEndTime = info.event.end.toISOString().split('T')[0];
            
//            console.log(typeof info.event.start);
//            console.log(typeof info.event.start.toISOString());
//            console.log(info.event.start.toString());
//            console.log("info.event.start.toISOString() : " + info.event.start.toISOString());
//            console.log("info.event.end.toISOString() : " + info.event.end.toISOString());
//
//            console.log("draggedEventTitle : " + draggedEventTitle);
//            console.log("draggedEventStartTime : " + draggedEventStartTime);
//            console.log("draggedEventEndTime : " + draggedEventEndTime);
            
            let dragUpdateStart = startAll + " " + info.event.start.toString().split(" ")[4];
            let dragUpdateEnd = endAll + " " + info.event.end.toString().split(" ")[4];
            console.log("dragUpdateStart : " + dragUpdateStart);
            console.log("dragUpdateEnd : " + dragUpdateEnd);
            
// =============================================
            // 일정 드래그 수정
            if(selectCal === "NG" || selectCal === "") {
	            let dragUpdateNeedObj = {
	        		needMemberNo : info.event.id,
	        		needTimeStart : dragUpdateStart,
	        		needTimeEnd : dragUpdateEnd
	            }
	            sendRequest("PATCH", "needupdatedrag", JSON.stringify(dragUpdateNeedObj), afterDragUpdate);
            } else if(selectCal === "W") {
	            let dragUpdateWorkObj = {
	            		workMemberNo : info.event.id,
	            		workTimeStart : dragUpdateStart,
	            		workTimeEnd : dragUpdateEnd
	            }
	            sendRequest("PATCH", "workupdatedrag", JSON.stringify(dragUpdateWorkObj), afterDragUpdate);
            }
// =============================================

            // movedEvent(draggedEventTitle, draggedEventStartTime, draggedEventEndTime);
            console.log("############eventDrop###########");
        },
        eventSources : [
          {
			  googleCalendarId: ggCalId,
			  className: 'ggCalEvent',
			  color: changeRGB()
		  },
		  {
			  googleCalendarId: ggCaKoId,
			  className: 'ggCalKo',
			  color: changeRGB()
		  },
		  {
			  events : evnets
		  }
        ],
        loading : function(bool) {
            if (bool) {
            	console.log("before");
             } else {
            	 console.log("after");
             }
          }
    });
    calendar.render();
    
    // 등록된 이벤트 관련 내용
    let eventList = document.getElementsByClassName('fc-daygrid-event-harness');
    for (let i = 0; i < eventList.length; i++) {
            eventList[i].onclick = detailEvent;
    }
		}
	}
}

// 근무일정 drag update callbackfunction
function afterDragUpdate() {
	if (httpRequest.readyState === 4) {
		if (httpRequest.status === 200) {
			if(selectCal === "NG" || selectCal === "") {
				sendRequest("GET", getPath, null, calenderLoad); // 구직 일정 드래그 수정 후 다시 전체 일정 data 가져오기
			} else {
				sendRequest("GET", getWorkPath, null, calenderLoad); // 근무 일정 드래그 수정 후 다시 전체 일정 data 가져오기
			}
		}
	}
}

// month switch function
function changeMonth(monthStr) {
    let monthNum = 0;

    switch (monthStr) {
        case "Jan": monthNum = 01; break;
        case "Feb": monthNum = 02; break;
        case "Mar": monthNum = 03; break;
        case "Apr": monthNum = 04; break;
        case "May": monthNum = 05; break;
        case "Jun": monthNum = 06; break;
        case "Jul": monthNum = 07; break;
        case "Aug": monthNum = 08; break;
        case "Sep": monthNum = 09; break;
        case "Oct": monthNum = 10; break;
        case "Nov": monthNum = 11; break;
        case "Dec": monthNum = 12; break;
    }
    
    return monthNum;
}
// ============================================================================================================
//모달창 팝업 callback function
//function modalUp() {
//    // 모달창 초기회(by 기존 일정 수정, 새로운 일정 추가)
//    startDayEle.innerText = "";
//    endDayEle.innerText = "";
//    startTimeEle.value = "";
//    endTimeEle.value = "";
//    titleEle.value = "";
//    fourbtnEleVal = "";
//    colorEle.value = "#0d6efd";
//    document.getElementById('calUpdateBtn').style.display = 'none'; // 수정 버튼 숨기기
//    
//    calUpdateBtn.style.display = 'none'; // 수정 버튼 숨기기
//    calSubmitBtn.style.display = 'block'; // 등록 버튼 보이기
//    calDeleteBtn.style.display = 'none'; // 삭제 버튼 숨기기
//    $(".modalTypeLabel").css({"background-color":"white","color":"royalblue"}); // 라벨 색깔 원래대로
//    for (let i = 0; i < inputRadioEle.length; i++) {inputRadioEle[i].checked = false;} // 라디오 버튼 체크 해제
//    
//    // 입력 모달창 타입 <label> 관련 코드
//	goLabelEle.style.display = 'block';
//	meetLabelEle.style.display = 'block';
//	workLabelEle.style.display = 'block';
//
//    modalBack.style.display = 'block';
//}

function detailEvent(title, startTime, endTime) {
    console.log(title); // 클릭한 이벤트 제목
    console.log(evnets);
    for (let i = 0; i < evnets.length; i++) {
        if (title == evnets[i].title && startTime == evnets[i].start.split('T')[1] && endTime == evnets[i].end.split('T')[1]) {
        	console.log("=========================");
        	console.log(evnets[i]);
        	console.log("=========================");

            // 시작 시간
            let startVal = evnets[i].start.split('T')[1].split(":")[0] + ":" + evnets[i].start.split('T')[1].split(":")[1];

            // 종료 시간
            let endVal = evnets[i].end.split('T')[1].split(":")[0] + ":" + evnets[i].end.split('T')[1].split(":")[1];

            modalBack.style.display = 'block';
            $(".modalTypeLabel").css({"background-color":"white","color":"royalblue"});
            titleEle.value = evnets[i].title;
            startDayEle.innerText = evnets[i].start.split('T')[0];
            endDayEle.innerText = evnets[i].end.split('T')[0];
            startTimeEle.value = startVal;
            endTimeEle.value = endVal;
            colorEle.value = evnets[i].color;
            eventGroupId = evnets[i].id;
            
            console.log("^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^");
            console.log(evnets[i].money);
            console.log("^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^");
            
            if(selectCal === "W") {
            	workMoneyInputEle.value = evnets[i].money;
            	workTimeInputEle.value = evnets[i].dayWorkTime;
            }
            
            // 입력 모달창 타입 <label> 관련 코드
            if(evnets[i].type === "G" || evnets[i].type === "M") {
            	goLabelEle.style.display = 'block';
            	meetLabelEle.style.display = 'block';
            	/*workLabelEle.style.display = 'none';*/
            	
            	// 근무 & 시급 <label>
            	moneyLabel.style.display = 'none';
            	workLabel.style.display = 'none';
            } else if(evnets[i].type === "W") {
            	goLabelEle.style.display = 'none';
            	meetLabelEle.style.display = 'none';
            	/*workLabelEle.style.display = 'block';*/            
            	
            	// 근무 & 시급 <input> & <label>
//            	workMoneyInputEle.value = "";
//            	workTimeInputEle.value = "";
            	moneyLabel.style.display = 'block';
            	workLabel.style.display = 'block';
            }
            
            
            calUpdateBtn.style.display = 'block'; // 수정 버튼 보이기
            calSubmitBtn.style.display = 'none'; // 등록 버튼 숨기기
            calDeleteBtn.style.display = 'block'; // 삭제 버튼 보이기
            for (let i = 0; i < inputRadioEle.length; i++) {inputRadioEle[i].checked = false;} // 라디오 버튼 체크 해제
        }
    }
}

function movedEvent(title, newStartDay, newEndDay) {
    console.log("title : " + title);
    console.log("newStartDay : " + newStartDay);
    console.log("newEndDay : " + newEndDay);
    for (let i = 0; i < evnets.length; i++) {
        if (title == evnets[i].title) {
            // evnets[i].title = title;
            evnets[i].start = newStartDay + "T" + evnets[i].start.split('T')[1];
            evnets[i].end = newEndDay + "T" + evnets[i].end.split('T')[1];

            console.log("*****************************");
            console.log(evnets[i].title);
            console.log(evnets[i].start);
            console.log(evnets[i].end);
            console.log("*****************************");
        }
    }
}

function changeRGB() {
	// 0~255값을 랜덤으로 뽑아내서 각각의 변수 r,g,b 에 들어간다.
	let r = Math.round(Math.random() * 255); 
	let g = Math.round(Math.random() * 255);
	let b = Math.round(Math.random() * 255);
	 
	let random_color = "rgba(" + r + "," + g + "," + b + ")";
	 
	return random_color;
}