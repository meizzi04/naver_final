<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>자바 - <%=request.getAttribute("title") %></h3>
	<h3>EL - ${title}</h3>
	
	<form action="login" method="get">
		아이디: <input type="text" name="id"><br>
		암호: <input type="password" name="pw"><br>
		나이: <input type="number" name="age"><br>
		<input type="submit" value="로그인">
	</form>
</body>
</html>