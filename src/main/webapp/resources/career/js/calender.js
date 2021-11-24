    document.addEventListener('DOMContentLoaded', function () { // onload
    var calendarEl = document.getElementById('calendar');
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
        events: [
        {
        title: 'Business Lunch',
        start: '2021-11-01T13:00:00',
        constraint: 'availableForMeeting', // 있으면 이벤트 이동을 할수 없다.
        color: 'red'
        },
        {
        title: 'Meeting',
        start: '2021-11-11T11:00:00',
        constraint: 'availableForMeeting', // defined below
        color: '#257e4a'
        },
        {
        title: 'Meeting',
        start: '2021-11-11T14:00:00',
        constraint: 'availableForMeeting', // defined below
        color: '#257e4a'
        },
        {
        title: 'Meeting',
        start: '2021-11-11T15:00:00',
        constraint: 'availableForMeeting', // defined below
        color: '#257e4a'
        },
        {
        title: 'Meeting',
        start: '2021-11-11T16:00:00',
        constraint: 'availableForMeeting', // defined below
        color: '#257e4a'
        },
        {
        title: 'Meeting',
        start: '2021-11-11T19:00:00',
        constraint: 'availableForMeeting', // defined below
        color: '#257e4a'
        },
        {
        title: 'Conference',
        start: '2021-11-20',
        end: '2021-11-21T20:00:00'
        },
        {
        title: 'Party',
        start: '2021-11-04T20:00:00'
        },
        {
        groupId: 999,
        title: 'Repeating Event',
        start: '2021-11-16T16:00:00'
        },
        {
        groupId: 999, // 공유하는 이벤트는 groupId자동으로 함께 드래그되고 크기가 조정됩니다.
        title: 'Repeating Event',
        start: '2021-11-23T20:00:00'
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
        start: '2021-11-30'
        }
        ]
    });
    calendar.render();

    // 각 날짜를 클릭했을 때 모달창 팝업 callback function 등록
    let dayDay = document.getElementsByClassName('fc-day');
    for (let i = 0; i < dayDay.length; i++) {
        dayDay[i].onclick = modalUp;
    }
});  // onload

// // 모달창 팝업 callback function
// function modalUp() {
//     document.getElementById('ModalBg').style.display = 'block';
//     // document.getElementById('miniCal').style.display = 'block';
// }

// // 모달창 팝업 닫기
// function modalClose() {
//     document.getElementById('ModalBg').style.display = 'none';
// }

// function miniCalUp() {
//     document.getElementById('miniCal').style.display = 'block';
//     console.log(this);
//     console.log(event.target);
//     console.log(event.target.id);
//     let selectTest = event.target.id;
//     console.log(selectTest);
// }

