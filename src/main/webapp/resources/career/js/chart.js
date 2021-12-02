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

// ajax를 통해 GET method로 보낼 path
// TODO
// 유저아이디도 매개변수로 넘겨야함 PATHVARIABLE 사용???
let getNeedChartPath = "/almin/careers/needchart?year=" + date.getFullYear() + "&month=" + (date.getMonth() + 1);

console.log("getNeedChartPath : " + getNeedChartPath);

// 년도 & 월에 맞는 data 가져오는 event
dateInputBtn.onclick = () => {
    console.log(yearInput.value + " : " + monthInput.value);
}

careerCalButn.onclick = () => {
	calDiv.style.display = 'none';
	chartDiv.style.display = 'block';
	topCalTitle.innerText = "우리의 민족!!! 칠갑산님의 MyChart";
	
	sendRequest("GET", getNeedChartPath, null, loadChart);
}

// window.onload = function () { onload 시작

function loadChart() {

// 구직 & 면접 횟수를 담을 배열
let needchartArr = [12, 19];

//// 년&월 입력칸에 현재 날짜 값 넣기(년)
//yearInput.value = date.getFullYear();
//
////년&월 입력칸에 현재 날짜 값 넣기(년)
//monthInput.value = date.getMonth() + 1;

//근무 변수
const workCt = document.getElementById('workChart');

// 구직 변수
const needCt = document.getElementById('needChart');

// 경력 변수
const careerCt = document.getElementById('careerChart');
//============================================================================================================
	// 구직 chart
	const needChart = new Chart(needCt, {
	type: 'pie',
	data: {
	    labels: ['지원 횟수', '면접 횟수'],
	    datasets: [{
	        // data: [12, 19, 3, 5, 2, 3],
	        data: needchartArr,
	        backgroundColor: [
	            'rgba(255, 99, 132, 0.2)',
	            'rgba(54, 162, 235, 0.2)'
	            // 'rgba(255, 206, 86, 0.2)'
	            // 'rgba(75, 192, 192, 0.2)',
	            // 'rgba(153, 102, 255, 0.2)',
	            // 'rgba(255, 159, 64, 0.2)'
	        ],
	        borderColor: [
	            'rgba(255, 99, 132, 1)',
	            'rgba(54, 162, 235, 1)'
	            // 'rgba(255, 206, 86, 1)'
	            // 'rgba(75, 192, 192, 1)',
	            // 'rgba(153, 102, 255, 1)',
	            // 'rgba(255, 159, 64, 1)'
	        ]
	        // , borderWidth: 1 // 그래프 바깥선
	    }]
	},
	options: {
	    plugins: {
	        legend: {
	            position: 'top',
	        },
	        title: {
	            display: true,
	            text: '구직 관리'
	        }
	    },
	    scales: {
	        y: {
	            beginAtZero: true,
	            position: 'none'
	        }
	    }
	    // , events : () => {
	    //     alert(123);
	    // } ajax 사용
	}
	});
//============================================================================================================
	// 근무 chart
	const workChart = new Chart(workCt, {
	type: 'doughnut',
	data: {
	    labels: ['Red', 'Blue', 'Yellow', 'Green'],
	    datasets: [{
	        data: [32, 19, 3, 5], // 알바별 월 알바비 총량
	        // data: [32, 19, 3, 5, 2, 3],
	        backgroundColor: [
	            'rgba(255, 99, 132, 0.2)',
	            'rgba(54, 162, 235, 0.2)',
	            'rgba(255, 206, 86, 0.2)',
	            'rgba(75, 192, 192, 0.2)'
	            // 'rgba(153, 102, 255, 0.2)',
	            // 'rgba(255, 159, 64, 0.2)'
	        ],
	        borderColor: [
	            'rgba(255, 99, 132, 1)',
	            'rgba(54, 162, 235, 1)',
	            'rgba(255, 206, 86, 1)',
	            'rgba(75, 192, 192, 1)'
	            // 'rgba(153, 102, 255, 1)',
	            // 'rgba(255, 159, 64, 1)'
	        ],
	        borderWidth: 3, // 그래프 바깥 경계
	        hoverOffset: 10 // 그래프 마우스 hover시
	    }]
	},
	options: {
	    plugins: {
	        legend: {
	            position: 'top',
	        },
	        title: {
	            display: true,
	            text: '경력 관리'
	        }
	    },
	    scales: {
	        y: {
	            beginAtZero: true,
	            position: 'none'
	        }
	    },
	    cutout: "60%", // 도넛 원형 크기 설정
	    borderRadius: 5 // 그래프 끝 radius 설정
	}
	});
// ============================================================================================================
	// 경력 chart
	const careerChart = new Chart(careerCt, {
	type: 'bar',
	data: {
	    labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
	    datasets: [{
	        label: '# of Votes',
	        data: [32, 19, 3, 5, 2, 3],
	        backgroundColor: [
	            'rgba(255, 99, 132, 0.2)',
	            'rgba(54, 162, 235, 0.2)',
	            'rgba(255, 206, 86, 0.2)',
	            'rgba(75, 192, 192, 0.2)',
	            'rgba(153, 102, 255, 0.2)',
	            'rgba(255, 159, 64, 0.2)'
	        ],
	        borderColor: [
	            'rgba(255, 99, 132, 1)',
	            'rgba(54, 162, 235, 1)',
	            'rgba(255, 206, 86, 1)',
	            'rgba(75, 192, 192, 1)',
	            'rgba(153, 102, 255, 1)',
	            'rgba(255, 159, 64, 1)'
	        ],
	        borderWidth: 1
	    }]
	},
	options: {
	    scales: {
	        // yAxes : [{ // y축 그래프 범위
	        //     ticks : {
	        //         min : -10,
	        //         max : 100,
	        //         stepSize : 5,
	        //         position: 'none'
	        //     }
	        // }],
	        y: {
	            beginAtZero: true
	            // position: 'none'
	        }
	    },
	    plugins: {
	        legend: {
	            position: 'top',
	            display: false // (label: '# of Votes') 지우기
	        },
	        title: {
	            display: true,
	            text: '근무 관리'
	        }
	    }
	}
	});
}
// } onload 끝