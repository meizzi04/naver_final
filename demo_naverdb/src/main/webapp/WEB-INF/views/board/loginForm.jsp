<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>게시물 작성 위한 로그인 폼</h3>
	
	<form action="boardlogin" method="post">
		아이디: <input type="text" name="memberid"><br>
		암호: <input type="password" name="pw"><br>
		<input type="submit" value="로그인">
	</form>
</body>
</html>