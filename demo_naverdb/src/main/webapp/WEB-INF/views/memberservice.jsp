<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>회원가입</h1>
	<form action="memberservice" method="post">
		아이디: <input type="text" name="memberId"><br>
		비밀번호: <input type="password" name="pw"><br>
		이름: <input type="text" name="memberName"><br>
		전화번호: <input type="text" name="phone"><br>
		이메일: <input type="email" name="email"><br>
		가입날짜: <input type="datetime-local" name="regdate"><br>
		<input type="submit" value="회원가입">
	</form>
</body>
</html>