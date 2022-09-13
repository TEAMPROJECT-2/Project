<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-3.6.0.js"></script>
<script src="${pageContext.request.contextPath }/resources/jsPro/basketListPro.js"></script>
</head>
<body>
<jsp:include page="../inc/menu.jsp"/>

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
                                    <th>상품</th>
                                    <th>수량</th>
                                    <th>Total</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                              <c:forEach items="${basketList }" var="basketDTO" varStatus="status">
                                <tr>
                                    <td class="product__cart__item">
                                        <div class="product__cart__item__pic">
                                            <img src="img/shopping-cart/cart-1.jpg" alt="">
                                        </div>
                                        <div class="product__cart__item__text">
                                            <h6>${basketDTO.sbProdNm }상품이름</h6>
                                            <h5>${basketDTO.sbProdPrice }원</h5>
                                        </div>
                                    </td>
                                    <td class="quantity__item">
                                        <c:if test="${basketDTO.prodLQuantity == 0}">
                      						<h6>품절</h6>
                      					</c:if>
                                        <c:if test="${basketDTO.prodLQuantity != 0}">
                                        <div class="quantity">
                                            <div class="pro-qty-2">
                                                <input type="text" value="${basketDTO.sbCount}" max="${basketDTO.prodLQuantity}" min="1">
                                            </div>
                                        </div>
                                        </c:if>
                                    </td>
                                    <td class="cart__price">

                                        <div class="quantity">
                                                ${basketDTO.sbCount * basketDTO.sbProdPrice }
                                        </div>
                                     </td>
                                    <td class="cart__close"><i class="fa fa-close"></i></td>
                                </tr>
                                <input type="hidden" name="sbCount" value="${basketDTO.sbCount}" id="sbCount">
                                <input type="hidden" name="sbProdPrice" value="${basketDTO.sbProdPrice}" id="sbProdPrice">

                          </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <div class="row">
                        <div class="col-lg-6 col-md-6 col-sm-6">
                            <div class="continue__btn">
                                <a href="#">쇼핑 계속하기</a>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-6">
                            <div class="continue__btn update__btn">
                                <a href="#"><i class="fa fa-spinner"></i> Update cart</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="cart__discount">
                        <h6>쿠폰 코드</h6>
                        <form action="#">
                            <input type="text" placeholder="Coupon code">
                            <button type="submit">쿠폰 등록</button>
                        </form>
                    </div>
                    <div class="cart__total">
                        <h6>결제</h6>
                        <ul>
                            <li>할인 <span >0000원</span></li>
                            <li>합계 <span id="itemTotalPrice"></span></li>
                        </ul>
<!--                         todo -->
                        <a href="${pageContext.request.contextPath }/mypage/order" class="primary-btn">주문하기</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Shopping Cart Section End -->
    <jsp:include page="../inc/footer.jsp"/>

</body>
</html>