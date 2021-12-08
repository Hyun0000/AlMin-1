// ====================================================== 차트 ========================================================
const careerCt = document.getElementById('careerChart');

const careerChart = new Chart(careerCt, {
    type: 'doughnut',
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
            y: {
                beginAtZero: true,
                position: 'none'
            }
        },
        plugins: {
            legend: {
                position: 'top'
                // display: false // (label: '# of Votes') 지우기
            },
            title: {
                display: true,
                text: '경력'
            }
        }
    }
});

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

// ====================================================== 모달 ========================================================
for (let i = 0; i < candidateDivs.length; i++) {
    candidateDivs[i].onclick = modalUp;
}

function modalUp() {
    // 모달창 띄우기
    candidateModalBack.style.display = 'flex';
    
//    console.log(this.querySelector('.candidate_name_class'));
//    console.log(this.querySelector('.candidate_birth_class'));
//    console.log(this.querySelector('.candidate_gneder_class'));
//    console.log(this.querySelector('.candidate_phone_class'));
//    console.log(this.querySelector('.candidate_email_class'));
    modalName.innerText = this.querySelector('.candidate_name_class').innerText + "님의 상세정보";
    modalBirth.innerText = this.querySelector('.candidate_birth_class').innerText;
    modalGender.innerText = this.querySelector('.candidate_gneder_class').innerText;
    modalPhone.innerText = this.querySelector('.candidate_phone_class').innerText;
    modalEmail.innerText = this.querySelector('.candidate_email_class').innerText;
}

// 모달창 닫기 이벤트(클릭)
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