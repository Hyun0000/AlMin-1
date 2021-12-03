// ========================================== 일정 추가 ================================================
calSubmitBtn.onclick = calSubmit;

function calSubmit() {
	let submitBool = true;
	
	// 클릭된 라디오 버튼의 value 담기
    for (let k = 0; k < inputRadioEle.length; k++) {
        if (inputRadioEle[k].checked) {fourbtnEleVal = inputRadioEle[k].value;}
    }

    // 시작 날짜 + 시간
    // allStart = startDayEle.innerText + "T" + startTimeEle.value;
    allStart = startDayEle.innerText + " " + startTimeEle.value;

    // 종료 날짜 + 시간
    // allEnd = endDayEle.innerText + "T" + endTimeEle.value;
    allEnd = endDayEle.innerText + " " + endTimeEle.value;
    
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
    
    if (submitBool === true) {
		if(fourbtnEleVal === 'G' || fourbtnEleVal === 'M') {
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
		    console.log("fourbtnEleVal : " + fourbtnEleVal);
			sendRequest("POST", "calender", JSON.stringify(insertParam), afterCalInsert);
			// sendRequest("POST", "insertCalneed", JSON.stringify(insertParam), afterCalInsert);
		} else if(fourbtnEleVal === 'W') {
			let insertWorkParam = {
					workMemberId : userId,
					workTitle : titleEle.value,
					workTime : "8", // 우선 이걸로 고정값
					workColor : colorEle.value,
					workTimeStart : allStart,
					workTimeEnd : allEnd,
					workMoney : "9500", // 우선 이걸로 고정값
					workType : fourbtnEleVal
			}
		    console.log(userId);
		    console.log(JSON.stringify(insertWorkParam));
		    console.log("fourbtnEleVal : " + fourbtnEleVal);
		    sendRequest("POST", "works", JSON.stringify(insertWorkParam), afterCalInsert);
		}
	}
    
//	private int workMemberNo;
//	private String workMemberId; 
//	private String workMemberType;
//	private String workTitle;
//	private String workColor;
//	private String workTimeStart;
//	private String workTimeEnd;
//	private int workMoney;
//	private String workType;
//	INSERT INTO MEMBER_WORK VALUES (MEMBER_WORK_SEQUENCE.NEXTVAL, 'user01', '1', '롯데월드', '#003300',
//	TO_DATE('2021-11-02 23:00:00','yyyy-mm-dd hh24:mi:ss'), TO_DATE('2021-11-03 11:00:00','yyyy-mm-dd hh24:mi:ss'), 9500, 'W');  
// &&&&&&&&&&
//    let insertParam = {
//    		needMemberId : userId,
//    		needTitle : titleEle.value,
//    		needColor : colorEle.value,
//    		needTimeStart : allStart,
//    		needTimeEnd : allEnd,
//    		needGoMeet : fourbtnEleVal
//    }
//    
//    console.log(insertParam);
//    console.log(JSON.stringify(insertParam));
//    console.log("fourbtnEleVal : " + fourbtnEleVal); // fourbtnEleVal : W
//    
//    if (submitBool === true) {
//    	sendRequest("POST", "insertCalneed", JSON.stringify(insertParam), afterCalInsert);
//    }
}
// ============================== 일정 추가 후 callback function ==============================
function afterCalInsert() {
	if (httpRequest.readyState === 4) {
		if (httpRequest.status === 200) {
			console.log(httpRequest.responseText);
			if (httpRequest.responseText === 'ok') {
				alert("일정 추가 성공");
				console.log("fourbtnEleVal callback function : " + fourbtnEleVal);
				modalBack.style.display = 'none';
				
				if(fourbtnEleVal === "G" || fourbtnEleVal === "M") {
					sendRequest("GET", getPath, null, calenderLoad); // 구직 일정 등록 후 다시 전체 일정 data 가져오기
				} else if(fourbtnEleVal === "W") {
					sendRequest("GET", getWorkPath, null, calenderLoad); // 근무 일정 등록 후 다시 전체 일정 data 가져오기
				}
			} else {
				alert("일정 추가 실패");
				modalBack.style.display = 'none';
			}
		}
	}
}
//========================================== 일정 삭제 ================================================
calDeleteBtn.onclick = calDelete;

