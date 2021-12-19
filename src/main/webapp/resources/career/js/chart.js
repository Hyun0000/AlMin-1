// 구직 chart 담는 <div>
let needChartBox = document.getElementById('needChartDiv');

// 근무 chart 담는 <div>
let workChartBox = document.getElementById('workChartDiv');

// 경력 chart 담는 <div>
let careerChartBox = document.getElementById('careerChartDiv');

// 날짜 조회 버튼
let dateInputBtn = document.getElementById('date_input_btn');

//date 객체 선언
let date = new Date();

// 년도 입력 <input>
let yearInput = document.getElementById('yearInput');

// 월 입력 <input>
let monthInput = document.getElementById('monthInput');

//년&월 입력칸에 현재 날짜 값 넣기(년)
yearInput.value = date.getFullYear();

//년&월 입력칸에 현재 날짜 값 넣기(년)
monthInput.value = date.getMonth() + 1;

//ajax를 통해 GET method로 보낼 path
// 구직 & 면접
let getNeedChartPath = "/almin/careers/needchart/" + userId + "?year=" + date.getFullYear() + "&month=" + (date.getMonth() + 1);
console.log("getNeedChartPath : " + getNeedChartPath);

// 근무
let getWorkChartPath = "/almin/careers/workchart/" + userId + "?year=" + date.getFullYear() + "&month=" + (date.getMonth() + 1);
console.log("getWorkChartPath : " + getWorkChartPath);

// 경력
let getCareerChartPath = "/almin/careers/careerchart/" + userId;
console.log("getWorkChartPath : " + getCareerChartPath);

// 년도 & 월에 맞는 data 가져오는 event
dateInputBtn.onclick = () => {
    console.log(yearInput.value + " : " + monthInput.value);
    // ajax 코드 필요
    getNeedChartPath = "/almin/careers/needchart/" + userId + "?year=" + yearInput.value + "&month=" + (monthInput.value);
    console.log("경력 조회 : getNeedChartPath" + " : " + getNeedChartPath);
    
    getWorkChartPath = "/almin/careers/workchart/" + userId + "?year=" + yearInput.value + "&month=" + (monthInput.value);
    console.log("근무 조회 : getNeedChartPath" + " : " + getNeedChartPath);
    
    sendRequest("GET", getNeedChartPath, null, afterNeedChart);
}

// 좌측 사이드 버튼을 클릭하면 chart 화면으로 전환
careerCalButn.onclick = () => {
	selectCal = "C";
	
	// 경력 추가 버튼 보이기
	careerInsertBtn.style.display = "block";
	
	// 좌측 사이드 이미지
	document.getElementById('slide_first_img').style.display = "none";
	document.getElementById('slide_second_img').style.display = "none";
	document.getElementById('slide_third_img').style.display = "block";
	
	careerInputTable.style.display = "block";
	
	calDiv.style.display = 'none';
	chartDiv.style.display = 'block';
	topCalTitle.innerText = "우리의 민족!!! " + userId + "님의 MyChart";
	
	sendRequest("GET", getNeedChartPath, null, afterNeedChart);
}
// ======================================================================================================
// 구직 & 면접 횟수를 담을 배열
let needchartArr = [];

// 구직 data ajax callback function
function afterNeedChart() {
	if (httpRequest.readyState === 4) {
		if (httpRequest.status === 200) {
			let needCalChartData = JSON.parse(httpRequest.responseText);
			console.log(needCalChartData);
			
			 needchartArr = [];
			
			for (var i = 0; i < needCalChartData.length; i++) {
				needchartArr[i] = needCalChartData[i].COUNT_TYPE;
			}
			sendRequest("GET", getWorkChartPath, null, afterWorkChart);
		}
	}	
}
//======================================================================================================
// 근무 data 중 근무일수를 담을 배열
let workChartDay = [];

// 근무 data 중 매장명을 담을 배열
let workChartTitle = [];

// 그래프 배경색
let backgroundColorArr = [];

// 그래프 border 색
let borderColorArr = [];

