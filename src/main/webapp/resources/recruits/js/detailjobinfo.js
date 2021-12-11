let modalBack = document.getElementById('comments_insert_modal_back');
// let param = "recruitNo=" + recruitNo;
// let recruitParam = "recruitNo=" + recruitNo;
let recruitCommentParam = "reviews?recruitNo=" + recruitNo + "&id=" + userId;
let recruitCommentPageParam = "reviews?recruitNo=" + recruitNo + "&id=" + userId + "&page=" + 1;
console.log("recruitCommentPageParam : " + recruitCommentPageParam);

// 후기 입력 모달창 초기화를 위한 변수
let firstInsert = "";

// 후기 전체를 담는 <ul>
let ulEle = document.getElementById('comments_box');

// 페이지 링크 전체를 담는 <div>
let pageLinkDivEle = document.getElementById('comments_box_pageLink');

// 유저가 현재 선택한 페이지
let userSelectPage = 0;

window.onload = function() {
// 1.
// ========================================= page load 후 전체 후기 조회(select) ===============================================
	// 페이지 테스트
	sendRequest("GET", recruitCommentPageParam, null, selectAllComments);
	
	// sendRequest("GET", recruitCommentParam, null, selectAllComments);
// ========================================= 후기 insert ===============================================	
// 2. 후기 insert
	// 모달창 띄우기
    document.getElementById('insert_modal_showBtn').onclick = function () {
    	modalBack.style.display = "block";
    	
    	// ====================== 모달창 초기화 ======================
    	// 한 줄 후기 입력창 초기화
    	document.getElementById('commentsLine').value = "";
    	
    	// 근로계약서 radio 초기화
    	document.getElementById('contract_n').checked = false;
		document.getElementById('contract_y').checked = false;
		
		// 키워드 입력창 초기화
		for(let i = 1; i <= 5 ; i++){
			while (document.getElementById('dropzone_' + i).hasChildNodes()) {
				let tempData = document.getElementById('dropzone_' + i).firstChild;
				// X mark 지우기
				if(firstInsert === 'yes') {tempData.lastChild.style.display = "none";}

				// dropzone --> dragzone으로 키워드 옮기기
				document.getElementById('dropzone_' + i).removeChild(tempData);
				document.getElementById('dragzone_' + i).appendChild(tempData);
			}
		};
		// ====================== 모달창 초기화 ======================
    }
    
	// 모달창 닫기
    window.onclick = function() {
        if (event.target == modalBack) {modalBack.style.display = "none";}
    }
// 2-2. insert 시작
	// 후기 제출
	document.getElementById('submitBtn').onclick = function() {
		postingComment('insert');
	}
//========================================= 후기 insert 끝 ===============================================
}// ========= (window.onload 끝)
//========================================== window.onload 끝 ==============================================
// 후기 입력 function
function postingComment(insertOrUpdate) {
// 2-1. modal box
	
	// 모달창 배경 변수 지정
//	let modalBack = document.getElementById('comments_insert_modal_back');

	let allConditionObj = {};
	
	// 2-2-1. 한줄 후기  & 근로계약서 
	    // 한줄 후기 유효성 검사
		let commentsLineEle =  document.getElementById('commentsLine').value; console.log(commentsLineEle);
	    
	    if (commentsLineEle.length > 100) {alert("한줄 후기는 100자 이내로 작성해주세요"); return false;}
	    else if(commentsLineEle.length < 1) {alert("한줄 후기는 최소 1자 이상 작성해주세요"); return false;}

	    // 근로 계약서 작성 여부 radio value를 담을 변수
	    let contractRadio = null;

	    // 근로 계약서 작성(O) element
	    let contractRadio_Y = document.getElementById('contract_y'); console.log(contractRadio_Y.value);

	    // 근로 계약서 작성(X) element
	    let contractRadio_N = document.getElementById('contract_n'); console.log(contractRadio_N.value);

	    // 선택된 radio 버튼에 따라 contractRadio에 value 담기
	    if (contractRadio_Y.checked) {contractRadio = contractRadio_Y.value;}
	    else if (contractRadio_N.checked) {contractRadio = contractRadio_N.value;} 

	    // 근로 계약서 작성 여부 유효성 검사
	    if (contractRadio === null) {alert("근로계약서 작성 여부를 체크해주세요");return false;}
	// 2-2-2. 후기 키워드 넣기
		for (var i = 0; i < dropzoneEle.length; i++) {
			// 각 dropzone에 있는 아이템의 개수
			let dropzoneInnerItem_i = dropzoneEle[i].childElementCount;
			console.log("dropzoneInnerItem_" + i +  " : " + dropzoneInnerItem_i);
			
			if (dropzoneInnerItem_i == 0) {
				alert("각 후기별 키워드는 최소 1개 이상 등록해주세요"); return false;
			}
			
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
		// let commentsBoxEle = document.getElementById('comments_box');
		
		// 작성자, 한 줄 후기, 근로계약서 작성 여부 등의 data를 담는 js object
		let restData = {
				ccRecruitNo : recruitNo,
				ccWriter : userId,
				ccContent : commentsLineEle,
				ccContract : contractRadio,
				insertOrUpdate : insertOrUpdate
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
					if (data.result == "insertOk" || data.result == "updateOk") {
						console.log("=========================");
						console.log(data.result);
						
						// 모달창 닫기
						modalBack.style.display = "none";

						// 기존 후기 모두 삭제(let commentsBoxEle의 모든 자식 노드 삭제)
						initCommentsBox();
						
						if (data.result == "insertOk") {
							firstInsert = "yes";
							alert("후기 등록 ok");
						} else if (data.result == "updateOk") {
							alert("후기 수정 ok");
						}
						
						// 후기 새로 가져오기
						// sendRequest("GET", recruitCommentParam, null, selectAllComments);
						sendRequest("GET", recruitCommentPageParam, null, selectAllComments);
						
					} else {
						alert("후기 등록 or 수정 실패");
					}
				},
				error : function(request,status,error) {
		        	console.log("false")
		            alert('후기가 없습니다.');
		            console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		        }
			})
		}
