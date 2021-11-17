/**
 * 
 */
window.onload = function() {
		console.log("${pageContext.request.contextPath}");
//====================================================================================================
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
//            else {
//                alert("제출 성공" + contractRadio);
//            }			
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
	            // allConditionObj[i] = keywordArr_i;
	            
	            for (let k = 0; k < keywordArr_i.length; k++) {
	                console.log(keywordArr_i[k]);
	            }
			}
			console.log("=================================================");
			console.log(allConditionObj);
			console.log(JSON.stringify(allConditionObj));
			console.log("=================================================");
			
			// 작성자, 한 줄 후기, 근로계약서 작성 여부 등의 data를 담는 js object
			let restData = {
					ccRecruitNo : '1',
					ccWriter : 'user02',
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
					data : JSON.stringify(allConditionObj)
						// condition : JSON.stringify(allConditionObj)
/* 						good : JSON.stringify(keywordArr_0),
						bad : JSON.stringify(keywordArr_1),
						condition : JSON.stringify(keywordArr_2),
						air : JSON.stringify(keywordArr_3),
						pay : JSON.stringify(keywordArr_4) */
					,
					success : function (data) {
						console.log("success 시작");
						if (data.result == "ok") {
							alert("후기 등록 ok");
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
//====================================================================================================
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
}


//====================================================================================================
// drag한 itme의 id 정보 저장 (in dragzone)
function drag(event) {
	// console.log(event.target);
	// console.log(event.target.id);
	// console.log(event.target.parentNode);
	// console.log(event.target.parentNode.previousElementSibling);
    event.dataTransfer.setData("text", event.target.id);
 	// console.log(event.dataTransfer.getData("text"));
    // console.log(event.dataTransfer.getData("text").parentNode);
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
	    	// console.log(event.dataTransfer.getData("text").parentNode);
	    	// console.log(event.dataTransfer.getData("text"));
	    	// console.log("event.target");
	    	// console.log(event.target);
	    	// console.log("dropzoneEle[i]");
	    	// console.log(dropzoneEle[i]);
	        event.target.appendChild(dataInject);
	    }
	}

    // dropzone에 놓았을 때 x 마크 보이기
    for (var i = 0; i < dropzoneEle.length; i++) {
	    for (let j = 0; j < dragItemEle.length; j++) {
	        if (dragItemEle[j].parentNode == dropzoneEle[i]) {
	            dragItemEle[j].lastChild.style.display = "inline-block";
	        }
	    }
    }
}