// 근무 data ajax callback function
function afterWorkChart() {
	if (httpRequest.readyState === 4) {
		if (httpRequest.status === 200) {
			let workCalChartData = JSON.parse(httpRequest.responseText);
			console.log(workCalChartData);
			
			workChartDay = [];
			workChartTitle = [];
			
			// 근무 chart에 data 및 색깔널기
			for (var i = 0; i < workCalChartData.length; i++) {
				
				workChartDay[i] = workCalChartData[i].WORKDAY;
				workChartTitle[i] = workCalChartData[i].WORK_TITLE;
				
				let colorTemp = changeRGBA();
				// 그래프 배경 색
				backgroundColorArr[i] = colorTemp;
				// 그래프 border
				borderColorArr[i] = colorTemp.replace(",0.2)", ")");
			}
			console.log(workChartDay);
			
			// let tabelEle = document.getElementById('moneyTabelReal');
			
			// <table> 초기화
			while (moneyTable.hasChildNodes()) {
				moneyTable.removeChild(moneyTable.firstChild);
			}

			
			if(workCalChartData.length != 0) { // 근무 데이터가 있을때만 테이블 동적 생성
				let trHEle = document.createElement('tr');
				moneyTable.appendChild(trHEle);
				
				let firstHTdEle = document.createElement('td');
				firstHTdEle.setAttribute('class', 'firstTd tableColName');
				firstHTdEle.innerText = "매장";
				trHEle.appendChild(firstHTdEle);
				
				let secondHTdEle = document.createElement('td');
				secondHTdEle.setAttribute('class', 'secondTd tableColName');
				secondHTdEle.innerText = "급여(월)";
				trHEle.appendChild(secondHTdEle);
				
				
				// 월급 테이블 계산
				for (var i = 0; i < workCalChartData.length; i++) {
					
					// <tr>
					let trEle = document.createElement('tr');
					moneyTable.appendChild(trEle);
	
					// 매장명이 담기는 <td>
					let firstTdEle = document.createElement('td');
					firstTdEle.setAttribute('class', 'firstTd');
					firstTdEle.innerText = workCalChartData[i].WORK_TITLE;
					trEle.appendChild(firstTdEle);
	
					// 월급이 담기는 <td>
					let secondTdEle = document.createElement('td');
					secondTdEle.setAttribute('class', 'secondTd');
					secondTdEle.innerText = workCalChartData[i].WORK_TIME * workCalChartData[i].WORKDAY * workCalChartData[i].WORK_MONEY + "원";
					trEle.appendChild(secondTdEle);
				}
			}
			sendRequest("GET", getCareerChartPath, null, afterCareerChart);
			// TODO 마지막 ajax callback function에서 해야함
		}
	}	
}
//======================================================================================================
// 개인 경력을 횟수 담을 배열
let careerchartArr = [];

// 개인 경력을 제목 담을 배열
let careerchartTitleArr = [];

// 그래프 배경색
let careerBackgroundColorArr = [];

// 그래프 border 색
let careerBorderColorArr = [];

// 경력 조회  data ajax callback function
function afterCareerChart() {
	if (httpRequest.readyState === 4) {
		if (httpRequest.status === 200) {
			let careerCalChartData = JSON.parse(httpRequest.responseText);
			console.log(careerCalChartData);
			
			careerchartArr = [];
			
			for (var i = 0; i < careerCalChartData.length; i++) {
				careerchartArr[i] = careerCalChartData[i].COUNT;
				careerchartTitleArr[i] = careerCalChartData[i].JOB_TYPE_NAME;
				
				let careerColorTemp = changeRGBA();
				
				// 그래프 배경 색
				careerBackgroundColorArr[i] = careerColorTemp;
				
				// 그래프 border
				careerBorderColorArr[i] = careerColorTemp.replace(",0.2)", ")");
			}
			
			loadChart();
		}
	}
}

//근무 변수
const workCt = document.getElementById('workChart');

// 구직 변수
const needCt = document.getElementById('needChart');

// 경력 변수
const careerCt = document.getElementById('careerChart');

// 구직 차트 객체를 담을 변수
let needChart;

// 근무 차트 객체를 담을 변수
let workChart;

// 경력 차트 객체를 담을 변수
let careerChart;

