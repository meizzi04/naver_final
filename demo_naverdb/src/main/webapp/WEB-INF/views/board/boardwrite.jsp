<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/js/jquery-3.7.1.min.js"></script>
<script>
	$(document).ready(function(){
		$("#writerBtn").on("click", function(){
			$.ajax({
				url: "getwriter/" + $("#writer").val(),
				// data: {'memberid': $("#writer").val()},
				type: "get",
				dataType: "json",
				success: function(res){
					let output = "<h4>" + res.memberName + "</h4>";
					output += "<h4>" + res.email + "</h4>";
					output += "<h4>" + res.phone + "</h4>";
					output += "<h4>" + res.regdate + "</h4>";
					
					$("#writeform").html(output);
				},
				error: function(status){
					alert("오류")
				}
			});			
		});
	});
</script>
</head>
<body>
	<form action="boardwrite" method="post">
		제목 <input type="text" name="title"><br>
		내용 <textarea rows="5" cols="50" name="contents" >내용 입력</textarea><br>
		작성자 <input type="text" name="writer" id="writer" value="${sessionid}" readonly><br>
		암호 <input type="text" name="pw"><br>
		<input type="submit" value="글 작성">
		<input type="button" id="writerBtn" value="작성자 정보">
	</form>
	
	<div id="writeform"></div>
	<!-- 
		작성자 정보 보기 버튼 클릭시
		- getWriter url 호출 (writer value 전송) - ajax 요청
			- controller 메소드
				- @RequestMapping("getWriter")
				- MemberDTO 객체 리턴
		- writer 해당 이름, 이메일, 폰번호, 가입일 writeform 출력 - ajax 응답
	 -->
</body>
</html>