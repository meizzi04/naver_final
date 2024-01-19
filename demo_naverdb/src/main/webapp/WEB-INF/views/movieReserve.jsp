<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>${id} 회원님, ${age} 살입니다.</h1>
	<h3>===시청 가능한 영화 목록===</h3>
	<h3>${resultMovie}</h3>
	
	<!--
		springMVC는 WEB-INF 아래에 뷰들, xml파일 모두 있음. 
		resources 안에 images나 multimedia 폴더가 있어야 실행됨
		컨트롤러, dao, dto, jsp, java 파일 아닌 것들은 resources 폴더 안에 저장
	-->
	<video src="resources/multimedia/chrome.mp4" controls width=600 height=400 poster="resources/multimedia/chrome.jpg"></video>
</body>
</html>