<%@page import="board.spring.mybatis.BoardDTO"%>
<%@page import="java.util.List"%>
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
	<table border="3">
		<tr><th>번호</th><th>제목</th><th>작성자</th><th>조회수</th></tr>
		<c:forEach items="${list}" var="dto">
			<tr><td>${dto.seq}</td><td><a href="boarddetail?seq=${dto.seq}">${dto.title}</a></td><td>${dto.writer}</td><td>${dto.viewcount}</td></tr>
		</c:forEach>
	</table>
	<a href="boardlist">전체리스트</a>
</body>
</html>