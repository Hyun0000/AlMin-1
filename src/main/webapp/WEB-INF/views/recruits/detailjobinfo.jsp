<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
      /* item을 drop하는 div 스타일 지정 */
     .dropzoneClass {
         padding: 20px;
         width: 1000px;
         /* height: 150px; */
         border: 1px solid red;
         box-sizing: border-box;
         
         margin-top: 50px;

         display: flex;
         justify-content: start;
         flex-wrap: wrap;
     }

     /* item을 모아놓은 div 스타일 지정 */
     .dragzoneClass {
         padding: 20px;
         width: 1000px;
         /* height: 150px; */
         border: 1px solid black;
         box-sizing: border-box;

         margin-top: 50px;
         
         display: flex;
         justify-content: start;
         flex-wrap: wrap;
     }

     /* 각 item 스타일 지정 */
     .dragEle {
         border: 1px solid black;
         padding: 10px;
         margin: 10px 10px;
     }

     /* item 이름 옆 x 마크 스타일 지정 */
     .xMark {
         color: red;
         margin-left: 5px;

         /* dragzone에 있을때는 x 마크 안 보이게 설정 */
         display: none;
     }
</style>
</head>
<body>
<!-- <form action="" method="post"> -->

	<c:forEach var="map" items="${commentsMap}">
		<c:set var="dropNum" value="${dropNum + 1}"/>
		<c:set var="dragNum" value="${dragNum + 1}"/>
		
		<div id="dropzone_${dropNum}" class="dropzoneClass" ondrop="drop(event)" ondragover="allowDrop(event)">
			<c:choose>
				<c:when test="${map.key == 1}">장점</c:when>
				<c:when test="${map.key == 2}">단점</c:when>
				<c:when test="${map.key == 3}">조건</c:when>
				<c:when test="${map.key == 4}">분위기</c:when>
				<c:when test="${map.key == 5}">급여</c:when>
			</c:choose>
		
		</div>
		
		<div id="dragzone_${dragNum}" class="dragzoneClass">
			<c:forEach var="condition" items="${map.value}">
				<c:set var="idNum" value="${idNum + 1}"/>
				<div id="drag_${idNum}" class="dragEle" draggable="true" ondragstart="drag(event);"><span class="keyword">${condition}</span><span class="xMark">&times;</span></div>
			</c:forEach>
		</div>
	</c:forEach>
	
	<button type="button" id="submitBtn">등록</button>
<!-- </form> -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	// item을 놓는 장소인 dropzone : <div id="dropzone">
	// let dropzoneEle = document.getElementById('dropzone');
	let dropzoneEle = document.getElementsByClassName('dropzoneClass');
	
	// 기존 item을 저장하는 장소인 dragzone : <div id="dragzone">
	// let dragzoneEle = document.getElementById('dragzone');dragzoneClass
	let dragzoneEle = document.getElementsByClassName('dragzoneClass');
	
	// drag할 각 item
	let dragItemEle = document.getElementsByClassName('dragEle');
	
	// x마크
	let xEle = document.getElementsByClassName('xMark');
//====================================================================================================
		// let allConditionObj = new Array();
		let allConditionObj = {};
		// 후기 제출
		document.getElementById('submitBtn').onclick = function () {
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
			alert(123);
			
	 			$.ajax({
					type : "POST",
					url : "commentsinsert",
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
//====================================================================================================
	function allowDrop(event) {
	    event.preventDefault();
	}
//====================================================================================================
	
	
</script>
</body>
</html>