// ======================================= 후기 키워드 X mark 클릭시 삭제 =======================================
function deleteX() {
	let xEle = document.getElementsByClassName('xMark');
	console.log("=================== please ===================");
	console.log(xEle.length);
	console.log(this);
	console.log(event.target);
	for (let i = 0; i < xEle.length; i++) {
		// xEle[i].onclick = function () {
	        var movedItem = document.getElementById(event.target.parentNode.id);
	        // console.log("event.target.parentNode.id : " + event.target.parentNode.id);
	        // console.log(movedItem);
	        // console.log(123);
	        // xEle[i].style.display = "none";
	        event.target.style.display = "none";
	        
	        for (var j = 0; j < dropzoneEle.length; j++) {
		        if (dropzoneEle[j] == event.target.parentNode.parentNode) {
		        	dragzoneEle[j].appendChild(movedItem);
		        }
	        }
	    // }
	}
}
//========================================= drag&drop evnet ===============================================
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
//========================================= 후기 입력, 삭제, 수정 후 초기화 ===============================================
function initCommentsBox() {
	while (commentsBoxEle.hasChildNodes()) {
		commentsBoxEle.removeChild(commentsBoxEle.firstChild);
	}
}
//========================================= 후기 입력, 삭제, 수정 후 callback function ====================================
function selectAllComments() {
	if (httpRequest.readyState === 4) {
		if (httpRequest.status === 200) {
			console.log("모듈을 이용한 js-ajax 성공");
			console.log(httpRequest.responseText);
			
			// ================== 초기화 ==================
			while (pageLinkDivEle.hasChildNodes()) {pageLinkDivEle.removeChild(pageLinkDivEle.firstChild);}
			
			while (ulEle.hasChildNodes()) {ulEle.removeChild(ulEle.firstChild);}
			// ================== 초기화 ==================
			
			let commentsObj = JSON.parse(httpRequest.responseText);
			
			// ====================== 페이지 링크 출력 ======================
			// 페이지 링크 전체를 담는 <div>
			// let pageLinkDivEle = document.getElementById('comments_box_pageLink');
			
			// 페이지 링크
			let allPageLink = commentsObj.pageLink;
			
			for (var i = 1; i <= allPageLink; i++) {
				let pageSpanEle = document.createElement('span');
				pageSpanEle.setAttribute('class', 'pageLink');
				pageSpanEle.setAttribute('id', 'pageLink_' + i);
				pageSpanEle.setAttribute('onclick', 'pageLickClick();');
				pageSpanEle.innerText = i;
				pageLinkDivEle.appendChild(pageSpanEle);
			}
			// ====================== 페이지 링크 출력 ======================
			
			// ====================== 현재 선택한 페이지 표시 ======================
			let pageLinkClassEles = document.getElementsByClassName('pageLink');
			for (var i = 0; i < pageLinkClassEles.length; i++) {
				console.log(pageLinkClassEles[i]);
				console.log(pageLinkClassEles[i].innerText);
				
				if(pageLinkClassEles[i].innerText === userSelectPage) {
					pageLinkClassEles[i].style.borderBottom = "thick solid royalblue";
					console.log("true");
				} else {
					pageLinkClassEles[i].style.borderBottom = "thick solid white";
					console.log("false");
				}
			}
			// ====================== 현재 선택한 페이지 표시 ======================
			
			// 후기 작성자의 정보를 담는 객체 배열
			let comments = commentsObj.commentsVO;
			
			// 후기 작성자 전체를 담을 변수
			// let commentsWriterArr = [];
			
			// 바깥쪽 <li>를 구분하기 위한 변수
			let num = 0;
			
			// ul
			// let ulEle = document.getElementById('comments_box');
			
			comments.forEach(function (e) {
				console.log(e.ccWriter);
//===================================================================================================
		        // 바깥쪽 <li>
		        let liEle = document.createElement('li'); liEle.setAttribute('class', 'comments_list');
		        liEle.setAttribute('id', 'comments_list_id_' + num); ulEle.appendChild(liEle);
		        // ===================== 상단 ==========================
		        // top 전체 <div> 만들기
		        let topDivEle = document.createElement('div'); topDivEle.setAttribute('class', 'comments_top_bar');
		        liEle.appendChild(topDivEle);

		        // top 좌측 <div> 만들기
		        let topLeftDivEle = document.createElement('div'); topLeftDivEle.setAttribute('class', 'comments_top_bar_left');
		        topDivEle.appendChild(topLeftDivEle);

		        // top 좌측 <div>에 속하는 <h2> --> 작성자 아이디   commentsObj[e.ccWriter]?????
		        let topHtwo = document.createElement('h2'); topHtwo.innerText = e.ccWriter;
		        topLeftDivEle.appendChild(topHtwo);
		        
		        // 작성자 담기
		        // commentsWriterArr[num] = e.ccWriter;

		        // top 좌측 <div>에 속하는 <h3> --> 작성일
		        let topHthree = document.createElement('h4'); topHthree.innerText = e.ccDate;
		        topHthree.setAttribute('style', 'margin : 0;');
		        topLeftDivEle.appendChild(topHthree);

		        // top 우측 <div> 만들기
		        let topRightDivEle = document.createElement('div'); topRightDivEle.setAttribute('class', 'comments_top_bar_right');
		        topDivEle.appendChild(topRightDivEle);

		        // 해당 후기 작성자(현재 접속한 회원)에게만 후기 수정 & 삭제 버튼이 보이게 하는 기능 구현
		        console.log("작성자 : " + e.ccWriter);
		        if(userId === e.ccWriter) {
			        // 수정 버튼 만들기
			        let updateBtn = document.createElement('button'); updateBtn.innerText = "수정";
			        updateBtn.setAttribute('class', 'updateBtn'); updateBtn.setAttribute('id', 'updateBtn_id_' + num);
			        updateBtn.setAttribute('onClick', 'updateComment(event);');  topRightDivEle.appendChild(updateBtn);
	
			        // 삭제 버튼 만들기
			        let deleteBtn = document.createElement('button'); deleteBtn.innerText = "삭제";
			        deleteBtn.setAttribute('class', 'deleteBtn');  deleteBtn.setAttribute('id', 'deleteBtn_id_' + num);
			        deleteBtn.setAttribute('onClick', 'deleteComment(event);'); topRightDivEle.appendChild(deleteBtn);
		        }
		        
//		        if(userId === e.ccWriter) {
//		        	// 특정 공고에 후기 입력을 이미 했으면 추가로 후기 입력을 불가능하게 하는 기능 구현 (없으면 후기 작성 가능)
//		        	document.getElementById('insert_modal_showBtn').style.display = "none";
//		        } else {
//		        	// 특정 공고에 후기 입력을 이미 했으면 추가로 후기 입력을 불가능하게 하는 기능 구현 (없으면 후기 작성 가능)
//		        	document.getElementById('insert_modal_showBtn').style.display = "block";
//		        }
		        
		        // id & class에 붙이는 숫자 변수 (+)
		        num++;
		        // ===================== 한줄 후기 ==========================
		        // 한줄 후기를 담는 <div> 만들기
		        let midDivEle = document.createElement('div'); midDivEle.setAttribute('class', 'comments_mid_bar_review');
		        liEle.appendChild(midDivEle);
		        
		        // 한줄 후기를 담는 <div>에 속하는 <h4>
		        let reviewHfour = document.createElement('h3'); reviewHfour.innerText = e.ccContent;
		        reviewHfour.setAttribute('style', 'margin : 0;');
		        midDivEle.appendChild(reviewHfour);    

		        // ===================== 하단 ==========================
		        // bottom 전체 <div> 만들기
		        let btmDivEle = document.createElement('div'); btmDivEle.setAttribute('class', 'comments_btm_bar');
		        liEle.appendChild(btmDivEle);

		        let keyword = ["장점", "단점", "근무 조건", "분위기", "급여"];
		        
		        // bottom 좌측 <div> 만들기
		        let btmLeftDivEle = document.createElement('div'); btmLeftDivEle.setAttribute('class', 'left_comments_box');
		        btmDivEle.appendChild(btmLeftDivEle);
		        
		        // bottom 우측 <div> 만들기
		        let btmRightDivEle = document.createElement('div'); btmRightDivEle.setAttribute('class', 'right_comments_box');
		        btmDivEle.appendChild(btmRightDivEle);
		        
		        for (var i = 0; i < keyword.length; i++) {

		        // bottom 좌측 <div>에 속하는 <div>
	        	let btmLeftUlEle = document.createElement('div'); btmLeftUlEle.setAttribute('class', 'left_comments_box_div');
		        btmLeftUlEle.innerText = keyword[i]; btmLeftDivEle.appendChild(btmLeftUlEle);
		        
	        	// bottom 우측 <div>에 속하는 <ul>
	        	let btmUl = document.createElement('ul'); btmUl.setAttribute('class', 'right_comments_box_ul');
	        	btmRightDivEle.appendChild(btmUl);
		        	
		        	for (var j = 0; j < commentsObj[e.ccWriter][i].length; j++) {
		        		console.log("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		        		console.log(commentsObj[e.ccWriter][i]);
		        		console.log("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		        		// bottom 우측 <ul>에 속하는 <li>  -->  각 후기별 키워드 넣기
		        		let btmLiEle = document.createElement('li'); btmLiEle.innerText = commentsObj[e.ccWriter][i][j];
		        		btmUl.appendChild(btmLiEle);
					}
				}
			}) // comments.forEach(function (e) 종료
			
//			console.log("작성자 배열 : " + commentsWriterArr);
//			for (var i = 0; i < commentsWriterArr.length; i++) {
//				if(commentsWriterArr[i] === userId) {
//					// 특정 공고에 후기 입력을 이미 했으면 추가로 후기 입력을 불가능하게 하는 기능 구현 (없으면 후기 작성 가능)
//		        	document.getElementById('insert_modal_showBtn').style.display = "none";
//				} else {
//					// 특정 공고에 후기 입력을 이미 했으면 추가로 후기 입력을 불가능하게 하는 기능 구현 (없으면 후기 작성 가능)
//		        	document.getElementById('insert_modal_showBtn').style.display = "block";					
//				}
//			}
		} // if (httpRequest.status === 200) 종료
		console.log("삭제 버튼 유무");
		let findCommentsPath = "findComments?recruitNo=" + recruitNo + "&id=" + userId;
		sendRequest("GET", findCommentsPath, null, findComments);
		
		let test = document.getElementsByClassName('deleteBtn');
	}
} // selectAllComments callback function 종료
//========================================= 각 페이지링크 클릭 ====================================
function pageLickClick() {
	console.log(this);
	console.log(event);
	console.log(event.target);
	console.log(event.target.innerText);
	
	userSelectPage = event.target.innerText;

	// ================== 초기화 ==================
//	while (pageLinkDivEle.hasChildNodes()) {pageLinkDivEle.removeChild(pageLinkDivEle.firstChild);}
//	
//	while (ulEle.hasChildNodes()) {ulEle.removeChild(ulEle.firstChild);}
	// ================== 초기화 ==================
	
	let selectPageParam = "reviews?recruitNo=" + recruitNo + "&id=" + userId + "&page=" + userSelectPage;
	sendRequest("GET", selectPageParam, null, selectAllComments);
}

//========================================= 후기 삭제 버튼(delete) inline function ====================================
function deleteComment(event) {
	let deleteBool = confirm("삭제 하시겠습니까?");
	console.log("====================== 1 ======================");
	console.log(event.target);
	console.log("====================== 2 ======================");
	console.log(event.target.parentNode);
	console.log("====================== 3 ======================");
	console.log(event.target.parentNode.previousSibling);
	console.log("====================== 4 ======================");
	console.log(event.target.parentNode.previousSibling.firstChild);
	console.log("====================== 5 ======================");
	console.log(event.target.parentNode.previousSibling.firstChild.innerText);
	// console.log(event); console.log(this); --> 이상
	
	// userID를 담을 변수
	let userId = event.target.parentNode.previousSibling.firstChild.innerText
	
	let deleteData = {
			recruitNo : recruitNo,
			id : event.target.parentNode.previousSibling.firstChild.innerText
	}
	
	if (deleteBool == true) {
		sendRequest("DELETE", "reviews", JSON.stringify(deleteData), afterDelete);
	}
	
	function afterDelete() {
		if (httpRequest.readyState === 4) {
			if (httpRequest.status === 200) {
				console.log(httpRequest.responseText);
				if (httpRequest.responseText == 'ok') {
					alert("삭제 성공");
					
					// 후기 구역 초기화
					initCommentsBox();
					
					// 후기 전체 다시 select
					// sendRequest("GET", recruitCommentParam, null, selectAllComments);
					sendRequest("GET", recruitCommentPageParam, null, selectAllComments);
				}
			}
		}
	}
}
//========================================= 후기 수정 버튼(update) inline function ====================================
function updateComment(event) {
	let updateBool = confirm("수정 하시겠습니까?");
	let updateUserId = event.target.parentNode.previousSibling.firstChild.innerText;
	
	console.log("====================== update ======================");
	console.log(event.target.parentNode.previousSibling.firstChild.innerText);
	console.log(updateUserId);
	
	
	// url로 보낼 data
	// 	let param = recruitParam + "&id=" + updateUserId;
	// let param = "recruitNo=1&id=" + updateUserId;
	
	if (updateBool == true) {
		// sendRequest("GET", recruitCommentParam, null, popUpModal);
		sendRequest("GET", recruitCommentPageParam, null, popUpModal);
	}
}

// 기존에 작성한 후기 data를 가져온 후 실행할 callback function
function popUpModal() {
	if (httpRequest.readyState === 4) {
		if (httpRequest.status === 200) {
			if (httpRequest.responseText != null) {
				console.log("=================== 후기 수정은 이곳에서 ===================");
				console.log(httpRequest.responseText);
				
				// 수정 모달창을 띄웠을때 처음 후기를 작성한 후 남아있는 내용(키워드들)을 지우는 반복문
				let originDropZone = document.getElementsByClassName('dropzoneClass');
				for (var i = 0; i < originDropZone.length; i++) {
					while (originDropZone[i].hasChildNodes()) {
						originDropZone[i].removeChild(originDropZone[i].firstChild);
					}
				}
				
				// data 다 가져온후 modal창 띄우기
				// let modalBack = document.getElementById('comments_insert_modal_back');
				modalBack.style.display = "block";
				
				console.log("=================== updata :  ===================");
				let updateObj = JSON.parse(httpRequest.responseText);
				
//				console.log("=================== httpRequest.responseText.commentsVO :  ===================");
//				console.log(httpRequest.responseText.commentsVO);
//				console.log("=================== updateObj.commentsVO :  ===================");
//				console.log(updateObj.commentsVO);
//				console.log("=================== updateObj.commentsVO.ccContent :  ===================");
//				console.log(updateObj.commentsVO.ccContent);
//				console.log("=================== updateObj.commentsVO[0] :  ===================");
//				console.log(updateObj.commentsVO[0]);
//				console.log("=================== updateObj.commentsVO[0].ccContent :  ===================");
//				console.log(updateObj.commentsVO[0].ccContent);
//				console.log("=================== updateObj.commentsVO[0].ccContract :  ===================");
//				console.log(updateObj.commentsVO[0].ccContract);
//				console.log("=================== userId :  ===================");
//				console.log(userId);
//				console.log("=================== updateObj[userId] :  ===================");
//				console.log(updateObj[userId]);
//				console.log("=================== updateObj[userId].length :  ===================");
//				console.log(updateObj[userId].length);
//				console.log("=================== updateObj.user01[0] :  ===================");
//				console.log(updateObj[userId][0]);
//				console.log("=================== updateObj.user01[0][0] :  ===================");
//				console.log(updateObj[userId][0][0]);
				
				// 한줄 후기 입력창에 기존 내용 입력
				let updateoneLine = document.getElementById('commentsLine');
				updateoneLine.value = updateObj.commentsVO[0].ccContent;
				
				console.log(document.getElementById('contract_y'));
				console.log(document.getElementById('contract_n'));
				
				let test = updateObj.commentsVO[0].ccContract;
				console.log("test : " + test);
				let contractRadio_Y = document.getElementById('contract_y');
				let contractRadio_N = document.getElementById('contract_n');
				
				// 근로 계약서 작성 radio 버튼
				if (test === 'Y') {
					contractRadio_Y.checked = "checked";
				} else {
					contractRadio_N.checked = "checked";
				}
				
				// 작성한 키워드와 그렇지 않은 키워드를 구별
				let updateDragZone = document.getElementsByClassName('dragzoneClass');
				let updateDropZone = document.getElementsByClassName('dropzoneClass');
				
				for (var i = 0; i < updateObj[userId].length; i++) {
					console.log("진입1");
					let keywordSort = document.querySelectorAll("#dragzone_" + (i + 1) + " .keyword");
					
					for (var j = 0; j < updateObj[userId][i].length; j++) {
						console.log("진입2");
						
						for (var k = 0; k < keywordSort.length; k++) {
							console.log("진입3");
							if (keywordSort[k].innerText == updateObj[userId][i][j]) {
								console.log("이렇게 하긴 싫다.");
								keywordSort[k].parentNode.style.display = "none";
							}
						}
					}
				}

				// 작성한 키워드를 dropZone에 넣기
				let num = 1;
				for (var i = 0; i < updateObj[userId].length; i++) {
					for (var j = 0; j < updateObj[userId][i].length; j++) {
						let keywordUpDropZone = document.getElementById('dropzone_' + (i + 1));
						
						let upkeywordDiv = document.createElement('div');
						upkeywordDiv.setAttribute("class", "dragEle");
						upkeywordDiv.setAttribute("id", "updateDrag_" + num);
						upkeywordDiv.setAttribute("draggable", "true");
						upkeywordDiv.setAttribute("ondragstart", "drag(event);");
						
						let upkeywordSpan = document.createElement('span');
						upkeywordSpan.setAttribute("class", "keyword");
						upkeywordSpan.innerText = updateObj[userId][i][j];
						upkeywordDiv.appendChild(upkeywordSpan);
						
						let upkeywordX = document.createElement('span');
						upkeywordX.setAttribute("class", "xMark");
						upkeywordX.setAttribute("style", "display: inline-block;");
						upkeywordX.setAttribute('onClick', 'deleteX();');
						upkeywordX.innerHTML = '&times';
						upkeywordDiv.appendChild(upkeywordX);
						
						keywordUpDropZone.appendChild(upkeywordDiv);
						
						num++;
					}
				}
				
				// 수정 작업을 모두 완료한 후 등록 버튼 클릭
				document.getElementById('submitBtn').onclick = function() {
					postingComment('update');
				}
			}
		}
	}
}

function findComments() {
	if (httpRequest.readyState === 4) {
		if (httpRequest.status === 200) {
			console.log(httpRequest.responseText);
			console.log("삭제 버튼 function");
			let test = httpRequest.responseText;
			
			if(test === "true") {
				// 특정 공고에 후기 입력을 이미 했으면 추가로 후기 입력을 불가능하게 하는 기능 구현 (없으면 후기 작성 가능)
	        	document.getElementById('insert_modal_showBtn').style.display = "none";
			} else if(test === "false") {
				// 특정 공고에 후기 입력을 이미 했으면 추가로 후기 입력을 불가능하게 하는 기능 구현 (없으면 후기 작성 가능)
	        	document.getElementById('insert_modal_showBtn').style.display = "block";				
			}
			
		}
	}
}