// window.onload = function () { onload 시작
function loadChart() {

//// 년&월 입력칸에 현재 날짜 값 넣기(년)
//yearInput.value = date.getFullYear();
//
////년&월 입력칸에 현재 날짜 값 넣기(년)
//monthInput.value = date.getMonth() + 1;

//============================================================================================================
	// 구직 chart
	// chart가 최초 한 번 load된 후 재 load시 destroy 진행 
	if(chartLoad == "loded") {
		needChart.destroy();
		workChart.destroy();
		careerChart.destroy();
	}
	
	// const needChart = new Chart(needCt, {
	needChart = new Chart(needCt, {
	type: 'pie',
	data: {
	    labels: ['면접 횟수', '지원 횟수'],
	    datasets: [{
	        data: needchartArr,
	        backgroundColor: ['rgba(255, 99, 132, 0.2)', 'rgba(54, 162, 235, 0.2)'],
	        borderColor: ['rgba(255, 99, 132, 1)', 'rgba(54, 162, 235, 1)'],
	        borderWidth: 3, // 그래프 바깥선
	    	hoverOffset: 10
	    }]
	},
	options: {
	    plugins: {
	        legend: {
	            position: 'bottom'
	        },
	        title: {
	            display: true,
	            text: '지원 & 면접 횟수',
            	color : "black",
        		padding: 20,
            	font : {
            		weight: 'bolder',
            		size : 20
    			},
	        }
	    },
	    scales: {
	        y: {
	            beginAtZero: true,
	            position: 'none',
	            grid:{display:false} // 격자 지우기
	        },
	    }
	}
	});
	
	// 차트에 해당하는 data 유무에 따라 보여줄 객체 선택
	if(needchartArr.length === 0) {
		document.getElementById('needChart').style.display = "none";
		document.getElementById('needChart_alterImage').style.display = "block";
	} else {
		document.getElementById('needChart').style.display = "block";
		document.getElementById('needChart_alterImage').style.display = "none";
	}
//============================================================================================================
	// 근무 chart
	// const workChart = new Chart(workCt, {
	workChart = new Chart(workCt, {
	type: 'doughnut',
	data: {
	    // labels: ['Red', 'Blue', 'Yellow', 'Green'],
	    labels: workChartTitle,
	    datasets: [{
	        data: workChartDay, // 알바별 월 근무 일수
	        backgroundColor: backgroundColorArr,
	        borderColor: borderColorArr,
	        borderWidth: 3, // 그래프 바깥 경계
	        hoverOffset: 10 // 그래프 마우스 hover시
	    }]
	},
	options: {
	    plugins: {
	        legend: {
	            position: 'bottom'
	        },
	        title: {
	            display: true,
	            text: '근무 일수',
            	color : "black",
        		padding: 20,
            	font : {
            		weight: 'bolder',
            		size : 20
    			},
	        }
	    },
	    scales: {
	        y: {
	            beginAtZero: true,
	            position: 'none',
	            grid:{ display:false} // 격자 지우기
	        }
	    },
	    cutout: "60%", // 도넛 원형 크기 설정
	    borderRadius: 5 // 그래프 끝 radius 설정
	}
	});
	
	// 차트에 해당하는 data 유무에 따라 보여줄 객체 선택
	if(workChartDay.length === 0) {
		document.getElementById('workChart').style.display = "none";
		document.getElementById('workChart_alterImage').style.display = "block";
	} else {
		document.getElementById('workChart').style.display = "block";
		document.getElementById('workChart_alterImage').style.display = "none";
	}
// ============================================================================================================
	// 경력 chart
	// const careerChart = new Chart(careerCt, {
	careerChart = new Chart(careerCt, {
	type: 'pie',
	data: {
	    labels: careerchartTitleArr,
	    // labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
	    datasets: [{
//	        label: '# of Votes',
	        // data: [32, 19, 3, 5, 2, 3],
	        data: careerchartArr,
	        backgroundColor: careerBackgroundColorArr,
	        borderColor: careerBorderColorArr,
	        borderWidth: 1,
	        hoverOffset: 10
	    }]
	},
	options: {
	    scales: {
	        y: {
	            beginAtZero: true,
	            position: 'none',
	            grid:{ display:false} // 격자 지우기
	        }
	    },
	    borderRadius: 5,
	    plugins: {
	        legend: {
	            position: 'bottom'
	            // display: false // (label: '# of Votes') 지우기
	        },
	        title: {
	            display: true,
	            text: '경력',
            	color : "black",
        		padding: 20,
            	font : {
            		weight: 'bolder',
            		size : 20
    			},
	        }
	    }
	}
	});
	
	if(careerchartArr.length === 0) {
		document.getElementById('careerChart').style.display = "none";
		document.getElementById('careerChart_alterImage').style.display = "block";
	} else {
		document.getElementById('careerChart').style.display = "block";
		document.getElementById('careerChart_alterImage').style.display = "none";
	}
	
	// chart가 최초 한 번 load된 후 재 load시 destroy를 위한 변수 값 할당
	chartLoad = "loded";
}
// } onload 끝

