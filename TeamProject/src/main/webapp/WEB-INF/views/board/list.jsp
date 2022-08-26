<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>

</head>
<body>
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
<tr><td>번호</td><td>작성자</td><td>제목</td><td>등록일</td><td>조회수</td></tr>
<c:forEach var="boardDTO" items="${boardList }">
<tr><td>${boardDTO.boardNum }</td>
	<td>${boardDTO.userNicknm}</td>
	<td>
	<a href="${pageContext.request.contextPath }/board/content?boardNum=${boardDTO.boardNum }">
	${boardDTO.boardSubject }</a></td>
	<td>${boardDTO.boardDate }</td>
	<td>${boardDTO.boardRecount }</td>
	</tr>	
</c:forEach>
</table>

<c:if test="${pageDTO.startPage > pageDTO.pageBlock }">
<a href="${pageContext.request.contextPath }
/board/list?pageNum=${pageDTO.startPage - pageDTO.pageBlock}">Prev</a>
</c:if>

<c:forEach var="i" begin="${pageDTO.startPage }" end="${pageDTO.endPage }" step="1">
<a href="${pageContext.request.contextPath }/board/list?pageNum=${i}">${i}</a>  
</c:forEach>

<c:if test="${pageDTO.endPage < pageDTO.pageCount }">
<a href="${pageContext.request.contextPath }
/board/list?pageNum=${pageDTO.startPage + pageDTO.pageBlock}">Next</a>
</c:if>
<a href="${pageContext.request.contextPath }/board/fwrite">게시글 작성하기</a>

   


<!-- Footer Section Begin -->
<jsp:include page="../inc/footer.jsp"/>
</body>
</html>