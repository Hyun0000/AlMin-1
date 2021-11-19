/**
 * 
 */
window.onload = function() {
// ========================================= 후기 조회(select) ===============================================
	sendRequest("GET", "reviews", null, selectAllComments);
	
	// callback function
	function selectAllComments() {
		if (httpRequest.readyState === 4) {
			if (httpRequest.status === 200) {
				console.log("모듈을 이용한 js-ajax 성공");
				console.log(httpRequest.responseText);
				
				let commentsObj = JSON.parse(httpRequest.responseText);
				
				// 주석 있던 자리
				
				// 후기 작성자의 정보를 담는 객체 배열
				let comments = commentsObj.commentsVO;
				
				// 바깥쪽 <li>를 구분하기 위한 변수
				let num = 0;
				
				// ul
				let ulEle = document.getElementById('comments_box');
				
				comments.forEach(function (e) {
					console.log(e.ccWriter);
// ===================================================================================================
			        // 바깥쪽 <li>
			        let liEle = document.createElement('li');
			        liEle.setAttribute('class', 'comments_list');
			        liEle.setAttribute('id', 'comments_list_id_' + num);
			        ulEle.appendChild(liEle);

			        // ===================== 상단 ==========================
			        // top 전체 <div> 만들기
			        let topDivEle = document.createElement('div');
			        topDivEle.setAttribute('class', 'comments_top_bar');
			        liEle.appendChild(topDivEle);

			        // top 좌측 <div> 만들기
			        let topLeftDivEle = document.createElement('div');
			        topLeftDivEle.setAttribute('class', 'comments_top_bar_left');
			        topDivEle.appendChild(topLeftDivEle);

			        // top 좌측 <div>에 속하는 <h2> --> 작성자 아이디   commentsObj[e.ccWriter]?????
			        let topHtwo = document.createElement('h2');
			        topHtwo.innerText = e.ccWriter;
			        topLeftDivEle.appendChild(topHtwo);

			        // top 좌측 <div>에 속하는 <h3> --> 작성일
			        let topHthree = document.createElement('h3');
			        topHthree.innerText = e.ccDate;
			        topLeftDivEle.appendChild(topHthree);

			        // top 우측 <div> 만들기
			        let topRightDivEle = document.createElement('div');
			        topRightDivEle.setAttribute('class', 'comments_top_bar_right');
			        topDivEle.appendChild(topRightDivEle);

			        // 수정 버튼 만들기
			        let updateBtn = document.createElement('button');
			        updateBtn.innerText = "수정";
			        updateBtn.setAttribute('class', 'updateBtn');
			        topRightDivEle.appendChild(updateBtn);

			        // 삭제 버튼 만들기
			        let deleteBtn = document.createElement('button');
			        deleteBtn.innerText = "삭제";
			        deleteBtn.setAttribute('class', 'deleteBtn');
			        deleteBtn.setAttribute('id', 'deleteBtn_id_' + num);
			        deleteBtn.setAttribute('onClick', 'apple(event);');
			        topRightDivEle.appendChild(deleteBtn);
			        num++;
			        // ===================== 한줄 후기 ==========================
			        // 한줄 후기를 담는 <div> 만들기
			        let midDivEle = document.createElement('div');
			        midDivEle.setAttribute('class', 'comments_mid_bar_review');
			        liEle.appendChild(midDivEle);
			        
			        // 한줄 후기를 담는 <div>에 속하는 <h4>
			        let reviewHfour = document.createElement('h4');
			        reviewHfour.innerText = e.ccContent;
			        midDivEle.appendChild(reviewHfour);    

			        // ===================== 하단 ==========================
			        // bottom 전체 <div> 만들기
			        let btmDivEle = document.createElement('div');
			        btmDivEle.setAttribute('class', 'comments_btm_bar');
			        liEle.appendChild(btmDivEle);

			        let keyword = ["장점", "단점", "근무 조건", "분위기", "급여"];
			        
			        // bottom 좌측 <div> 만들기
			        let btmLeftDivEle = document.createElement('div');
			        btmLeftDivEle.setAttribute('class', 'left_comments_box');
			        btmDivEle.appendChild(btmLeftDivEle);
			        
			        // bottom 우측 <div> 만들기
			        let btmRightDivEle = document.createElement('div');
			        btmRightDivEle.setAttribute('class', 'right_comments_box');
			        btmDivEle.appendChild(btmRightDivEle);
			        
			        for (var i = 0; i < keyword.length; i++) {

			        // bottom 좌측 <div>에 속하는 <div>
		        	let btmLeftUlEle = document.createElement('div');
			        btmLeftUlEle.setAttribute('class', 'left_comments_box_div');
			        btmLeftUlEle.innerText = keyword[i];
			        btmLeftDivEle.appendChild(btmLeftUlEle);
			        
		        	// bottom 우측 <div>에 속하는 <ul>
		        	let btmUl = document.createElement('ul');
		        	btmUl.setAttribute('class', 'right_comments_box_ul');
		        	btmRightDivEle.appendChild(btmUl);
			        	
			        	for (var j = 0; j < commentsObj[e.ccWriter][i].length; j++) {
			        		// bottom 우측 <ul>에 속하는 <li>  -->  각 후기별 키워드 넣기
			        		let btmLiEle = document.createElement('li');
			        		btmLiEle.innerText = commentsObj[e.ccWriter][i][j];
			        		btmUl.appendChild(btmLiEle);
						}
					}

				}) // comments.forEach(function (e) 종료
			} // if (httpRequest.status === 200) 종료
			console.log("%%%%%%%%%%%%%%%%%%%%%%%%%%%%");
			let test = document.getElementsByClassName('deleteBtn');
			console.log(test.length);
			console.log(document.getElementById('comments_box'));
			console.log(document.getElementsByClassName('deleteBtn'));
			console.log(document.getElementById('comments_box').hasChildNodes());
			
//			console.log(test.length);
//			console.log(document.getElementById('comments_box'));
//			console.log(document.getElementById('comments_box').hasChildNodes());
//			console.log(document.getElementsByClassName('deleteBtn'));
		} // if (httpRequest.readyState === 4) 종료
//		console.log("############################"); 왜 3번?
//		let test1 = document.getElementsByClassName('deleteBtn');
//		console.log(test1.length);
//		console.log(document.getElementById('comments_box'));
//		console.log(document.getElementsByClassName('deleteBtn'));
//		console.log(document.getElementById('comments_box').hasChildNodes());
	} // selectAllComments callback function 종료
//	console.log("@@@@@@@@@@@@@@@@@@@@@@@@@");
//	let test1 = document.getElementsByClassName('deleteBtn');
//	console.log(test1.length);
//	console.log(document.getElementById('comments_box'));
//	console.log(document.getElementsByClassName('deleteBtn'));
//	console.log(document.getElementById('comments_box').hasChildNodes());
// }
// window.onload 끝
// ========================================= 모달창 띄우기 ===============================================
		// 모달창 배경 변수 지정
		let modalBack = document.getElementById('comments_insert_modal_back');
		
	    document.getElementById('insert_modal_showBtn').onclick = function () {
	    	modalBack.style.display = "block";
	    }
// ========================================= 모달창 닫기 ===============================================
	    window.onclick = function() {
	        if (event.target == modalBack) {
	            modalBack.style.display = "none";
	        }
	    }
// ========================================= 후기 insert 시작 ===============================================
		// let allConditionObj = new Array();
		let allConditionObj = {};
		// 후기 제출
		document.getElementById('submitBtn').onclick = function () {
// ============================ 한줄 후기  & 근로계약서 ========================================
            // 한줄 후기 유효성 검사
			let commentsLineEle =  document.getElementById('commentsLine').value;
            console.log(commentsLineEle);
            if (commentsLineEle.length > 100) {
                alert("한줄 후기는 100자 이내로 작성해주세요");
                return false;
            } else if(commentsLineEle.length < 1) {
                alert("한줄 후기는 최소 1자 이상 작성해주세요");
                return false;
            }

            // 근로 계약서 작성 여부 radio value를 담을 변수
            let contractRadio = null;

            // 근로 계약서 작성(O) element
            let contractRadio_Y = document.getElementById('contract_y');
            console.log(contractRadio_Y.value);

            // 근로 계약서 작성(X) element
            let contractRadio_N = document.getElementById('contract_n');
            console.log(contractRadio_N.value);

            // 선택된 radio 버튼에 따라 contractRadio에 value 담기
            if (contractRadio_Y.checked) {
                contractRadio = contractRadio_Y.value;
            } else if (contractRadio_N.checked) {
                contractRadio = contractRadio_N.value;
            } 

            // 근로 계약서 작성 여부 유효성 검사
            if (contractRadio === null) {
                alert("근로계약서 작성 여부를 체크해주세요");
                return false;
            } 
// ============================ 후기 키워드 ========================================
			for (var i = 0; i < dropzoneEle.length; i++) {
				// 각 dropzone에 있는 아이템의 개수
				let dropzoneInnerItem_i = dropzoneEle[i].childElementCount;
				console.log("dropzoneInnerItem_" + i +  " : " + dropzoneInnerItem_i);
				
				// 각 dropzone안에 있는 각 아이템이 적혀있는 <span>
				let spanIndropzone_i = document.querySelectorAll("#dropzone_" + (i + 1) + " .keyword");
				
				// dropzone안에 있는 각 아이템의 키워드를 저장하는 배열 선언
				let keywordArr_i = new Array();
				
	            // 키워드 저장하는 배열에 키워드 넣기
	            for (let j = 0; j < spanIndropzone_i.length; j++) {
	            	keywordArr_i[j] = spanIndropzone_i[j].innerText;
	            }
	            
	            allConditionObj['keyword_' + i] = keywordArr_i;
	            
	            for (let k = 0; k < keywordArr_i.length; k++) {
	                console.log(keywordArr_i[k]);
	            }
			}
			console.log("=================================================");
			console.log(allConditionObj);
			console.log(JSON.stringify(allConditionObj));
			console.log("=================================================");
			
			// comments 전체를 담는 <ul>
			let commentsBoxEle = document.getElementById('comments_box');
			
			// 작성자, 한 줄 후기, 근로계약서 작성 여부 등의 data를 담는 js object
			let restData = {
					ccRecruitNo : '1',
					ccWriter : 'user01',
					ccContent : commentsLineEle,
					ccContract : contractRadio
				}
			
			// 각 후기별 키워드를 담은 js object에 restData 추가
			allConditionObj.restData = restData;
			
	 			$.ajax({
					type : "POST",
					url : "/almin/recruits/reviews",
					/*url : "reviews",*/
					dataType : "json",
					contentType : "application/json; charset=utf-8",
					data : JSON.stringify(allConditionObj),
					success : function (data) {
						console.log("success 시작");
						if (data.result == "ok") {
							// 모달창 닫기
							modalBack.style.display = "none";

							// 기존 후기 모두 삭제(let commentsBoxEle의 모든 자식 노드 삭제)
							while (commentsBoxEle.hasChildNodes()) {
								commentsBoxEle.removeChild(commentsBoxEle.firstChild);
							}
							
							alert("후기 등록 ok");
							// 후기 새로 가져오기
							sendRequest("GET", "reviews", null, selectAllComments);
							
						} else {
							alert("후기 등록 실패");
						}
					},
					error : function(request,status,error) {
			        	console.log("false")
			            alert('후기가 없습니다.');
			            console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			        }
				})
			}
//========================================= 후기 insert 끝 ===============================================
//========================================= drag&drop evnet ===============================================
	// dropzone --> dragzone
	for (let i = 0; i < xEle.length; i++) {
	    xEle[i].onclick = function () {
	        var movedItem = document.getElementById(event.target.parentNode.id);
	        console.log("event.target.parentNode.id : " + event.target.parentNode.id);
	        console.log(movedItem);
	        // xEle[i].style.display = "none";
	        this.style.display = "none";
	        
	        for (var i = 0; i < dropzoneEle.length; i++) {
		        if (dropzoneEle[i] == this.parentNode.parentNode) {
		        	dragzoneEle[i].appendChild(movedItem);
		        }
	        }
	    }
	}
//========================================== 후기 delete ==============================================
//	document.getElementById('comments_list_id_0').onclick = function() {
//		alert(123);
//	}
}// =========여기에 중괄호 다시 넣을수도(window.onload)
//========================================== window.onload 끝 ==============================================
//====================================================================================================
// drag한 itme의 id 정보 저장 (in dragzone)
function drag(event) {
    event.dataTransfer.setData("text", event.target.id);
}
//====================================================================================================
function allowDrop(event) {
    event.preventDefault();
}
//====================================================================================================
// drag한 itme을 dropzone에 놓았을 '때'
function drop(event) {
    event.preventDefault();

 	// drop 이벤트가 발생한 지역이 <div id="dropzone"> 이여야만 drop이 가능하게 설정
 	for (var i = 0; i < dropzoneEle.length; i++) {
 		let data = event.dataTransfer.getData("text");
 		let dataInject = document.getElementById(data)
	    if (dropzoneEle[i] == event.target && dropzoneEle[i] == dataInject.parentNode.previousElementSibling) {
	        event.target.appendChild(dataInject);
	    }
	}

    // dropzone에 놓았을 때 x 마크 보이기
    for (var i = 0; i < dropzoneEle.length; i++) {
	    for (let j = 0; j < dragItemEle.length; j++) {
	        if (dragItemEle[j].parentNode == dropzoneEle[i]) {
	        	console.log(dragItemEle[j].lastChild);
	            dragItemEle[j].lastChild.style.display = "inline-block";
	        }
	    }
    }
}
//========================================= drag&drop evnet ===============================================
function apple(event) {
	alert(123);
	console.log(event.target);
	console.log(event.target.parentNode);
	console.log(event.target.parentNode.previousSibling);
	console.log(event.target.parentNode.previousSibling.firstChild);
	console.log(event.target.parentNode.previousSibling.firstChild.innerText);
	console.log(event);
	console.log(this);
}




