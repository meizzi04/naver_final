<%@page import="annotation.springMVC.LoginDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		LoginDTO dto = (LoginDTO)request.getAttribute("login");
		out.print("자바 - " + dto.getId() + " 회원님, 암호는 " + dto.getPw() + " 입니다.");
	%>
	<hr>
	EL - ${login.id} 회원님, 암호는 ${login.pw}입니다.
</body>
</html>