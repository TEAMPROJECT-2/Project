<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
</head>
<body>
<!-- 메뉴단 -->
<jsp:include page="../inc/menu.jsp"/>

    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__text">
                        <h4>Check Out</h4>
                        <div class="breadcrumb__links">
                            <a href="./index.html">Home</a>
                            <a href="./shop.html">Shop</a>
                            <span>Check Out</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Checkout Section Begin -->
    <section class="checkout spad">
        <div class="container">
            <div class="checkout__form">
                <form action="#">
                    <div class="row">
                        <div class="col-lg-8 col-md-6">
                            <h6 class="coupon__code"><span class="icon_tag_alt"></span> 쿠폰이 있으면 <a href="#">여기 눌러서
                            </a> 추가할 수 있다고 하는데 따로 쿠폰란 만드셔도 될듯</h6>
                            <h6 class="checkout__title">주문 정보</h6>
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>이름<span>*</span></p>
                                        <input type="text">
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>공란<span>*</span></p>
                                        <input type="text">
                                    </div>
                                </div>
                            </div>
                            <div class="checkout__input">
                                <p>주소<span>*</span></p>
                                <input type="text" placeholder="주소" class="checkout__input__add">
                                <input type="text" placeholder="상세주소">
                            </div>
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>전화번호<span>*</span></p>
                                        <input type="text">
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>Email<span>*</span></p>
                                        <input type="text">
                                    </div>
                                </div>
                            </div>
                            <div class="checkout__input">
                                <p>배송시 요구사항<span>*</span></p>
                                <input type="text"
                                placeholder="체크박스로 해도 될듯">
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6">
                            <div class="checkout__order">
                                <h4 class="order__title">주문 정보</h4>
                                <div class="checkout__order__products">Product <span>Total</span></div>
                                <ul class="checkout__total__products">
                                    <li>01. AAA <span>0000원</span></li>
                                    <li>02. BBB <span>0000원</span></li>
                                    <li>03. CCC <span>0000원</span></li>
                                    <li>04. DDD <span>0000원</span></li>
                                </ul>
                                <ul class="checkout__total__all">
                                    <li>할인 금액 같은거?<span>0000원</span></li>
                                    <li>Total <span>0000원</span></li>
                                </ul>
                                <div class="checkout__input__checkbox">
                                    <label for="payment">
                                        신용카드/무통장입금 사항 선택해도 되고
                                        <input type="checkbox" id="payment">
                                        <span class="checkmark"></span>
                                    </label>
                                </div>
                                <div class="checkout__input__checkbox">
                                    <label for="paypal">
                                        개인정보 어쩌구에 동의하는지 해도 될듯
                                        <input type="checkbox" id="paypal">
                                        <span class="checkmark"></span>
                                    </label>
                                </div>
                                <button type="submit" class="site-btn">결제</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </section>
    <!-- Footer Section Begin -->
    <jsp:include page="../inc/footer.jsp"/>
</body>
</html>