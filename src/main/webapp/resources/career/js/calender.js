// ======================== 모달창 변수 ========================
// 모달 배경
let modalBack = document.getElementById('ModalBg');

// 상단 버튼 4개도 해야함

// 제목 입력칸
let titleEle = document.getElementById('recipient-name');

// 시작일 입력칸
let startDayEle = document.getElementById('startDay');

// 종료일 입력칸
let endDayEle = document.getElementById('endDay');

// 시작 시간 입력칸
let startTimeEle = document.getElementById('startTime');

// 시작 시간 입력칸
let endTimeEle = document.getElementById('endTime');

// 색깔 입력칸
let colorEle = document.getElementById('colorPicker');


let evnets = [];

//let evnets = [
//	{
//	title: '',
//	start: '0000-00-00T00:00:00',
//	end : '0000-00-00T00:00:00',
//	color: ''
//	}
//];

//let evnets = [
//    {
//    title: 'Business Lunch',
//    start: '2021-11-01T09:00:00',
//    end : '2021-11-02T23:00:00',
//    constraint: 'availableForMeeting', // 있으면 이벤트 이동을 할수 없다.
//    color: '#ff0000'
//    },
//    {
//    title: 'Business Lunch',
//    start: '2021-11-02T00:00:00',
//    end : '2021-11-03T24:00:00',
//    constraint: 'availableForMeeting', // 있으면 이벤트 이동을 할수 없다.
//    color: '#ff0000'
//    },
//    {
//    title: 'Meeting',
//    start: '2021-11-11T11:00:00',
//    end: '2021-11-11T14:00:00',
//    constraint: 'availableForMeeting', // defined below
//    color: '#257e4a'
//    },
//    {
//    title: 'Meeting',
//    start: '2021-11-11T14:00:00',
//    end: '2021-11-11T15:00:00',
//    constraint: 'availableForMeeting', // defined below
//    color: '#257e4a'
//    },
//    {
//    title: 'Meeting',
//    start: '2021-11-11T15:00:00',
//    end: '2021-11-11T16:00:00',
//    constraint: 'availableForMeeting', // defined below
//    color: '#257e4a'
//    },
//    {
//    title: 'Meeting',
//    start: '2021-11-11T16:00:00',
//    end: '2021-11-11T17:00:00',
//    constraint: 'availableForMeeting', // defined below
//    color: '#257e4a'
//    },
//    {
//    title: 'Meeting',
//    start: '2021-11-11T19:00:00',
//    end: '2021-11-11T20:00:00',
//    constraint: 'availableForMeeting', // defined below
//    textColor : '#257e4a',
//    color : "#ff99ff"
//    },
//    {
//    title: 'Conference',
//    start: '2021-11-20T20:00:00',
//    end: '2021-11-21T23:00:00',
//    color : "#00ccff"
//    },
//    {
//    title: 'Dance',
//    start: '2021-11-20T22:00:00',
//    end: '2021-11-21T23:00:00',
//    color : "#006600"
//    },
//    {
//    title: 'Party',
//    start: '2021-11-04T20:00:00',
//    end: '2021-11-04T21:00:00',
//    color : "#ffff66"
//    },
//    {
//    groupId: 999,
//    title: 'Repeating Event',
//    start: '2021-11-16T16:00:00',
//    end: '2021-11-16T21:00:00',
//    color : "#6600cc"
//    },
//    {
//    groupId: 999, // 공유하는 이벤트는 groupId자동으로 함께 드래그되고 크기가 조정됩니다.
//    title: 'Repeating Event',
//    start: '2021-11-23T20:00:00',
//    end: '2021-11-23T21:00:00',
//    color : "#003300"
//    },
//    // red areas where no events can be dropped
//    {
//    start: '2021-11-28',
//    end: '2021-11-30',
//    overlap: false,
//    display: 'background',
//    color: '#ff9f89'
//    },
//    {
//    title: 'Click for Google',
//    url: 'https://blog.naver.com/rakpink',
//    start: '2021-11-30T20:00',
//    end: '2021-11-30T20:00'
//    }
//]
// ================================= 이벤트 목록 =================================
//    document.addEventListener('DOMContentLoaded', test); 
//    		
//    		
//    function test() { // onload
//		let getPath = "/calender/" + userId;
//		alert(getPath);
//		console.log(getPath);
//		sendRequest("GET", getPath, afterLoadSelect);
//    }

	document.addEventListener('DOMContentLoaded', function () {
		let getPath = "/almin/careers/calender/" + userId;
		sendRequest("GET", getPath, null, calenderLoad);
		// sendRequest("GET", "calendar", null, afterLoad);
	});
		
	function calenderLoad() {
		console.log(httpRequest.responseText);
	    var calendarEl = document.getElementById('calendar');
	    var calendar = new FullCalendar.Calendar(calendarEl, {
	        headerToolbar: {
	            left: 'prevYear,prev,next,nextYear today',
	            center: 'title',
	            right: 'dayGridMonth,dayGridWeek,dayGridDay,listMonth'
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
	            let endTimeArr = info.event.end.toString().split(" ");
	
	            // 조건으로 사용할 title
	            let clickEventTitle = info.event.title;
	
	            // 조건으로 사용할 startTime
	            let clickEventStartTime = startTimeArr[4];
	            console.log("startTimeArr[4] : " + clickEventStartTime);
	            // if (clickEventStartTime === "00:00:00") {
	            //     clickEventStartTime = "24:00:00";
	            // }
	            // console.log("startTimeArr[4] : " + clickEventStartTime);
	
	            // 조건으로 사용할 EndTime
	            let clickEventEndTime = endTimeArr[4];
	            console.log("endTimeArr[4] : " + clickEventEndTime);
	            // 종료 시간이 00시 00분일 경우 24시 00분으로 변환
	            if (clickEventEndTime === "00:00:00") {clickEventEndTime = "24:00:00";}
	
	            console.log("endTimeArr[4] : " + clickEventEndTime);
	
	            console.log(123);
	
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
	
	            let draggedEventTitle = info.event.title;
	            let draggedEventStartTime = info.event.start.toISOString().split('T')[0];
	            let draggedEventEndTime = info.event.end.toISOString().split('T')[0];
	
	            movedEvent(draggedEventTitle, draggedEventStartTime, draggedEventEndTime);
	        },
	        events: evnets
	    });
	    calendar.render();
	
	    // 각 날짜를 클릭했을 때 모달창 팝업 callback function 등록
	    let dayDay = document.getElementById('insert_evnet_btn');
	    dayDay.onclick = modalUp;
	
	    // 등록된 이벤트 관련 내용
	    let eventList = document.getElementsByClassName('fc-daygrid-event-harness');
	    console.log(document.getElementsByClassName('fc-daygrid-event-harness').length);
	    for (let i = 0; i < eventList.length; i++) {
	            eventList[i].onclick = detailEvent;
	    }
	}
// });  // onload
function detailEvent(title, startTime, endTime) {
    // 클릭한 이벤트 제목
    console.log("&&&&&&&&&&&&&");
    console.log(title);
    for (let i = 0; i < evnets.length; i++) {
        if (title == evnets[i].title && startTime == evnets[i].start.split('T')[1] && endTime == evnets[i].end.split('T')[1]) {
            // 시작 시간
            let startVal = evnets[i].start.split('T')[1].split(":")[0] + ":" + evnets[i].start.split('T')[1].split(":")[1];

            // 종료 시간
            let endVal = evnets[i].end.split('T')[1].split(":")[0] + ":" + evnets[i].end.split('T')[1].split(":")[1];

            modalBack.style.display = 'block';
            titleEle.value = evnets[i].title;
            startDayEle.innerText = evnets[i].start.split('T')[0];
            endDayEle.innerText = evnets[i].end.split('T')[0];
            startTimeEle.value = startVal;
            endTimeEle.value = endVal;
            colorEle.value = evnets[i].color;
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
        }
    }
}