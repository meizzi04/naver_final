<%@page import="java.util.ArrayList"%>
<%@page import="annotation.springMVC.HelloDTO"%>
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
	<%
		ArrayList<HelloDTO> list = (ArrayList<HelloDTO>)request.getAttribute("modelList");
		
		for(HelloDTO dto : list){
			out.print("<h3>" + dto.getMessage() + "</h3>");
		}
	%>
	<hr>
	<c:forEach items="${modelList}" var="dto">
		<h3>${dto.message}</h3>
	</c:forEach>
</body>
</html>