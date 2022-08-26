<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp5/updateForm.jsp</title>
</head>
<body>

<form action="${pageContext.request.contextPath }/board/updatePro" method="post">
<input type="hidden" name="num" value="${boardDTO.boardNum }">
<table border="1">
<tr><td>글쓴이</td><td><input type="text" name="userNicknm" value="${boardDTO.userNicknm }" readonly></td></tr>
<tr><td>제목</td>
    <td><input type="text" name="subject" value="${boardDTO.boardSubject }"></td></tr>
<tr><td>파일</td><td><input type="file" name="file" value="${boardDTO.boardFile }"></td></tr>
<tr><td>내용</td>
    <td><textarea name="content" rows="10" cols="20">${boardDTO.boardContent }</textarea></td></tr>
<tr><td colspan="2"><input type="submit" value="글수정"></td></tr>
</table>
</form>

</body>
</html>