// 조건 : 제목, 시작시간. 종료시간
function calDelete() {
	let deleteConfirm = confirm("일정을 삭제하시겠습니까?");
	
    // 시작 날짜 + 시간
    allStart = startDayEle.innerText + " " + startTimeEle.value;

    // 종료 날짜 + 시간
    allEnd = endDayEle.innerText + " " + endTimeEle.value;
	
//    let deleteParam = {
//    		needTitle : titleEle.value,
//    		needTimeStart : allStart,
//    		needTimeEnd : allEnd
//    }
    
    if(deleteConfirm) {
    	if(selectCal === "NG" || selectCal === "") {
    		let deleteParam = {
    				needMemberNo : eventGroupId,
    				needMemberId : userId
    		}
    		console.log(deleteParam);
    	    console.log(JSON.stringify(deleteParam));
    		sendRequest("DELETE", "calender", JSON.stringify(deleteParam), afterCalDelete);
    	} else if(selectCal === "W") {
    		let deleteWorkParam = {
    				workMemberNo : eventGroupId,
    				workMemberId : userId
    		}
    		console.log(deleteWorkParam);
    	    console.log(JSON.stringify(deleteWorkParam));
    		sendRequest("DELETE", "works", JSON.stringify(deleteWorkParam), afterCalDelete);
    	}
    }
    
    
//	private int needMemberNo;
//	private String needMemberId;
//	private String needMemberType;
//	private String needTitle;
//	private String needColor;
//	private String needTimeStart;
//	private String needTimeEnd;
//	private String needGoMeet;
    
    
//    console.log(deleteParam);
//    console.log(JSON.stringify(deleteParam));
//	
//	if(deleteConfirm) {
//		sendRequest("DELETE", "calender", JSON.stringify(deleteParam), afterCalDelete);
//	}
}

//============================== 일정 삭제 후 callback function ==============================
function afterCalDelete() {
	if (httpRequest.readyState === 4) {
		if (httpRequest.status === 200) {
			if (httpRequest.responseText === 'ok') {
				alert("삭제 완료");
				modalBack.style.display = 'none';
				
				if(selectCal === "NG" || selectCal === "") {
					// 삭제된 일정을 events 배열에서 삭제
					let deleteEventObj = evnets.findIndex(obj => obj.title === titleEle.value);
					evnets.splice(deleteEventObj, 1);
					sendRequest("GET", getPath, null, calenderLoad); // 구직 일정 등록 후 다시 전체 일정 data 가져오기
				} else if(selectCal === "W") {
					// 삭제된 일정을 events 배열에서 삭제
					let deleteEventObj = evnets.findIndex(obj => obj.title === titleEle.value);
					evnets.splice(deleteEventObj, 1);
					sendRequest("GET", getWorkPath, null, calenderLoad); // 근무 일정 등록 후 다시 전체 일정 data 가져오기
				}
				
//			    console.log("############# 1 ###############");
//			    console.log(evnets);
//			    console.log("############# 1 ###############");
//				
//				// 삭제된 일정을 events 배열에서 삭제
//				let deleteEventObj = evnets.findIndex(obj => obj.title === titleEle.value);
//				evnets.splice(deleteEventObj, 1);
//				
//			    console.log("############# 2 ###############");
//			    console.log(evnets);
//			    console.log("############# 2 ###############");
				// ex)
				// arr3.findIndex(i => i.name == "스펀지밥"); 
				// array.findIndex(obj => obj.name == "뚱이");
				
				
				// sendRequest("GET", getPath, null, calenderLoad); // 일정 삭제 후 다시 전체 일정 data 가져오기
			} else if(httpRequest.responseText === 'false') {
				alert("삭제 실패");
				modalBack.style.display = 'none';
				// sendRequest("GET", getPath, null, calenderLoad);
			}
		}
	}
}
//========================================== 일정 수정 ================================================
calUpdateBtn.onclick = calUpdate;

