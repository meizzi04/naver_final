<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>다운로드 가능 목록</h1>
	<c:forEach items="${filearray}" var="filename">
		<a href="filedownloadresult?filename=${filename}">${filename}</a> 다운로드<br>
	</c:forEach>
	
</body>
</html>