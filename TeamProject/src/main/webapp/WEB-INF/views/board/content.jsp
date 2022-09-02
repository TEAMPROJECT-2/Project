<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board/content.jsp</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Bootstrap 4</title>
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
</head>
<body>



<!-- http://localhost:8080/JspProject/jsp5/content.jsp?num=1 -->
<%
// model.addAttribute("boardDTO", boardDTO);
	%>
	<!-- 메뉴단 -->
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
<table border="1">
<tr><td>글번호</td><td>${boardDTO.boardNum }</td>
    <td>글쓴날짜</td><td>${boardDTO.boardDate }</td></tr>
<tr><td>글쓴이</td><td>${boardDTO.userNicknm}</td>
    <td>조회수</td><td>${boardDTO.boardRecount }</td></tr>
<tr><td>글제목</td><td colspan="3">${boardDTO.boardSubject }</td></tr>

<tr><td>파일</td><td colspan="3">
<a href="${pageContext.request.contextPath }/resources/upload/${boardDTO.boardFile }" download>
${boardDTO.boardFile }</a></td></tr>

<tr><td>글내용</td><td colspan="3">${boardDTO.boardContent }</td></tr>
<tr><td colspan="4">
<input type="button" value="글수정" 
onclick="location.href='${pageContext.request.contextPath }/board/update?boardNum=${boardDTO.boardNum }'">
<input type="button" value="글삭제" 
onclick="location.href='${pageContext.request.contextPath }/board/delete?boardNum=${boardDTO.boardNum }'">
<input type="button" class="btn btn-primary" id="like_btn" value="추천 ">
<div>${likeDTO.likeNum}</div>
</td></tr>
</table>	
<a href="${pageContext.request.contextPath }/board/list"><input type="button" class="btn btn-primary" value="글목록 "></a>

<hr>

<!-- 댓글 부분 -->

<div class="card my-4">
		<h5 class="card-header">댓글</h5>
		<div class="card-body">
			<form name="comment-form" action="${pageContext.request.contextPath }/board/isnertPro" method="post" autocomplete="off">
				<div class="form-group">
					<input type="hidden" name="boardNum" value="${boardDTO.boardNum}" />
					<textarea name="rContent" class="form-control" rows="3"></textarea>
				</div>
				<button type="submit" class="btn btn-primary">Submit</button>
			</form>
		</div>
	</div>
<table class="Table">
<thead>
	<tr>
		<td>번호</td>
		<td>작성자</td>
		<td>내용</td>
		<td>등록일</td>
	</tr>
</thead>
<tbody>
<c:forEach var="replyDTO" items="${replyList}">
	<tr>
		<td>${replyDTO.rNum }</td>
		<td>${replyDTO.userId}</td>
		<td>${replyDTO.rContent}</td>
		<td>${boardDTO.boardDate }</td>
	</tr>	
</c:forEach></tbody>

</table>
</form>

<!-- 댓글 부분 -->

<!-- Footer Section Begin -->
<jsp:include page="../inc/footer.jsp"/>
</body>
</html>