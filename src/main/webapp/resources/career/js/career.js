/**
 * 
 */
window.onload = function () {
// ========================================================================================
	// itembox에 근무지명 채우기
    document.getElementById('textJsAjax').onclick = sendRequset;

    // XHR 객체를 담을 전역변수
    let httpRequest = null;

    // XHR 객체 만들기
    function getXHR() {
        return new XMLHttpRequest();

//        if (httpRequest == null) {
//            alert("올바른 브라우저를 이용하거라");
//            return false;
//        }
    }

    // server에 요청 보내기(url과 method 방식은 정해져 있으므로 따로 parameter로 적지않는다.)
    function sendRequset(params) {
        httpRequest = getXHR();

        let userIdParam = params;

        // open
        httpRequest.open("GET", "works");

        // 타입 지정
        httpRequest.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');

        // callback function 지정
        httpRequest.onreadystatechange = selectAllWork;

        // send
        httpRequest.send();
    }

    // callback function 등록
    function selectAllWork() {
        if (httpRequest.readyState === 4) {
            if (httpRequest.status === 200) {
            	console.log(httpRequest.responseText);
            	
            	// item <div>
            	let itemList = document.getElementsByClassName('fc-event-main');
            	
            	// contorller로 부터 전달받은 data를 JSON 문자열 형태로 바꾼다.
            	// let workDateJson = JSON.stringify(httpRequest.responseText);
            	// 이거 하니까 [ 따로 { 따로 문자로 인식해버린다.
            	
            	// 바꾼 문자열을 json 객체로 변환한다.
            	let workDataObj = JSON.parse(httpRequest.responseText);
            	console.log(workDataObj);
            	console.log(workDataObj[0]);

            	// 현재는 data 개수와 list의 개수를 일부러 동일하게 맞췄다.
            	for (var i = 0; i < workDataObj.length; i++) {
            		itemList[i].innerText = workDataObj[i].COMPANY_NAME;
				}
            }
        }
    }
	
	
// ========================================================================================
	// Calendar script
    var Calendar = FullCalendar.Calendar;
    var Draggable = FullCalendar.Draggable;

    // drop item box
    var containerEl = document.getElementById('external-events');

    // calendar
    var calendarEl = document.getElementById('calendar');

    // drop item 삭제 여부
    var checkbox = document.getElementById('drop-remove');

    // initialize the external events
    // -----------------------------------------------------------------
    new Draggable(containerEl, {
        itemSelector: '.fc-event',
        eventData: function (eventEl) {
            return {
                title: eventEl.innerText
            };
        }
    });

    // initialize the calendar
    // -----------------------------------------------------------------
    var calendar = new Calendar(calendarEl, {
        headerToolbar: {
            left: 'prev next today',
            center: 'title',
            right: 'dayGridMonth,timeGridWeek,timeGridDay'
        },
        editable: true,
        droppable: true, // this allows things to be dropped onto the calendar
        drop: function (info) {
            // is the "remove after drop" checkbox checked?
            if (checkbox.checked) {
                // if so, remove the element from the "Draggable Events" list
                info.draggedEl.parentNode.removeChild(info.draggedEl);
            }
        }
    });

    calendar.render();
}