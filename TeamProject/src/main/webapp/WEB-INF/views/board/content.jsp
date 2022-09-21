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
<style type="text/css">
	table {
  border-collapse: separate;
  border-spacing: 0 10px;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">


</script>
</head>
<body>



<!-- http://localhost:8080/JspProject/jsp5/content.jsp?num=1 -->
<%
// model.addAttribute("boardDTO", boardDTO);
	%>
	<!-- 메뉴단 -->
<jsp:include page="../inc/menu.jsp"/>
    <form action="${pageContext.request.contextPath }/board/fwrite">
    <input type="hidden" name="userId" value="${sessionScope.userId}" >
    </form>

    <!-- 사이드 메뉴(inc로 빼도 됨) -->
    <section class="shop spad">
		<div class="container">
            <div class="row">
                    <table class="table table-condensed">
                        <thead>
                            <tr align="center">
                                <th width="10%">${boardDTO.boardNum }</th>
                                <th width="60%"><h5>${boardDTO.boardSubject }</h5></th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>작성일
                                </td>
                                <td>
                               ${boardDTO.boardDate }<span style='float:right'>조회 : ${boardDTO.boardReadcount }</span>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                작성자
                                </td>
                                <td>
                                ${boardDTO.userNicknm} <span style='float:right'>좋아요 : ${boardDTO.boardLikecount}</span>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <p class="mb-4 mt-3">${boardDTO.boardContent }</p>

                                </td>
                            </tr>
                            <tr>
                            		<td width="10%">파일</td>
                                	<td width="60%">${boardDTO.boardFile }</td>
                            </tr>
                        </tbody>
                    </table>
                    <form action="${pageContext.request.contextPath }/board/likeinset">
                    <input type="hidden" name="boardNum" value="${boardDTO.boardNum}"></input>

                   	<c:set var="userId" scope="session" value="${sessionScope.userId}"/>
                   	<c:set var="lId" target="${likeList}" value="${likeDTO.userId}" />

	                   	<c:choose>
	                   		<c:when test="${userId!=likeList}">
	                   			<input type="image" id="pic" src="${pageContext.request.contextPath }/resources/img/icon/redhart.png" value="추천">
	                   		</c:when>
	                   		<c:when test="${userId==likeList}">
	                   			<input type="image" id="pic" src="${pageContext.request.contextPath }/resources/img/icon/heart.png" value="추천">
	                   		</c:when>
	                   	</c:choose>

        			<%-- <c:if test="${userId == lId}">

                    </c:if>

                    <c:if test="${userId != lId}">

                    </c:if> --%>
                    </form>



                    <table class="table table-striped" >
               <c:forEach items="${replyList}" var="replyDTO">
				<!-- 댓글 테이블 -->
                   		 <tr>
                   		 		<input type="hidden" name="rNum" value="${replyDTO.rNum}">
                            	<th width="5%" style="text-align:right;">${replyDTO.userId}</th>
                                <td width="60%">${replyDTO.rContent } <span style='float:right'>${replyDTO.rDate}</span>
                                <td width="5%" style="text-align:width;">
                                  <c:set var="userId" scope="session" value="${sessionScope.userId}" />
								  <c:set var="rId" target="${replyList}" scope="request" value="${replyDTO.userId}" />
								  <c:if test="${userId == rId}">
                                	<a onclick="location.href='${pageContext.request.contextPath }/board/rdeletePro?boardNum=${boardDTO.boardNum}&rNum=${replyDTO.rNum}'" style="cursor:pointer;">삭제</a>
                                  </c:if>
                                </td>
                         </tr>
                </c:forEach>
                    </table>
			<!-- 댓글 작성 -->
				<form name="comment-form" action="${pageContext.request.contextPath }/board/isnertPro" method="post" autocomplete="off">

                    <table class="table table-condensed">
                        <tr>
                            <td>
                                <span class="form-inline" role="form">
                                		<h3>댓글</h3>
                                		<input type="hidden" name="boardNum" value="${boardDTO.boardNum}">
                                        <textarea id="commentParentText" name="rContent" class="form-control col-lg-12 mt-3" style="width:100%" rows="4" cols="180"></textarea><br>
                                        <button type="submit" class="btn btn-light">등록</button>
                                </span>
                            </td>
                        </tr>
                    </table>
                    </form>
                    <table class="table table-condensed">
                        <thead>
                            <tr>
                                <td>
                                    <span style='float:right'>
                                        <a href="${pageContext.request.contextPath }/board/list"><button type="button" id="list" class="btn btn-secondary">목록</button></a>
                                        <button type="button" id="modify" class="btn btn-secondary" onclick="location.href='${pageContext.request.contextPath }/board/update?boardNum=${boardDTO.boardNum }'">수정</button>
                                        <button type="button" id="delete" class="btn btn-secondary" onclick="location.href='${pageContext.request.contextPath }/board/delete?boardNum=${boardDTO.boardNum }'">삭제</button>
                                    </span>
                                </td>
                            </tr>
                        </thead>
                    </table>
            </div>
            <hr/>
        </div>

    </section>

<!-- Footer Section Begin -->
<jsp:include page="../inc/footer.jsp"/>
</body>
</html>