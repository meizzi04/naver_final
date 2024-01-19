<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="resources/js/jquery-3.7.1.min.js"></script>
<script>
	$(document).ready(function(){
		$("#ajaxbtn1").on("click", function(){
			$.ajax({
				url: "ajaxlogin",
				data: {'memberid': $("#memberid").val(), 'pw': $("#pw").val()},
				type: "get",
				dataType: "json",
				success: function(response){
					//alert(JSON.stringify(response)); // response 객체 출력하려면 문자열로 변경
					if(response.loginresult == "로그인 성공"){
						$("#result").css("color", "green");
					} else{
						$("#result").css("color", "red");
					}
					$("#result").html("<h3>" + response.loginresult + "</h3>");
				},
				error: function(request, e){ // 선택
					alert("코드: " + request.status + "메시지: " + request.responseText + "오류: " + e);
				}
			});
		});
		
		$("#ajaxbtn2").on("click", function(){
			$.ajax({
				url: "ajaxmypage",
				data: {'memberid': $("#memberid").val(), 'pw': $("#pw").val()},
				type: "post",
				dataType: "json",
				success: function(response){
					//alert(JSON.stringify(response)); // memberDTO를 JSON 형태로 변경
					if(response.memberName == null){
						//alert(JSON.stringify(response));
						$("#result").html("<h3>회원 정보가 없습니다.</h3>");
						$("#result").css("color", "red");
					} else{
						//alert(JSON.stringify(response));
						$("#result").html("<h3>" + response.memberId + "</h3>");
						$("#result").append("<h3>" + response.memberName + "</h3>");
						$("#result").append("<h3>" + response.phone + "</h3>");
						$("#result").append("<h3>" + response.email + "</h3>");
						$("#result").append("<h3>" + response.regdate + "</h3>");
						$("#result").css("color", "blue");
					}
				},
				error: function(request, e){ // 선택
					alert("코드: " + request.status + "메시지: " + request.responseText + "오류: " + e);
				}
			});
		});
		
		$("#ajaxbtn3").on("click", function(){
			$.ajax({
				url: "ajaxlist",
				// data도 선택
				//data: {'memberid': $("#memberid").val(), 'pw': $("#pw").val()},
				type: "post",
				dataType: "json",
				success: function(response){
					/* if(response == null){
						//alert(JSON.stringify(response));
						$("#result").html("<h3>회원 정보가 없습니다.</h3>");
						$("#result").css("color", "red");
					} else{ */
						//alert(JSON.stringify(response));
						$("#result").html("");
						for(let i = 0; i <= response.length; i++){
							$("#result").append("<h3><a href='abc'>" + response[i].memberId + "</a>: ");
							$("#result").append(response[i].memberName + ": ");
							$("#result").append(response[i].phone + ": ");
							$("#result").append(response[i].email + "</h3>");
						}
						$("#result").css("color", "blue");							
					//}
				},
				error: function(request, e){ // 선택
					alert("코드: " + request.status + "메시지: " + request.responseText + "오류: " + e);
				}
			});
		});
		
		// a 태그로 넘어가면 ajax가 아닌 다른 페이지로 넘어가니까 기본 동작 막아놓기
		// event로 생긴 태그들은 동적인 태그임
		// 원래 div 태그에 a 태그는 없었는데 아래 코드는 기존에 있는 a 태그를 찾는 코드
		/*$("div a").on("click", function(e){
			e.preventDefault();
		})*/
		
		// 새로 생긴 a 태그를 클릭했을 때
		$("#result").on("click", "a", function(e){
			e.preventDefault();
			// 클릭한 회원의 암호 #result에 출력
			// ajax로 요청
			// url - "ajaxgetpw/회원아이디"
			$.ajax({
				url: "ajaxgetpw/" + $(this).text(),
				type: "post",
				dataType: "json",
				success: function(response){
					//alert(JSON.stringify(response));
					$("#result").html("<h1>암호는 "+response.pw + "입니다. </h3>");
				},
				error: function(request, e){ // 선택
					alert("코드: " + request.status + "메시지: " + request.responseText + "오류: " + e);
				}
			});
		})
		
		$("#ajaxbtn4").on("click", function(){
			$.ajax({
				url: "ajaxgetpw/" + $("#memberid").val(),
				type: "post",
				dataType: "json",
				success: function(response){
					//alert(JSON.stringify(response));
					$("#result").html("<h1>암호는 "+response.pw + "입니다. </h3>");
				},
				error: function(request, e){ // 선택
					alert("코드: " + request.status + "메시지: " + request.responseText + "오류: " + e);
				}
			});
		});
		
		$("#uploadbtn").on("click", function(e){
			e.preventDefault();
			
			let data = new FormData($("#uploadform").get(0)); // html form 태그 입력태그 -- 자바스크립트 객체
			$.ajax({
				url: "ajaxupload",
				type: "post",
				data: data,
				encType: "multipart/form-data", // 파일 업로드시에만 필요
				processData: false, // name = value를 한쌍으로 전송 X, form 안에 스트림 형태로 넣을 거니까 (request.getParameter() 불가능)
				contentType: false, // request 전송할 때 setContentType("text/html") - default, 파일이니까 false 값으로 설정
				dataType: "json",
				success: function(response){
					//alert(JSON.stringify(response));
					$("#uploadresult").html(response.uploadresult);
				},
				error: function(request, e){ // 선택
					alert("코드: " + request.status + "메시지: " + request.responseText + "오류: " + e);
				}
			});
		});
		
	});
</script>
</head>
<body>
	<h1>ajax 테스트</h1>
	<form action="nonajaxlogin">
		아이디<input type=text name="memberid" id="memberid"><br>
		암호<input type=password name="pw" id="pw"><br>
		<input type="submit" value="nonajax로그인"> <!-- ajax는 전달하면 안되므로 submit 사용 X -->
		<input type="button" id="ajaxbtn1" value="ajax로그인">
		<input type="button" id="ajaxbtn2" value="ajax내정보조회">
		<input type="button" id="ajaxbtn3" value="ajax모든회원조회">
		<input type="button" id="ajaxbtn4" value="ajax암호조회">		
	</form>
	<div id="result">회원정보결과</div>
	<hr>
	
	<h1>ajax 파일 업로드</h1>
	<form id="uploadform">
		파일 선택: <input type="file" name="uploadfile">
		<input type="button" id="uploadbtn" value="파일업로드">
	</form>
	<div id="uploadresult">파일업로드결과</div>
</body> 
</html>