<%@page import="org.springframework.ui.Model"%>
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
	<form action="moviereserve" method="get">
		아이디: <input type="text" name="id"><br>
		암호: <input type="password" name="pw"><br>
		나이: <input type="number" name="age"><br>
		영화목록(다중선택)<br>
		<select name="movieList" multiple>	
			<c:forEach items="${movieMap}" var="oneMovie">
				<option>${oneMovie.key}</option>
			</c:forEach>
		</select>
		<input type="submit" value="영화신청">
	</form>
</body>
</html>