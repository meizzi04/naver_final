<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/js/jquery-3.7.1.min.js"></script>
<script>
	$(document).ready(function() {
		$("#deleteBtn").on('click', function(e) {
			let inputPw = prompt("암호 입력");
			let dbPw = $("#hiddenPw").val()
			if (inputPw == dbPw) {
				location.href = "boarddelete?seq=${detaildto.seq}"
			} else {
				alert("암호 다름");
			}
		});
		$("#updateBtn").on('click', function(e) {
			let inputPw = prompt("암호 입력");
			let dbPw = $("#hiddenPw").val()
			if (inputPw == dbPw) {
				$("#f").attr("method", "post");
				$("#f").attr("action", "boardupdate");
				$("#f").submit();
			} else {
				alert("암호 다름");
			}
		});

	});
</script>
</head>

<body>
	<!-- 1개 게시물 모델(seq-writingtime) 출력 -->
	<!-- 수정버튼 삭제버튼 -->
	<form id="f" action="" method="">
		번호: <input name = "seq" value="${detaildto.seq }" readonly><br>
		제목: <input name = "title" value="${detaildto.title }"><br>
		내용: <textarea cols="50" rows="5" name = "contents">
				${detaildto.contents }
			</textarea><br>
		작성자: <input name = "writer" value="${detaildto.writer }" readonly><br>
		조회수: <input name = "viewcount" value="${detaildto.viewcount }" readonly><br>
		작성일자: <input name = "writingtime" value="${detaildto.writingtime }" readonly><br>

		<input id="hiddenPw" type="hidden" value="${detaildto.pw}">
		
		<input id="updateBtn" type="button" value="수정 버튼">
		<input id="deleteBtn" type="button" value="삭제 버튼"><br>
	</form>

</body>
</html>