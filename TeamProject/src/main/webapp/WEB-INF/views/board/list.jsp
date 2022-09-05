<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>        
<!DOCTYPE html>
<html>
<head>
</head>
<body>
<!-- 메뉴단 -->
<jsp:include page="../inc/menu.jsp"/>

    <!-- 헤더단(광고같은 거 들어가도 됨) -->
    <section class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__text">
                        <h4>커뮤니티</h4>
                        <div class="breadcrumb__links">
                            <a href="./index.html">Home</a>
                            <span>Community</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- 사이드 메뉴(inc로 빼도 됨) -->
    <section class="shop spad">
        <div class="container">
          <div class="col-lg">
            <div class="row">
                <div class="col-lg-12">
                    <ul class="filter__controls mt-3 mb-5">
                        <li class="active"><a href="${pageContext.request.contextPath }/board/list">게시판1</a></li>
                        <li> <a href="${pageContext.request.contextPath }/main/main">게시판2</a></li>
                        <li> <a href="${pageContext.request.contextPath }/main/main">게시판3</a></li>
                    </ul>
	             <div class="shop__sidebar__search">
	              <form action="#">
	                  <input type="text" class="text-center" style="border:none; border-bottom:1px solid"
	                  		placeholder="검색할 키워드를 적어주세요">
	                  <button type="submit"><span class="icon_search"></span></button>
	              </form>
	          	</div>
                </div>
            </div>
	       </div>


    <!-- 내용 -->
    <div class="col-lg mb-4">
	<!--     테이블2 table-hover -->
      <div class="table-responsive">
     	    <div class="shop__sidebar__search mb-2 col-3">
              <form action="#">
                  <input type="text" placeholder="Search...">
                  <button type="submit"><span class="icon_search"></span></button>
              </form>
          	</div>
        <table class="table table-hover table">
          <thead>
            <tr>
              <th scope="col">#</th>
              <th scope="col">Header</th>
              <th scope="col">Header</th>
              <th scope="col">Header</th>
              <th scope="col">Header</th>
            </tr>
          </thead>
          <tbody>
            <c:forEach var="boardDTO" items="${boardList }" >
				<tr>
					<td>${boardDTO.boardNum }</td>
					<td>${boardDTO.userNicknm}</td>
					<td><a href="${pageContext.request.contextPath }/board/content?boardNum=${boardDTO.boardNum }">
					${boardDTO.boardSubject }</a></td>
					<td>${boardDTO.boardDate }</td>
					<td>${boardDTO.boardRecount }</td>
				</tr>
			</c:forEach>
          </tbody>
			
        </table>
        <div align="right">
			<a href="${pageContext.request.contextPath }/board/fwrite"><button type="button" class="btn btn-primary" >게시글 작성하기</button></a>
		</div>
      </div>
  </div>


                    <div class="row">
                        <div class="col-lg-12">
                            <div class="product__pagination">
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
									
									

                            </div>
                            
                        </div>
                    </div>
                </div>
        
    </section>
    <!-- Shop Section End -->


    <!-- Footer -->
    <jsp:include page="../inc/footer.jsp"/>
</body>

</html>
