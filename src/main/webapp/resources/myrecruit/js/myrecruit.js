// ====================================================== 변수 ========================================================
// 모달창 배경
let candidateModalBack = document.getElementById('modal_back');

// 각 참여자들의 정보를 담는 <div> 배열
let candidateDivs = document.getElementsByClassName('candidate_box');

// 모달 content - name
let modalName = document.getElementById('candidate_name_id');

// 모달 content - birth
let modalBirth = document.getElementById('candidate_birth_id');

// 모달 content - gender
let modalGender = document.getElementById('candidate_gender_id');

// 모달 content - phone
let modalPhone = document.getElementById('candidate_phone_id');

// 모달 content - email
let modalEmail = document.getElementById('candidate_email_id');

// 최초 한 번 모달 팝업 후 chart destroy를 위한 변수
let chartDestroy = "";

// ====================================================== 모달 ========================================================
// 상세 경력 모달창 팝업 이벤트 등록
for (let i = 0; i < candidateDivs.length; i++) {
    candidateDivs[i].onclick = modalUp;
}

function modalUp() {
	let getCareerChartPath = "/almin/careers/careerchart/" + this.querySelector('.candidate_memberId_class').innerText;
	sendRequest("GET", getCareerChartPath, null, afterMemberChart);
	console.log("=========================================");
	console.log(this);
	console.log("=========================================");
	// chartLoad();
	
    modalName.innerText = this.querySelector('.candidate_name_class').innerText + "님의 상세정보";
    modalBirth.innerText = "생년원일 : " + this.querySelector('.candidate_birth_class').innerText;
    modalGender.innerText = "성별 : " + this.querySelector('.candidate_gneder_class').innerText;
    modalPhone.innerText = "번호 : " + this.querySelector('.candidate_phone_class').innerText;
    modalEmail.innerHTML = "이메일  <br>" + this.querySelector('.candidate_email_class').innerText;
    
    // 모달창 띄우기
    candidateModalBack.style.display = 'flex';
}
// =======================================================================================================================
// 개인 경력을 횟수 담을 배열
let memberCareerchartArr = [];

// 개인 경력을 제목 담을 배열
let memberCareerchartTitleArr = [];

// 그래프 배경색
let memberCareerBackgroundColorArr = [];

// 그래프 border 색
let memberCareerBorderColorArr = [];

const careerCt = document.getElementById('careerChart');

let memberCareerChart;

// 차트 조회 후 callback function
function afterMemberChart() {
	if (httpRequest.readyState === 4) {
		if (httpRequest.status === 200) {
			let memberChartData = JSON.parse(httpRequest.responseText);
			console.log("httpRequest.responseText : " + httpRequest.responseText)
			console.log("memberChartData : " + memberChartData)
			console.log("memberChartData.length : " + memberChartData.length)
			
			// chart에 쓰이는 배열 초기화
			memberCareerchartArr = [];
			memberCareerchartTitleArr = [];
			memberCareerBackgroundColorArr = [];
			memberCareerBorderColorArr = [];
			
			if(memberChartData.length != 0) {
				for (var i = 0; i < memberChartData.length; i++) {
					memberCareerchartArr[i] =  memberChartData[i].COUNT;
					memberCareerchartTitleArr[i] = memberChartData[i].JOB_TYPE_NAME;
					
					let careerColorTemp = changeRGBA();
					
					// 그래프 배경 색
					memberCareerBackgroundColorArr[i] = careerColorTemp;
					
					// 그래프 border
					memberCareerBorderColorArr[i] = careerColorTemp.replace(",0.2)", ")");
				}
				
				if (chartDestroy === "loded") {
					memberCareerChart.destroy();
				}
				
				memberCareerChart = new Chart(careerCt, {
					type: 'doughnut',
					data: {
					    labels: memberCareerchartTitleArr,
					    datasets: [{
					        data: memberCareerchartArr, // 알바별 월 알바비 총량
					        backgroundColor: memberCareerBackgroundColorArr,
					        borderColor: memberCareerBorderColorArr,
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
					            text: '경력',
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
					        }
					    },
					    cutout: "60%", // 도넛 원형 크기 설정
					    borderRadius: 5 // 그래프 끝 radius 설정
					}
				});
				
				// 최초 한 번 모달 팝업 후 chart destroy를 위한 변수 값 할당
				chartDestroy = "loded";
				
				document.getElementById('careerChart').style.display = "block";
				document.getElementById('alterImage').style.display = "none";
			} else {
				document.getElementById('careerChart').style.display = "none";
				document.getElementById('alterImage').style.display = "block";
			}
			
		}
	}
}
//====================================================== 차트 ========================================================
//const careerCt = document.getElementById('careerChart');
//
//let memberCareerChart;

// function chartLoad() {
//	if (chartDestroy === "loded") {
//		memberCareerChart.destroy();
//	}
//	
//	memberCareerChart = new Chart(careerCt, {
//		type: 'doughnut',
//		data: {
//		    labels: memberCareerchartTitleArr,
//		    datasets: [{
//		        data: memberCareerchartArr, // 알바별 월 알바비 총량
//		        backgroundColor: memberCareerBackgroundColorArr,
//		        borderColor: memberCareerBorderColorArr,
//		        borderWidth: 3, // 그래프 바깥 경계
//		        hoverOffset: 10 // 그래프 마우스 hover시
//		    }]
//		},
//		options: {
//		    plugins: {
//		        legend: {
//		            position: 'top',
//		        },
//		        title: {
//		            display: true,
//		            text: '경력',
//	            	color : "black",
//	        		padding: 20,
//	            	font : {
//	            		weight: 'bolder',
//	            		size : 20
//	    			},
//		        }
//		    },
//		    scales: {
//		        y: {
//		            beginAtZero: true,
//		            position: 'none',
//		            grid:{display:false} // 격자 지우기
//		        }
//		    },
//		    cutout: "60%", // 도넛 원형 크기 설정
//		    borderRadius: 5 // 그래프 끝 radius 설정
//		}
//	});
//	
//	// 최초 한 번 모달 팝업 후 chart destroy를 위한 변수 값 할당
//	chartDestroy = "loded";
// }
//=======================================================================================================================
//색깔 랜덤 생성(그래프 배경 & border)
function changeRGBA() {
	// 0~255값을 랜덤으로 뽑아내서 각각의 변수 r,g,b 에 들어간다.
	let r = Math.round(Math.random() * 255); 
	let g = Math.round(Math.random() * 255);
	let b = Math.round(Math.random() * 255);
	 
	let random_color = "rgba(" + r + "," + g + "," + b + "," + 0.2 + ")";
	 
	return random_color;
}
//=======================================================================================================================
//모달창 닫기 이벤트(클릭)
document.onclick = (event) => {
    console.log(this);
    console.log(event.target);
    if(event.target === candidateModalBack) {
        candidateModalBack.style.display = 'none';
    }
}

// 모달창 팝업 닫기(Esc)
document.onkeydown = (event) => {
    if (event.keyCode == 27 && candidateModalBack.style.display == 'flex') {
        candidateModalBack.style.display = 'none';
    }
}