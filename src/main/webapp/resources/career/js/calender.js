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

let evnets = [
    {
    title: 'Business Lunch',
    start: '2021-11-01T09:00',
    end : '2021-11-01T10:00',
    constraint: 'availableForMeeting', // 있으면 이벤트 이동을 할수 없다.
    color: 'red'
    },
    {
    title: 'Meeting1',
    start: '2021-11-11T11:00',
    end: '2021-11-11T14:00',
    constraint: 'availableForMeeting', // defined below
    color: '#257e4a'
    },
    {
    title: 'Meeting2',
    start: '2021-11-11T14:00',
    end: '2021-11-11T15:00',
    constraint: 'availableForMeeting', // defined below
    color: '#257e4a'
    },
    {
    title: 'Meeting3',
    start: '2021-11-11T15:00',
    end: '2021-11-11T16:00',
    constraint: 'availableForMeeting', // defined below
    color: '#257e4a'
    },
    {
    title: 'Meeting4',
    start: '2021-11-11T16:00',
    end: '2021-11-11T17:00',
    constraint: 'availableForMeeting', // defined below
    color: '#257e4a'
    },
    {
    title: 'Meeting5',
    start: '2021-11-11T19:00',
    end: '2021-11-11T20:00',
    constraint: 'availableForMeeting', // defined below
    color: '#257e4a'
    },
    {
    title: 'Conference',
    start: '2021-11-20T20:00',
    end: '2021-11-21T20:00'
    },
    {
    title: 'Party',
    start: '2021-11-04T20:00',
    end: '2021-11-04T21:00'
    },
    {
    groupId: 999,
    title: 'Repeating Event1',
    start: '2021-11-16T16:00',
    end: '2021-11-16T21:00'
    },
    {
    groupId: 999, // 공유하는 이벤트는 groupId자동으로 함께 드래그되고 크기가 조정됩니다.
    title: 'Repeating Event2',
    start: '2021-11-23T20:00',
    end: '2021-11-23T21:00'
    },
    // red areas where no events can be dropped
    {
    start: '2021-11-28',
    end: '2021-11-30',
    overlap: false,
    display: 'background',
    color: '#ff9f89'
    },
    {
    title: 'Click for Google',
    url: 'https://blog.naver.com/rakpink',
    start: '2021-11-30T20:00',
    start: '2021-11-30T20:00'
    }
]
// ================================= 이벤트 목록 =================================
    document.addEventListener('DOMContentLoaded', function () { // onload
    var calendarEl = document.getElementById('calendar');
    // calendarEl.setAttribute('style', 'background : red;');
    // calendarEl.setAttribute('style', 'border: 1px solid black;');
    var calendar = new FullCalendar.Calendar(calendarEl, {
        headerToolbar: {
            left: 'prevYear,prev,next,nextYear today',
            center: 'title',
            right: 'dayGridMonth,dayGridWeek,dayGridDay,listMonth'
            // right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
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
        drop: function(arg) {
            // is the "remove after drop" checkbox checked?
            if (document.getElementById('drop-remove').checked) {
            // if so, remove the element from the "Draggable Events" list
            arg.draggedEl.parentNode.removeChild(arg.draggedEl);
            }
        // 드래그앤드랍 설정
        },
        // events : eventarr
        events: evnets
    });
    calendar.render();

    // 각 날짜를 클릭했을 때 모달창 팝업 callback function 등록
    // let dayDay = document.getElementsByClassName('fc-day');
    let dayDay = document.getElementById('insert_evnet_btn');
    dayDay.onclick = modalUp;
    // for (let i = 0; i < dayDay.length; i++) {
    //     dayDay[i].onclick = modalUp;
    // }

    //console.log(document.getElementsByClassName('.fc-daygrid-event'));
    //console.log(document.getElementsByClassName('.fc-daygrid-event')[0]);
    console.log(document.getElementsByClassName('fc-event-title'));
    console.log(document.getElementsByClassName('fc-event-title').length);
    console.log(document.getElementsByClassName('fc-event-title')[0]);
    console.log(document.getElementsByClassName('fc-event-title')[6]);
    console.log(document.getElementsByClassName('fc-event-title')[0].innerText);
    // 등록된 이벤트 관련 내용
    let eventList = document.getElementsByClassName('fc-daygrid-event-harness');
    console.log(document.getElementsByClassName('fc-daygrid-event-harness').length);
    for (let i = 0; i < eventList.length; i++) {
            eventList[i].onclick = detailEvent;
            eventList[i].setAttribute("draggable", "true");
            eventList[i].setAttribute("ondrag", "apple(event);");
            // document.getElementById('top_title').ondrag = apple;
            // eventList[i].ondragstart = apple;
            // eventList[i].addEventListener('drop',  () => {
            //     console.log(123);
            //     alert(123);
            // });
    }
    // var tableEle = document.querySelector('.fc-scrollgrid-liquid');
    // tableEle.setAttribute('style', 'border: 1px solid black;');

    // var tableEle2 = document.querySelectorAll('.fc-scrollgrid-liquid td');
    // tableEle2.setAttribute('style', 'border: 1px solid black;');

});  // onload
function detailEvent() {
    // 클릭한 이벤트 제목
    let title = this.querySelector('.fc-event-title').innerText;
    console.log("&&&&&&&&&&&&&");
    console.log(title);
    for (let i = 0; i < evnets.length; i++) {
        if (title == evnets[i].title) {
            console.log("@@@@@@@@@@@@@@###########");
            console.log(evnets[i].title);
            console.log(evnets[i].start);
            console.log(evnets[i].start.split('T'));
            console.log(evnets[i].start.split('T')[0]);
            console.log(evnets[i].start.split('T')[1]);
            console.log(evnets[i].end);

            modalBack.style.display = 'block';
            titleEle.value = evnets[i].title;
            startDayEle.innerText = evnets[i].start.split('T')[0];
            endDayEle.innerText = evnets[i].end.split('T')[0];
            startTimeEle.value = evnets[i].start.split('T')[1];
            endTimeEle.value = evnets[i].end.split('T')[1];

        }
    }

    console.log(event.target);
    console.log(this);
    // console.log(this.getElementsByClassName('fc-event-title')[0]);
    console.log(this.querySelector('.fc-event-title'));
}

function apple() {
    alert(123);
    console.log(123122353565674563456);
}     