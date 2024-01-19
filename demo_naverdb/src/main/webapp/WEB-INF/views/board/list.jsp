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
	<h1>검색 폼</h1>
	<form action="boardsearchlist">
		검색항목: <select name="item">
			<option>제목</option>
			<option>내용</option>
			<option>작성자</option>			
			<option>전체</option>			
		</select><br>
		검색어: <input type="text" name="word">
		<input type="submit" value="검색">
	</form>
	<hr>
	<h1>게시물 리스트 출력</h1>
	<table border="3">
		<tr><th>번호</th><th>제목</th><th>작성자</th><th>조회수</th></tr>
		<c:forEach items="${boardlist}" var="dto">
			<tr><td>${dto.seq}</td><td><a href="boarddetail?seq=${dto.seq}">${dto.title}</a></td><td>${dto.writer}</td><td>${dto.viewcount}</td></tr>
		</c:forEach>
	</table>
	<h1>페이지 번호 선택</h1>
	<%
		int pagecount = (Integer)request.getAttribute("pagecount");
		int totalcount = (Integer)request.getAttribute("totalcount");
		
		int totalpage = 0;
		
		if(totalcount % pagecount == 0){
			totalpage = totalcount / pagecount;
		} else{
			totalpage = totalcount / pagecount + 1;
		}
		
		for(int i = 1; i <= totalpage; i++){
			out.println("<a href=\"boardlist?pagenum=" + i + "\">" + i + "페이지</a>");
		}
	%>
</body>
</html>