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

//모달창 일정 삭제 버튼
let calDeleteBtn = document.getElementById('calDeleteBtn');

//달력 최상단 제목 <div>
let topCalTitle = document.getElementById('top_title');

// Ajax를 통해 @PathVariable로 보낼 경로
let getPath = "/almin/careers/calender/" + userId;