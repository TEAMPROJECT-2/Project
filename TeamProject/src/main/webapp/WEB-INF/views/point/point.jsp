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
            <div class="row">
                <div class="col-lg-3">
                    <div class="shop__sidebar">
                        <div class="shop__sidebar__accordion">
                            <div class="accordion" id="accordionExample">
                                <div class="card">
                                    <div class="card-heading">
                                        <a data-toggle="collapse" data-target="#collapseOne">메뉴1</a>
                                    </div>
                                    <div id="collapseTwo" class="collapse show" data-parent="#accordionExample">
                                        <div class="card-body">
                                            <div class="shop__sidebar__categories">
                                                <ul>
                                                    <li><a href="${pageContext.request.contextPath }/main/main">만들어진 페이지-메인(main)</a></li>
                                                    <li><a href="${pageContext.request.contextPath }/food/shop">만들어진 페이지-상품목록(shop)</a></li>
                                                    <li><a href="${pageContext.request.contextPath }/food/details">만들어진 페이지-상품정보(details)</a></li>
                                                    <li><a href="${pageContext.request.contextPath }/order/checkout">만들어진 페이지-결제(checkout)</a></li>
                                                    <li><a href="${pageContext.request.contextPath }/order/cart">만들어진 페이지-장바구니(cart)</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="card">
                                    <div class="card-heading">
                                        <a data-toggle="collapse" data-target="#collapseTwo">메뉴2</a>
                                    </div>
                                    <div id="collapseTwo" class="collapse show" data-parent="#accordionExample">
                                        <div class="card-body">
                                            <div class="shop__sidebar__brand">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                        <div class="shop__sidebar__search">
                            <form action="#">
                                <input type="text" placeholder="Search...">
                                <button type="submit"><span class="icon_search"></span></button>
                            </form>
                        </div>
                       </div>
                      </div>
                     </div>
                    </div>
                               
    
    <!-- 내용 -->
          
    <div class="col-lg-9">
    		<h2>포인트 충전</h2>
          		<form action="${pageContext.request.contextPath }/point/pointPro" method="post">
          			<input type = "text" placeholder="충전할 포인트를 입력하세요.">
          			<input type = "submit" value = "충전"><br><br><br>
    			</form>
    						
    
<!--     테이블2 table-hover -->
      <h2>포인트 조회</h2>
   		<fieldset id="checkline">
		<form action="${pageContext.request.contextPath }/point/pointChceck" method="get">
		 <input type="button" value="1개월">
		 <input type="button" value="3개월">
		 <input type="button" value="6개월">
		 <table border="1" style="border: hidden;">
			<tr><td>
				<select>
					<option>2022</option>
					<option>2021</option>
					<option>2020</option>
					<option>2019</option>
					<option>2018</option>
				</select>년
			</td><td>
				<select>
					<c:forEach var="i" begin="1" end="12" step="1">
						<option>${i}</option>  
					</c:forEach>
				</select>월
			</td><td>
				<select>
				<c:forEach var="i" begin="1" end="31" step="1">
						<option>${i}</option>  
				</c:forEach>
				</select>일
			</td><td><b>&nbsp;~&nbsp;</b>
			<td>
				<select>
					<option>2022</option>
					<option>2021</option>
					<option>2020</option>
					<option>2019</option>
					<option>2018</option>
				</select>년
			</td><td>
				<select>
					<c:forEach var="i" begin="1" end="12" step="1">
						<option>${i}</option>  
					</c:forEach>
				</select>월
			</td><td>
				<select>
				<c:forEach var="i" begin="1" end="31" step="1">
						<option>${i}</option>  
				</c:forEach>
				</select>일
			</td>
		 </table>
		 <input type = "submit" value = "조회">	
		</form>		
		</fieldset><br><br>
      <div class="table-responsive">
        <table class="table table-hover table-sm">
          <thead>
            <tr>
              <th scope="col">적립일자</th>
              <th scope="col">내역</th>
              <th scope="col">적립</th>
              <th scope="col">사용</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>random</td>
              <td>data</td>
              <td>placeholder</td>
              <td>text</td>
            </tr>
            
            
          </tbody>
        </table>
        

          
        
      </div>
  </div>
</div>
    
    

                    <div class="row">
                        <div class="col-lg-12">
                            <div class="product__pagination">
                                <a class="active" href="#">1</a>
                                <a href="#">2</a>
                                <a href="#">3</a>
                                <span>...</span>
                                <a href="#">21</a>
                            </div>
                        </div>
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