// 색깔 랜덤 생성(그래프 배경 & border)
function changeRGBA() {
	// 0~255값을 랜덤으로 뽑아내서 각각의 변수 r,g,b 에 들어간다.
	let r = Math.round(Math.random() * 255); 
	let g = Math.round(Math.random() * 255);
	let b = Math.round(Math.random() * 255);
	 
	let random_color = "rgba(" + r + "," + g + "," + b + "," + 0.2 + ")";
	 
	return random_color;
}
//============================================================================================================
// 경력 추가
careerIsertBtn.onclick = () => {
	console.log("직종 : " + jobTypeSelect.value + " 기간 : " + jobPeriodSelect.value + " 내용 : " + careerInputEle.value);
	
	let careerInputBool = true;
	
	let careerInputObject = {
		careersMemberId : userId,
		careersType : jobTypeSelect.value,
		careersTime : jobPeriodSelect.value,
		careerPart : careerInputEle.value
	};
	
	// 직무 타입 입력 유효성 검사
	if(jobTypeSelect.value === "job_type_no") {
		alert("근무 직종을 선택해 주세요");
		careerInputBool = false; return false;
	}
	
	// 근무 기간 입력 유효성 검사
	if(jobPeriodSelect.value === "job_period_no") {
		alert("근무 기간을 선택해 주세요");
		careerInputBool = false; return false;
	}
	
	// 근무 내용 입룍 유효성 검사(1~15자 입력)
	if(careerInputEle.value.length === 0 || careerInputEle.value.length > 15) {
		alert("근무 내용을 1자 ~ 15 이내로 입력해주세요");
		careerInputBool = false; return false;
	}
	
	if(careerInputBool === true) {
		console.log(careerInputObject);
	    console.log(JSON.stringify(careerInputObject));
	    
	    sendRequest("POST", "careerchart", JSON.stringify(careerInputObject), afterCareerInput);
	}
}

// 경력 추가 callback function
function afterCareerInput() {
	if (httpRequest.readyState === 4) {
		if (httpRequest.status === 200) {
			if (httpRequest.responseText === 'ok') {
				alert("경력 추가 성공");
				
				jobTypeSelect.value = "";
				jobPeriodSelect.value = "";
				careerInputEle.value = "";
				document.getElementById('careerInputTable_box').style.display = "none";
				
				// 경력 입력 후 chart 전체 새로 load
				sendRequest("GET", getNeedChartPath, null, afterNeedChart);
			} else if(httpRequest.responseText === 'false') {
				alert("경력 추가 실패");
			}
		}
	}
}


careerInsertBtn.onclick = () => {
	document.getElementById('careerInputTable_box').style.display = "block";
}

//모달창 팝업 닫기(Esc 눌렀을때)
document.onkeydown = (event) => {
    if (event.keyCode == 27 && document.getElementById('careerInputTable_box').style.display == 'block') {
    	document.getElementById('careerInputTable_box').style.display = 'none';
    }
}

//모달창 팝업 닫기(배경 눌렀을때)
window.onclick = () => {
    if (event.target == document.getElementById('careerInputTable_box')) {
    	document.getElementById('careerInputTable_box').style.display = 'none';
    }
}
