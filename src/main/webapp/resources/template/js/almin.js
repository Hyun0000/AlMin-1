/**
 * 
 */
	// XMLHttpRequest 모듈
	
	// 1. XMLHttpRequest 객체를 담을 변수
	let httpRequest;
	
	// 2. XMLHttpRequst 객체 생성
	function getXHR() {
		return new XMLHttpRequest();
	}
	
	// 3. server에게 ajax 요청을 할 method
	function sendRequest(method, url, param, callback) { // 들고올 paramter가 없으면 null로 넣어줘도 됩니다.
		// XMLHttpRequest 객체 생성
		httpRequest = getXHR();
		
		// method 방식 정하기
		let httpMethod = (method == null) ? 'GET' : method;
		// 삼항연산자 : 만약 sendRequest method에 대한 method 인자를 주지않으면 기본 method 방식을 GET으로 지정
		
		// server로 보낼 parameter
		// let httpParam = (param == null || param == "") ? null : param;
		// httpUrl = httpUrl + "?" + httpParams;
		// param은 다음과 같은 형식으로 작성 -->
		
		// server url 지정
		let httpUrl = url;
		
		// GET 메소드면 URL 뒤에 파라미터를 붙임
		if (httpMethod == 'GET' && param != null) {
			httpUrl = httpUrl + "?" + param;
		}
		console.log(param);
		console.log(httpUrl);
		// reviews?recruitNo=1
		
		// open
		httpRequest.open(httpMethod, httpUrl, true);
		// 예시
		// httpRequest.open(“GET”, “/test.jsp?id=admin&pw=1234”, true); --> Web&DB 통합구현 교재 참고
		
		// httpRequest.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
		// httpRequest.setRequestHeader('Content-Type','application/x-www-form-urlencoded; charset=UTF-8');
		//  "application/x-www-form-urlencoded"는 웹브라우저가 <form> 태그를 이용해서 입력한 사용자의 데이터를 POST방식으로 전송할때 사용하는 표준 MIME type이며  key=value의 유형으로 인코딩을 합니다.
		
		// callback function 지정
		httpRequest.onreadystatechange = callback;
		
		// HTTP 요청 방식이 'POST'면 send() 함수를 통해 파라미터 전송
		// server에 요청보내기
		if (httpMethod == 'GET') {
			httpRequest.send();
		} else {
			httpRequest.send(param);
			// 예시
			// httpRequest.send(“id=admin&pw=1234”);
		}
	}