<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>
	<meta charset="UTF-8">
	<meta name="description" content="Male_Fashion Template">
	<meta name="keywords" content="Male_Fashion, unica, creative, html">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>핏티드</title>

	<!-- Google Font -->
	<link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&display=swap"
	rel="stylesheet">

	<!-- Css Styles -->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/font-awesome.min.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/elegant-icons.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/magnific-popup.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/nice-select.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/owl.carousel.min.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/slicknav.min.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css" type="text/css">
</head>
<!-- 페이지 로더 -->
<div id="preloder">
    <div class="loader"></div>
</div>

<!-- 회원메뉴단(모바일) -->
<div class="offcanvas-menu-overlay"></div>
<div class="offcanvas-menu-wrapper">
    <div class="offcanvas__option">
        <div class="offcanvas__links">
	        <a href="${pageContext.request.contextPath }/member/login">로그인</a>
	        <a href="${pageContext.request.contextPath }/member/join">회원가입</a>

        </div>
        <div class="offcanvas__top__hover">
        </div>
    </div>
    <div class="offcanvas__nav__option">
        <a href="#" class="search-switch"><img src="${pageContext.request.contextPath }/resources/img/icon/search.png" alt=""></a>
        <a href="#"><img src="${pageContext.request.contextPath }/resources/img/icon/heart.png" alt=""></a>

       <!-- todo 페이지를 못찾음-->
        <a href="${pageContext.request.contextPath }/order/cart"><img src="${pageContext.request.contextPath }/resources/img/icon/cart.png" alt=""></a>
        <div class="price">0 포인트</div>
    </div>
    <div id="mobile-menu-wrap"></div>
    <div class="offcanvas__text">
        <p>운동에 대한 어쩌구 장바구니/포인트관리 같은 거 있어도 될 듯</p>
    </div>
</div>
<!-- 회원메뉴단(모바일) 끝 -->

<!-- 회원메뉴단 -->
<header class="header">
    <div class="header__top">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-7">
                    <div class="header__top__left">
                        <p>나에게 딱 맞는 운동 쇼핑몰 핏티드!

                        <a href="${pageContext.request.contextPath }/user/mypage">마이페이지</a>
			            <a href="${pageContext.request.contextPath }/basic/basic-badge-button">버튼</a>
			            <a href="${pageContext.request.contextPath }/basic/basic-form">폼</a>
			            <a href="${pageContext.request.contextPath }/basic/basic-menu-table">테이블</a></p>

                    </div>
                </div>
                <div class="col-lg-6 col-md-5">
                    <div class="header__top__right">
                        <div class="header__top__links">

                        	<c:if test="${(empty sessionScope)}">
								<!-- sessionScope 아이디가 비어있는 경우 로그인 / 회원가입 -->
								<a href="${pageContext.request.contextPath }/member/login">로그인</a>
								<a href="${pageContext.request.contextPath }/member/join">회원가입</a>
							</c:if>

							<c:if test="${ !(empty sessionScope.userId)}">
								<!-- sessionScope 아이디가 userId에 admin이 아닐 경우 환영글 / 로그아웃 -->
								<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery-3.6.0.js"></script>
								${sessionScope.userId }님 환영합니다!
								<c:if test="${sessionScope.userId ne 'admin'}">
									<a href="${pageContext.request.contextPath }/user/mypage">마이페이지</a>
									<a href="${pageContext.request.contextPath }/member/logout">로그아웃</a>
								</c:if>
							</c:if>

							<c:if test="${ !(empty sessionScope.compId )}">
								<!-- sessionScope 아이디가 compId에 admin이 아닐 경우 마이페이지 -->
								<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery-3.6.0.js"></script>
								${sessionScope.compId }님 환영합니다!
									<a href="${pageContext.request.contextPath }/comp/compMain">업체페이지</a>
									<a href="${pageContext.request.contextPath }/member/logout">로그아웃</a>
							</c:if>

                            <!-- 비어있는 경우가 아닌 경우 == 스코프가 비어있지 않으면 if문이 동작 조건연산자 -->
							<c:if test="${ !(empty sessionScope.userId )}">
								<!-- sessionScope 아이디가 admin일 경우 관리자페이지 -->
								<c:if test="${sessionScope.userId eq 'admin'}">
									<a href="${pageContext.request.contextPath }/member/list">관리자페이지</a>
									<a href="${pageContext.request.contextPath }/member/logout">로그아웃</a>
								</c:if>
							</c:if>
                        </div>
                        <div class="header__top__hover">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- 하단메뉴단 -->
    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-md-3">
                <div class="header__logo">
                    <a href="${pageContext.request.contextPath }/main/main"><img src="${pageContext.request.contextPath }/resources/img/logo.png" alt="로고"></a>
                </div>
            </div>
            <div class="col-lg-6 col-md-6">
                <nav class="header__menu mobile-menu">
                    <ul>
                        <li><a href="${pageContext.request.contextPath }/product/shop">운동용품</a></li>
                        <li><a href="${pageContext.request.contextPath }/food/shop">식품</a></li>
                        <li><a href="${pageContext.request.contextPath }/board/list">커뮤니티</a></li>
<!--                         <li class="active"><a href="#">커뮤니티</a> -->
<!--                                <ul class="dropdown"> -->
<!--                                 <li><a href="../shopping-cart.html">게시판1</a></li> -->
<!--                                 <li><a href="../checkout.html">게시판2</a></li> -->
<!--                                 <li><a href="../blog-details.html">게시판2</a></li> -->
<!--                             </ul> -->
<!--                         </li> -->
                        <li><a href="../contact.html">이벤트</a></li>
                    </ul>
                </nav>
            </div>
            <div class="col-lg-3 col-md-3">
                <div class="header__nav__option">
                    <a href="#" class="search-switch"><img src="${pageContext.request.contextPath }/resources/img/icon/search.png" alt=""></a>
                    <a href="#"><img src="${pageContext.request.contextPath }/resources/img/icon/heart.png" alt=""></a>
                    <a href="${pageContext.request.contextPath }/mypage/cart"><img src="${pageContext.request.contextPath }/resources/img/icon/cart.png" alt=""></a>
                    <div class="price">0 포인트</div>
                </div>
            </div>
        </div>
        <div class="canvas__open"><i class="fa fa-bars"></i></div>
    </div>
</header>
