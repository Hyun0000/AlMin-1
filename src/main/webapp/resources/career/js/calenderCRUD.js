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
    	if(fourbtnEleVal === 'G' || fourbtnEleVal === 'M' || selectCal === "NG" || selectCal === "") {
	        alert("일정의 종류를 선택해주세요");
	        submitBool = false; return false;
    	}
    }
    
    // 근무 & 시간 정규식 검사
    if(selectCal === "W") {
	    // 시급 정규식 검사
	    if(!workTimeMoneyReg.test(workMoneyInputEle.value)) {
	    	console.log(workTimeMoneyReg.test(workMoneyInputEle));
	    	alert("시급을 정확히 입력해주세요");
	    	submitBool = false; return false;
	    }
	    
	    // 근무시간 정규식 검사
	    if(!workTimeMoneyReg.test(workTimeInputEle.value)) {
	    	console.log(workTimeMoneyReg.test(workTimeInputEle));
	    	alert("시간을 정확히 입력해주세요");
	    	submitBool = false; return false;
	    }
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
		} else {
			let insertWorkParam = {
					workMemberId : userId,
					workTitle : titleEle.value,
					workTime : workTimeInputEle.value,
					workColor : colorEle.value,
					workTimeStart : allStart,
					workTimeEnd : allEnd,
					workMoney : workMoneyInputEle.value,
					workType : "W"
					/*workType : fourbtnEleVal*/
			}
		    console.log(userId);
		    console.log(JSON.stringify(insertWorkParam));
		    console.log("fourbtnEleVal : " + fourbtnEleVal);
		    sendRequest("POST", "works", JSON.stringify(insertWorkParam), afterCalInsert);
		}
	}
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
				} else {
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
    	} else {
    		let deleteWorkParam = {
    				workMemberNo : eventGroupId,
    				workMemberId : userId
    		}
    		console.log(deleteWorkParam);
    	    console.log(JSON.stringify(deleteWorkParam));
    		sendRequest("DELETE", "works", JSON.stringify(deleteWorkParam), afterCalDelete);
    	}
    }
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
				} else {
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

    // 근무/면접 버튼 element 유효성 검사
    if(selectCal === "NG" || selectCal === "") {
	    fourbtnEleVal = ""
	    for (let k = 0; k < inputRadioEle.length; k++) {
	        if (inputRadioEle[k].checked) {fourbtnEleVal = inputRadioEle[k].value;}
	    }
	    console.log("fourbtnEleVal : " + fourbtnEleVal);
		if(fourbtnEleVal === "") {
	        alert("일정의 종류를 선택해주세요");
	        return false;
		}
    }
    
    // 일정 제목 유효성 검사
    if (titleEle.value.length == 0 || titleEle.value.length > 10) {
        alert("제목의 글자수를 맞게 입력해주세요");
        return false;
    }
    
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
    	} else {
    	    // 시급 정규식 검사
    	    if(!workTimeMoneyReg.test(workMoneyInputEle.value)) {
    	    	console.log(workTimeMoneyReg.test(workMoneyInputEle));
    	    	alert("시급을 정확히 입력해주세요");
    	    	submitBool = false; return false;
    	    }
    	    
    	    // 근무시간 정규식 검사
    	    if(!workTimeMoneyReg.test(workTimeInputEle.value)) {
    	    	console.log(workTimeMoneyReg.test(workTimeInputEle));
    	    	alert("시간을 정확히 입력해주세요");
    	    	submitBool = false; return false;
    	    }
    	    
    		// 근무 일정 수정(받는 값 : 일정 번호(ID), 유저 아이디, 일정 제목, 일정 색상, 시작일(시간), 종료일(시간), 시급, 일 근무시간)
    		let updateWorkParam = {
    				workMemberNo : eventGroupId,
    				workMemberId : userId,
    				workTitle : titleEle.value,
    				workColor : colorEle.value,
    				workTimeStart : allStart,
    				workTimeEnd : allEnd,
    				workTime : workTimeInputEle.value,
    				workMoney : workMoneyInputEle.value
    		}
    	    console.log(updateWorkParam);
    	    console.log(JSON.stringify(updateWorkParam));
    	    sendRequest("PATCH", "works", JSON.stringify(updateWorkParam), afterCalUpdate);
    	}
    }
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
				} else {
					sendRequest("GET", getWorkPath, null, calenderLoad); // 근무 일정 수정 후 다시 전체 근무 일정 data 가져오기
				}
			} else {
				alert("수정 미완료");
				modalBack.style.display = 'none';
			}
		}
	}
}