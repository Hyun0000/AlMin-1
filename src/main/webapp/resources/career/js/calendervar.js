// 모달 배경(검은 배경)
let modalBack = document.getElementById('ModalBg');

// 미니 달력 모달칭 배경
let miniCalBack = document.getElementById('mimiCalbg');

// 제목 입력칸
let titleEle = document.getElementById('recipient-name');

// 시작일 입력칸
let startDayEle = document.getElementById('startDay');

// 종료일 입력칸
let endDayEle = document.getElementById('endDay');

// 시작 시간 입력칸
let startTimeEle = document.getElementById('startTime');

// 종료 시간 입력칸
let endTimeEle = document.getElementById('endTime');

// 색깔 입력칸
let colorEle = document.getElementById('colorPicker');

// 일정 추가 모달창에서 시작일, 종료일 <div>의 id를 담을 변수
let selectTest;

// 시작 날짜 + 시간
let allStart;

// 종료 날짜 + 시간
let allEnd

// 입력 모달창 상단 버튼 4개
let labelEles = document.getElementsByClassName('modalTypeLabel');

// 라디오 버튼 element(모달창 4개의 라디오 버튼)
let inputRadioEle = document.querySelectorAll(".typeRadio");

// 클릭된 라디오 버튼의 value
let fourbtnEleVal;

// 모달창 일정 등록 버튼
let calSubmitBtn = document.getElementById('calSubmitBtn');

// 모달창 일정 수정 버튼
let calUpdateBtn = document.getElementById('calUpdateBtn');







//달력 최상단 제목 <div>
let topCalTitle = document.getElementById('top_title');

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
//    color: '#ff0000'
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
//    color : "#ff0000"
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