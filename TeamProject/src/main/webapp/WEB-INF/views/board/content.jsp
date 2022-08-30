<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board/content.jsp</title>
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
<tr><td>글쓴이</td><td>${boardDTO.userNicknm }</td>
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
onclick="location.href='${pageContext.request.contextPath }/board/delete?boardNum=${boardDTO.boardNum }'"></td></tr>
<input type="button" value="좋아요"
onclick="location.href='${pageContext.request.contextPath }/board/likePro?boardNum=${boardDTO.boardNum }'">
</table>	
<a href="${pageContext.request.contextPath }/board/list">글목록</a>
<!-- Footer Section Begin -->
<jsp:include page="../inc/footer.jsp"/>
</body>
</html>