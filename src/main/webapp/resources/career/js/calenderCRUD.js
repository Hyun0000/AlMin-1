// 이벤트를 담을 객체 배열
// let evnets = [];
//========================================== 일정 조회  ================================================
//window.onload = function() {
//	let getPath = "/calender/" + userId;
//	console.log(getPath);
//	sendRequest("GET", getPath, afterLoadSelect);
//}


// calender 첫 load 후 callback function
//function afterLoadSelect() {
//	console.log(123);
//	if (httpRequest.readyState === 4) {
//		console.log(123);
//		if (httpRequest.status === 200) {
//			console.log(123);
//			alert(123);
//			console.log(httpRequest.responseText);
//			test();
//		}
//	}
//}
// ========================================== 일정 추가 ================================================
calSubmitBtn.onclick = calSubmit;

function calSubmit() {
	let submitBool = true;
	
	// 클릭된 라디오 버튼의 value 담기
    for (let k = 0; k < inputRadioEle.length; k++) {
        if (inputRadioEle[k].checked) {fourbtnEleVal = inputRadioEle[k].value;}
    }

    // 시작 날짜 + 시간
    allStart = startDayEle.innerText + "T" + startTimeEle.value;

    // 종료 날짜 + 시간
    allEnd = endDayEle.innerText + "T" + endTimeEle.value;
    
    // 시작일과 종료일이 같은데 종료시간이 시작시간 보다 빠를때
    if (startDayEle.innerText === endDayEle.innerText && startTimeEle.value > endTimeEle.value) {
        alert('시간을 올바르게 입력해주세요');
        endTimeEle.value = ""; return false;
    }

    // 라디오 버튼 element 유효성 검사
    if (fourbtnEleVal === "") {
        alert("일정의 종류를 선택해주세요");
        submitBool = false; return false;
    }

    // 제목 입력 유효성 검사
    if (titleEle.value.length == 0 || titleEle.value.length > 10) {
        alert("제목의 글자수를 맞게 입력해주세요");
        submitBool = false; return false;
    }
    
    // 날짜 시간 등록 유효성 검사
    if (startDayEle.innerText === "" || endDayEle.innerText === "" || startTimeEle.value === "" || endTimeEle.value === "") {
        alert("날짜와 시간을 모두 입력해주세요");
        submitBool = false; return false;
    }
    
    console.log("일정 등록 시작 시간 : " + allStart);
    console.log("일정 등록 종료 시간 : " + allEnd);
    console.log("일정 등록 type 버튼 : " + fourbtnEleVal);
    console.log("색깔 value : " + colorEle.value);
    
    let insertParam = {
		needMemberId : userId,
		needTitle : titleEle.value,
		needColor : colorEle.value,
		needTimeStart : allStart,
		needTimeEnd : allEnd,
		needGoMeet : fourbtnEleVal
    }
    
    console.log(insertParam);
    console.log(JSON.stringify(insertParam));
    
    if (submitBool === true) {
    	sendRequest("POST", "insertCalneed", JSON.stringify(insertParam), afterCalInsert);
	}

}

// 일정 추가후 callback function
function afterCalInsert() {
	if (httpRequest.readyState === 4) {
		if (httpRequest.status === 200) {
			console.log(httpRequest.responseText);
			if (httpRequest.responseText === 'ok') {
				alert("등록 완료");
				modalBack.style.display = 'none';
				
				
			}
		}
	}
}



//INSERT INTO MEMBER_NEED VALUES (MEMBER_NEED_SEQUENCE.NEXTVAL, 'user01', '1', 'apple', '2', '명륜갈비', '#003300', TO_DATE('2021-11-02 23:00:00','yyyy-dd-mm hh24:mi:ss'), 'M');

//SELECT TO_CHAR(NEED_TIME_DAY, 'yyyy-mm-dd hh24:mi:ss') FROM MEMBER_NEED;

//-- 2021-02-11 23:00:00 --> REPLACE 사용해서 가운데에 T 넣기
//--start: '2021-11-01T09:00:00'
//--end : '2021-11-02T23:00:00'
//--이벤트명 / 날짜+T+시간 / 색깔(기본값 필요) - 무조건 #ff0000 형식으로 입력

// private int needMemberNo;
// private String needMemberId;
// private String needMemberType;
// private String needTitle;
// private String needColor;
// private String needTimeStart;
// private String needTimeEnd;
// private String needGoMeet;


