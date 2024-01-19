<%@page import="spring.mybatis.service.MemberDTO"%>
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
	<a href="registermember">회원가입</a>
	<a href="modifymember">회원수정</a>
	<a href="deletemember?memberId=springinsertid">회원탈퇴</a>
	
	<form action="membersearchlist">
		<select name="item">
			<option>이름 검색</option>
			<option selected>아이디 검색</option>
			<option>전화번호 검색</option>
			<option>이메일 검색</option>
		</select>
		검색어: <input type="text" name="searchWord">
		<input type="submit" value="검색">
	</form>
	
	<hr>
	<!-- java 사용 -->
	<%
		List<MemberDTO> memberlist = (List<MemberDTO>)request.getAttribute("memberlist");
		String count = (String)request.getAttribute("count");
		
		out.println("<h2>" + count + "</h2><hr>");
		
		for(MemberDTO dto : memberlist){
			out.println("<h3>" + dto.getMemberId() + ": ");
			out.println(dto.getMemberName() + ": ");
			out.println(dto.getEmail() + ": ");
			out.println(dto.getPhone() + ": ");
			out.println(dto.getRegdate() + "</h3>");
		}
	%>
	<hr>
	
	<!-- EL/JSTL 사용 -->
	<!-- <c:forEach items="${memberlist}" var="one">
		<h3>${one.memberId}:${one.memberName}</h3>
	</c:forEach> -->
</body>
</html>