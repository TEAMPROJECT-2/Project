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


<script type="text/javascript" 
src="${pageContext.request.contextPath }/resources/script/jquery-3.6.0.js""></script>
<script type="text/javascript">
$(document).ready(function () {
	let likecount = document.getElementById('likecount')
	let likeval = document.getElementById('likeCheck').value
	const boardNum = '${boardDTO.boardNum}';
	const userId = "${sessionScope.userId}";
	const likeimg = document.getElementById("likeimg")

	if (likeval > 0) {
		likeimg.src = "/resources/img/harte/redheart.png";
	}
	else {
		likeimg.src = "/resources/img/harte/heart.png";
	}
    // 좋아요 버튼을 클릭 시 실행되는 코드
$(".likeimg").on("click", function () {
	$.ajax({
      url: '/board/isnertLike',
      type: 'POST',
      data: { 'boardNum': boardNum, 'userId': userId },
      success: function (data) {
          if (data == 1) {
              $("#likeimg").attr("src", "/resources/img/harte/redheart.png");
              location.reload();
          } else {
              $("#likeimg").attr("src", "/re/resources/img/harte/heart.png");
              location.reload();
          }
      }, error: function () {
          $("#likeimg").attr("src", "/resources/img/harte/redheart.png");
          console.log('오타 찾으세요')
      }

  });

  });
  });


</script>

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

 <c:set var="userId" scope="session" value="${sessionScope.userId}"/>
    <c:if test="${userId ne null}">
		<tr><td colspan="4">
		<input type="button" value="글수정" class="btn btn-primary"
		onclick="location.href='${pageContext.request.contextPath }/board/update?boardNum=${boardDTO.boardNum }'">
		<input type="button" value="글삭제" class="btn btn-primary"
		onclick="location.href='${pageContext.request.contextPath }/board/delete?boardNum=${boardDTO.boardNum }'">
		</td>
		</tr>
	</c:if>
</table>	
<!-- 추천부분 -->
 <body>
<c:set var="userId" scope="session" value="${sessionScope.userId}"/>
<c:if test="${sessionScope.userId ne null}">
	<img src="/resources/img/harte/heart.png" id="likeimg" width="60px" height="60px"
		class="rounded-circle mt-2">
		${boardDTO.likecount} <br><br>
	추천 기능은 <a href="/member/login" type="button" id="newLogin"
	class="btn btn-outline-success">로그인</a> 후 사용 가능합니다.
	</c:if>
	<c:if test="${sessionScope.userId == null}">
		<div>
	<input type="hidden" id="like_check" value="${likeDTO.likeCheck}">
	<img class="rounded-circle likeimg" id="likeimg" src="/resources/img/harte/heart.png"
	width="60px" height="60px"> ${boardDTO.likecount}
	</div>
	</c:if>
    </body>
	


<hr>
<a href="${pageContext.request.contextPath }/board/list"><input type="button" class="btn btn-primary" value="글목록 "></a>
<!-- 댓글 부분 -->
<c:set var="userId" scope="session" value="${sessionScope.userId}"/>
<c:if test="${userId ne null}">
<div class="card my-4">
		<h5 class="card-header">댓글</h5>
		<div class="card-body">
			<form name="comment-form" action="${pageContext.request.contextPath }/board/isnertPro" method="post" autocomplete="off">
				<div class="form-group">
					<input type="hidden" name="boardNum" value="${boardDTO.boardNum}" />
					<textarea name="rContent" class="form-control" rows="3"></textarea>
				</div>
				<button type="submit" class="btn btn-primary">작성하기</button>
			</form>
		</div>
	</div>
</c:if>
<c:forEach items="${replyList}" var="replyDTO">
<table border="1">
<tr><td><input type="hidden" name="rNum" value="${replyDTO.rNum}"></td>
	<td>이름</td><td>${replyDTO.userId}</td>
    <td>댓글내용</td><td>${replyDTO.rContent }</td>
    <td>글쓴날짜</td><td>${replyDTO.rDate }</td>
    <c:set var="userId" scope="session" value="${sessionScope.userId}" />
    <c:set var="rId" target="${replyList}" scope="request" value="${replyDTO.userId}" />
    <c:if test="${userId == rId}">
    <td><input type="button" value="댓글 삭제" onclick="location.href='${pageContext.request.contextPath }/board/rdeletePro?boardNum=${boardDTO.boardNum}&rNum=${replyDTO.rNum}'"></td>
	</c:if>
	</tr>
	
</table>

                
</c:forEach>

<!-- 댓글 부분 -->

<!-- Footer Section Begin -->
<jsp:include page="../inc/footer.jsp"/>
</body>
</html>