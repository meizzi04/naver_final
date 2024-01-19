<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/js/jquery-3.7.1.min.js" ></script>
<script>
	$(document).ready(function(){
		$("#ajaxBtn").on("click", function(){
			$.ajax({
				url: "helloajax",
				type: "get",
				dataType: "json",
				success: function(server){
					$("#ajaxResult").html(server.model);
				}
			});
		});
	});
	
</script>
</head>
<body>
	<h1>helloboot.jsp 파일입니다.</h1>
	
	<img src="/images/html5.jpg">
	<input type="button" value="ajax 요청" id="ajaxBtn">
	ajax 결과 출력: <h1 id="ajaxResult"></h1>
</body>
</html>