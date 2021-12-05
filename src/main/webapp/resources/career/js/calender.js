// 캘린더 등록 이벤트 배열
let evnets = [];

//(지원 / 면접일자) 버튼 선택
needCalButn.onclick = () => {
	selectCal = "NG";
	calDiv.style.display = 'block';
	chartDiv.style.display = 'none';
	careerInputTable.style.display = "none";
	sendRequest("GET", getPath, null, calenderLoad);
}

workCalButn.onclick = () => {
	selectCal = "W";
	calDiv.style.display = 'block';
	chartDiv.style.display = 'none';
	careerInputTable.style.display = "none";
	sendRequest("GET", getWorkPath, null, calenderLoad);
}

// 처음 캘린더 페이지에 들어왔을 때 실행할 Ajax
sendRequest("GET", getPath, null, calenderLoad);
	
function calenderLoad() {
	if (httpRequest.readyState === 4) {
		if (httpRequest.status === 200) {
	console.log(httpRequest.responseText);
	
	let needCalData = JSON.parse(httpRequest.responseText);
	console.log(needCalData);
	
	if(selectCal === "NG" || selectCal === "") {
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
			topCalTitle.innerText = "우리의 민족!!! " + userId + "님의 구직관리 calendar";
		}
	}
	
	if(selectCal === "W") {
		evnets = []; // 배열 초기화
		for (var i = 0; i < needCalData.length; i++) {
			let evnetObj = new Object();
			evnetObj.title = needCalData[i].WORK_TITLE;
			evnetObj.start = needCalData[i].STARTTIME.replace(" ", "T");
			evnetObj.end = needCalData[i].ENDTIME.replace(" ", "T");
			evnetObj.color = needCalData[i].WORK_COLOR;
			evnetObj.id = needCalData[i].WORK_MEMBER_NO;
			evnetObj.type = needCalData[i].WORK_TYPE;
			evnets[i] = evnetObj;
			topCalTitle.innerText = "우리의 민족!!! " + userId + "님의 근무관리 calendar";
		}
	}
	
	var calendarEl = document.getElementById('calendar');
    var calendar = new FullCalendar.Calendar(calendarEl, {
        headerToolbar: {
            left: 'prevYear,prev,next,nextYear today',
            center: 'title',
            right: 'dayGridMonth,dayGridWeek,listMonth'
            // dayGridDay,
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
        drop: function(arg) {
            // is the "remove after drop" checkbox checked?
            if (document.getElementById('drop-remove').checked) {
            // if so, remove the element from the "Draggable Events" list
            arg.draggedEl.parentNode.removeChild(arg.draggedEl);
            }
        // 드래그앤드랍 설정
        },
        eventDragStart : (info, event, view, jsEvent) => { // 드래그 시작
            console.log("############eventDragStart###########");
            // console.log(info.event.title);
            console.log("############eventDragStart###########");
        },
        eventDragStop : (info) => { // 드래그 종료(드래그 당한 이벤트의 정보 - 원래 이벤트 정보)
            console.log("@@@@@@@@@@eventDragStop@@@@@@@@@");
            console.log(info);
            console.log(info.event.title);
            console.log(info.event.start.toISOString()); // 이벤트 드랍받은 날짜&시간(날짜만 이용해라)
            console.log(info.event.end.toISOString()); // 이벤트 드랍받은 날짜(날짜만 이용해라)
            // Party
            // 2021-11-04T11:00:00.000Z
            // 2021-11-04T12:00:00.000Z
            console.log("@@@@@@@@@@eventDragStop@@@@@@@@@");
        },
        eventDrop : (info) => { // 드래그 이벤트를 받은 객체에 대한 정보(그 날짜 그대로면 해당 이벤트는 실행 X)
            // TODO
            // 여기서 ajax 써야할듯
            console.log("==========eventDrop=========");
            console.log(info.event.title);
            console.log(info.event.start.toISOString()); // 이벤트 드랍받은 날짜&시간(날짜만 이용해라)
            console.log(info.event.end.toISOString()); // 이벤트 드랍받은 날짜(날짜만 이용해라)
            // Party
            // 2021-11-03T11:00:00.000Z
            // 2021-11-03T12:00:00.000Z

            let draggedEventTitle = info.event.title;
            let draggedEventStartTime = info.event.start.toISOString().split('T')[0];
            let draggedEventEndTime = info.event.end.toISOString().split('T')[0];

            console.log("draggedEventTitle : " + draggedEventTitle);
            console.log("draggedEventStartTime : " + draggedEventStartTime);
            console.log("draggedEventEndTime : " + draggedEventEndTime);

            movedEvent(draggedEventTitle, draggedEventStartTime, draggedEventEndTime);
            console.log("==========eventDrop=========");
        },
        events: evnets
    });
    calendar.render();

    // 각 날짜를 클릭했을 때 모달창 팝업 callback function 등록
    // let dayDay = document.getElementsByClassName('fc-day');
//    let dayDay = document.getElementById('insert_evnet_btn');
//    dayDay.onclick = modalUp;

    // 등록된 이벤트 관련 내용
    let eventList = document.getElementsByClassName('fc-daygrid-event-harness');
    for (let i = 0; i < eventList.length; i++) {
            eventList[i].onclick = detailEvent;
    }
		}
	}
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
            	workMoneyInputEle.value = "";
            	workTimeInputEle.value = "";
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