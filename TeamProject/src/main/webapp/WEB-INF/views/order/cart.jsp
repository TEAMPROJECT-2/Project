<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-3.6.0.js"></script>
<script src="${pageContext.request.contextPath }/resources/jsPro/basketListPro.js"></script>
</head>

<body>
	<jsp:include page="../inc/menu.jsp" />

	<!-- Breadcrumb Section Begin -->
	<section class="breadcrumb-option">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb__text">
						<h4>장바구니</h4>
						<div class="breadcrumb__links">
							<a href="./index.html">Home</a>
							<a href="./shop.html">마이페이지</a>
							<span>장바구니</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb Section End -->

	<!-- Shopping Cart Section Begin -->
	<section class="shopping-cart spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-8">
					<div class="shopping__cart__table">
						<table>
							<thead>
								<tr>
									<th>&nbsp;&nbsp;&nbsp;&nbsp;상품</th>
									<th>수량</th>
									<th>Total</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<form action="${pageContext.request.contextPath }/order/insertOrder" method="post">
									<c:forEach items="${basketList }" var="basketDTO" varStatus="status">
										<tr>
											<td class="product__cart__item">
												<div class="product__cart__item__pic">
													<img src="img/shopping-cart/cart-1.jpg" alt="">
												</div>
												<div class="product__cart__item__text">
													<h6>${basketDTO.sbProdNm }</h6>
													<h5><fmt:formatNumber value="${basketDTO.sbProdPrice }" pattern="₩###,###,###"/></h5>
<%-- 													<h5>${basketDTO.sbProdPrice }원</h5> --%>
												</div>
											</td>
											<td class="quantity__item">
												<c:if test="${basketDTO.prodLQuantity == 0}">
													<h6>품절</h6>
												</c:if>
												<c:if test="${basketDTO.prodLQuantity != 0}">
													<div class="quantity">
														<div class="pro-qty-2">
															<input type="text" id="select_vol_${basketDTO.num}" class="select_vol" name="select_vol" value="${basketDTO.sbCount}" max="${basketDTO.prodLQuantity}" min="1">
															<a href="#"></a>
														</div>
													</div>
												</c:if>
											</td>
											<td class="cart__price">
												<input type="hidden" id="price_${basketDTO.num}" value="${basketDTO.sbProdPrice }">
<!-- 												수량증가시 증가버튼 누른 가격만 갖고오기 -->
												<div id="total_${basketDTO.num}" class="total"><fmt:formatNumber value="${basketDTO.sbTotalPrice }" pattern="₩###,###,###"/></div>
											</td>
<!-- 											삭제 구현 -->
											<td class="cart__close" id="delProd_${basketDTO.num}">
											<a onclick="cartDelete();" title="Remove"><i class="fa fa-close"></i></a></td>
										</tr>

										<input type="hidden" name="sbProdCode_" value="${basketDTO.sbProdCode}" id="sbProdCode_${basketDTO.num}">
<!-- 										수량증가시 증가버튼 누른 코드만 갖고오기 -->
										<input type="hidden" name="sbCount" value="${basketDTO.sbCount}" id="sbCount">
										<input type="hidden" name="sbProdCode" value="${basketDTO.sbProdCode}" id="sbProdCode">
										<input type="hidden" name="sbProdPrice" value="${basketDTO.sbProdPrice}" id="sbProdPrice">
										<input type="hidden" name="prodLQuantity" value="${basketDTO.prodLQuantity}" id="prodLQuantity">
										<input type="hidden" name="sbUser" value="${basketDTO.sbUser}" id="sbUser">

									</c:forEach>

							</tbody>
						</table>
					</div>
					<div class="row">
						<div class="col-lg-6 col-md-6 col-sm-6">
							<div class="continue__btn">
								<a href="${pageContext.request.contextPath }/product/shop">쇼핑 계속하기</a>
							</div>
						</div>
						<div class="col-lg-6 col-md-6 col-sm-6">


						</div>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="cart__discount">
						<h6>쿠폰 적용</h6>
							<div class="col-3 mb-3">
						<select id="myCouponList" class="form-select form-control-lg" name="myCouponList" >
						</select>
					</div>

					</div>

					<div class="cart__total">
<!-- 						<h6>결제</h6> -->
						<ul>
							<li>상품 할인 <span id="itemDcPrice"></span></li>
							<li>주문 합계 <span id="itemTotalPrice"></span></li>
						</ul>
						<button type="submit" id="orderChk" name="orderChk" >주문하기</button>
					</form>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Shopping Cart Section End -->
	<jsp:include page="../inc/footer.jsp" />

</body>
</html>