function calUpdate() {
	let updateConfirm = confirm("수정하시겠습니까?");
	
    // 시작 날짜 + 시간
    allStart = startDayEle.innerText + " " + startTimeEle.value;

    // 종료 날짜 + 시간
    allEnd = endDayEle.innerText + " " + endTimeEle.value;
    
    if(updateConfirm) {
    	if(selectCal === "NG" || selectCal === "") {
    		// 일정 수정(받는 값 : 일정 번호(ID), 유저 아이디, 일정 제목, 일정 색상, 시작일(시간), 종료일(시간), 면접 or 구직 구분값)
    		let updateParam = {
    				needMemberNo : eventGroupId,
    				needMemberId : userId,
    				needTitle : titleEle.value,
    				needColor : colorEle.value,
    				needTimeStart : allStart,
    				needTimeEnd : allEnd,
    				needGoMeet : fourbtnEleVal
    		}
    	    console.log(updateParam);
    	    console.log(JSON.stringify(updateParam));
    	    sendRequest("PATCH", "calender", JSON.stringify(updateParam), afterCalUpdate);
    	} else if(selectCal === "W") {
    		// 근무 일정 수정(받는 값 : 일정 번호(ID), 유저 아이디, 일정 제목, 일정 색상, 시작일(시간), 종료일(시간), 시급)
    		let updateWorkParam = {
    				workMemberNo : eventGroupId,
    				workMemberId : userId,
    				workTitle : titleEle.value,
    				workColor : colorEle.value,
    				workTimeStart : allStart,
    				workTimeEnd : allEnd,
    				workMoney : "10000" // 임시 값
    		}
    	    console.log(updateWorkParam);
    	    console.log(JSON.stringify(updateWorkParam));
    	    sendRequest("PATCH", "works", JSON.stringify(updateWorkParam), afterCalUpdate);
    	}
    }
// 일정 수정(받는 값 : 일정 번호(ID), 유저 아이디, 일정 제목, 일정 색상, 시작일(시간), 종료일(시간), 면접 or 구직 구분값)
//	let updateParam = {
//			needMemberNo : eventGroupId,
//			needMemberId : userId,
//			needTitle : titleEle.value,
//			needColor : colorEle.value,
//			needTimeStart : allStart,
//			needTimeEnd : allEnd,
//			needGoMeet : fourbtnEleVal
//	}
    
//    console.log("#################################");
//    console.log(updateParam);
//    console.log(JSON.stringify(updateParam));
//    console.log("#################################");
    
//	if(updateConfirm) {
//		sendRequest("PATCH", "calender", JSON.stringify(updateParam), afterCalUpdate);
//	}
}
//============================== 일정 수정 후 callback function ==============================
function afterCalUpdate() {
	if (httpRequest.readyState === 4) {
		if (httpRequest.status === 200) {
			if (httpRequest.responseText === 'ok') {
				alert("수정 완료");
				modalBack.style.display = 'none';
				// sendRequest("GET", getPath, null, calenderLoad); // 일정 수정 후 다시 전체 일정 data 가져오기
				
				if(selectCal === "NG" || selectCal === "") {
					sendRequest("GET", getPath, null, calenderLoad); // 구직 일정 수정 후 다시 전체 구직 일정 data 가져오기
				} else if(selectCal === "W") {
					sendRequest("GET", getWorkPath, null, calenderLoad); // 근무 일정 수정 후 다시 전체 근무 일정 data 가져오기
				}
			} else {
				alert("수정 미완료");
				modalBack.style.display = 'none';
			}
		}
	}
}
//private int needMemberNo;
//private String needMemberId;
//private String needMemberType;
//private String needTitle;
//private String needColor;
//private String needTimeStart;
//private String needTimeEnd;
//private String needGoMeet;

//INSERT INTO MEMBER_NEED VALUES (MEMBER_NEED_SEQUENCE.NEXTVAL, 'user01', '1', 'apple', '2', '명륜갈비', '#003300', TO_DATE('2021-11-02 23:00:00','yyyy-dd-mm hh24:mi:ss'), 'M');
//SELECT TO_CHAR(NEED_TIME_DAY, 'yyyy-mm-dd hh24:mi:ss') FROM MEMBER_NEED;
//-- 2021-02-11 23:00:00 --> REPLACE 사용해서 가운데에 T 넣기
//--start: '2021-11-01T09:00:00'
//--end : '2021-11-02T23:00:00'
//--이벤트명 / 날짜+T+시간 / 색깔(기본값 필요) - 무조건 #ff0000 형식으로 입력

//NEED_MEMBER_NO 		NUMBER 			PRIMARY KEY,
//NEED_MEMBER_ID 		varchar2(50), 	-- 복합 외래키 지정(MEMBER)
//NEED_MEMBER_TYPE 	char(1) 		DEFAULT 1, -- 복합 외래키 지정(MEMBER)
//NEED_TITLE 			varchar2(50) 	NOT NULL,
//NEED_COLOR 			varchar2(10) 	DEFAULT '#0d6efd',
//NEED_TIME_START 		TIMESTAMP 		NOT NULL, -- 면접 혹은 지원 날짜(시작)
//NEED_TIME_END 		TIMESTAMP 		NOT NULL, -- 면접 혹은 지원 날짜(종료)
//NEED_GO_MEET 		char(1) 		CHECK(NEED_GO_MEET IN('G', 'M')), -- 면접인지 지원인지 구분


