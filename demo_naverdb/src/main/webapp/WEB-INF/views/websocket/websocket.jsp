<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/js/jquery-3.7.1.min.js"></script>
</head>
<body>
	별명: <input type="text" id="nickname" value="${param.id }">
	<input type="button" id="enterBtn" value="입장">
	<input type="button" id="exitBtn" value="퇴장">
	
	<h1>채팅영역</h1>
	전송 메시지 <input type="text" id="message">
	<input type="button" id="sendBtn" value="메시지전송"><br>

	<div id="chatMessageArea" style="background-color:pink; border:2px solid black"></div>
	
	<script>
		websocket = null;
		$("#enterBtn").on("click", function(){
			if(websocket == null){
				websocket = new WebSocket("ws://localhost:9070/ws");
				
				websocket.onopen = function(){console.log("웹소켓 연결성공");};
				websocket.onclose = function(){console.log("웹소켓 해제성공");};
				websocket.onmessage = function(event){ // 서버로부터 데이터 받는 부분
					console.log("웹소켓 서버로부터 수신성공");
					let data = event.data;
					$("#chatMessageArea").append(data + "<br>");
				};
			};
		});
		
		$("#exitBtn").on("click", function(){
			websocket.close();
		});
		
		$("#sendBtn").on("click", function(){
			// 웹소켓 서버로 데이터 보내는 부분
			let nick = $("#nickname").val();
			let msg = $("#message").val();
			websocket.send(nick + ": " + msg);
			console.log("웹소켓 서버에게 송신성공");
		});
	</script>
</body>
</html>