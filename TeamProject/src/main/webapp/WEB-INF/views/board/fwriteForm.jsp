<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board/fwriteForm.jsp</title>
</head>
<body>
<jsp:include page="../inc/menu.jsp"/>

    <section class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__text">
                        <h4>community</h4>
                        <div class="breadcrumb__links">
                            <a href="${pageContext.request.contextPath }/main/main">Home</a>
                            <span>community</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </section>
<form action="${pageContext.request.contextPath }/board/fwritePro" method="post" 
enctype="multipart/form-data">
<table border="1">
<tr><td>닉네임</td><td><input type="text" name="USER_NICKNM"></td></tr>
<tr><td>제목</td><td><input type="text" name="BOARD_SUBJECT"></td></tr>
<tr><td>파일</td><td><input type="file" name="file"></td></tr>
<tr><td>내용</td>
    <td><textarea name="BOARD_CONTENT" rows="10" cols="20"></textarea></td></tr>
<tr><td colspan="2"><input type="submit" value="글쓰기"></td></tr>
</table>
<a href="${pageContext.request.contextPath }/board/list">글목록</a>
<!-- Footer Section Begin -->
<jsp:include page="../inc/footer.jsp"/>
</form>
</body>
</html>

