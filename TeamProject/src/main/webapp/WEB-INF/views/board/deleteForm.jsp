<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"> 
<title>board/deleteForm.jsp</title>
</head>
<body>
<input type="hidden" name="userId" value="${MemberDTO.userID}">
<form action="${pageContext.request.contextPath }/board/deletePro" method="post">
<input type="hidden" name="boardNum" value="${boardNum}">
<table border="1">
<tr><td>비밀번호</td><td><input type="password" name="userPass"></td></tr>
<tr><td colspan="2"><input type="submit" value="글삭제"></td></tr>
</table>
</form>
</body>
</html>

