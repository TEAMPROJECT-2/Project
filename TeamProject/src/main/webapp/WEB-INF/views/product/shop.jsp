<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="description" content="Male_Fashion Template">
	<meta name="keywords" content="Male_Fashion, unica, creative, html">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">

	<script type="text/javascript" src="<c:url value="/resources/js/jquery-3.3.1.min.js"/>"></script>
	<title>product/shop.jsp</title>

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

<!-- ------------ AJAX 카테고리 구현 ------------ -->
<script src="http://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript">

<!-- 검색어 기능 START -->
$(document).ready(function(){
	$('#submit').click(function() {
// 		alert("TEST");
		if($("#srhText").val().length==''){
			alert("검색어를 입력해주세요.");
			$("#srhText").focus();
			return false;
		}
	});
});
<!-- 검색어 기능 END -->

<!-- 카테고리 기능 -->
$(document).ready(function(){
	$(".clothes").click(function(){
// 		alert("TEST");
	    if($(".sub1").is(":visible")){
	        $(".sub1").slideUp();
	    }
	    else{
	        $(".sub1").slideDown();
	    }
	});
	$(".instrument").click(function(){
// 		alert("TEST");
	    if($(".sub2").is(":visible")){
	        $(".sub2").slideUp();
	    }
	    else{
	        $(".sub2").slideDown();
	    }
	});
	$(".stuff").click(function(){
// 		alert("TEST");
	    if($(".sub3").is(":visible")){
	        $(".sub3").slideUp();
	    }
	    else{
	        $(".sub3").slideDown();
	    }
	});
});
<!-- 카테고리 기능 -->

</script>


<body>
    <!-- Header Section End -->
    <jsp:include page="../inc/menu.jsp"/>

    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__text">
                        <h4>Shop</h4>
                        <div class="breadcrumb__links">
                            <a href="${pageContext.request.contextPath }/main/main">Home</a>
                            <span>Shop</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Shop Section Begin -->
    <section class="shop spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="shop__sidebar">
                        <div class="shop__sidebar__search">
                            <form action="${pageContext.request.contextPath }/product/shop">
                                <input type="text" id="srhText" name="srhText">
                                <button type="submit" id="submit">
                                <span class="icon_search"></span></button>
                            </form>
                        </div>
                        <!-- 화면 왼쪽 카테고리 시작 -->
                        <div class="shop__sidebar__accordion">
                            <div class="accordion" id="accordionExample">
                            	<!-- 운동용품 카테고리 시작 -->
                                <div class="card">
                                    <div class="card-heading">
                                        <a data-toggle="collapse" data-target="#collapseOne">운동용품</a>
                                    </div>
                                    <div id="collapseOne" class="collapse show" data-parent="#accordionExample">
                                        <div class="card-body">
                                            <div class="shop__sidebar__categories">
                                                <ul class="nice-scroll">
                                                <!-- to do -->
                                               		<li><a href="#" id="clothes" class="clothes">옷</a>
                                               			<ul class="sub1" style="display: none">
                                               				<li><a href="#" id="top">ㅡ　상의</a></li>
                                               				<li><a href="#" id="bottoms">ㅡ　하의</a></li>
                                               			</ul>
                                               		</li>
                                               		<li><a href="#" id="instrument" class="instrument">기구</a>
                                               			<ul class="sub2" style="display: none">
                                               				<li><a href="#" id="dumbbell">ㅡ　덤벨</a></li>
                                               				<li><a href="#" id="mat">ㅡ　매트</a></li>
                                               				<li><a href="#" id="roller">ㅡ　폼롤러</a></li>
                                               			</ul>
                                               		</li>
                                               		<li><a href="#" id="stuff" class="stuff">잡화</a>
                                               			<ul class="sub3" style="display: none">
                                               				<li><a href="#" id="protector">ㅡ　보호대</a></li>
                                               				<li><a href="#" id="bottle">ㅡ　보틀</a></li>
                                               				<li><a href="#" id="bag">ㅡ　가방</a></li>
                                               			</ul>
                                               		</li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- 운동용품 카테고리 끝 -->
                                <!-- 식품 카테고리 시작 -->
                                <div class="card">
                                    <div class="card-heading">
                                        <a data-toggle="collapse" data-target="#collapseTwo">식품</a>
                                    </div>

                                    <div id="collapseTwo" class="collapse show" data-parent="#accordionExample">
                                        <div class="card-body">
                                            <div class="shop__sidebar__brand">
                                                <ul class="nice-scroll">
                                                	<!-- 선택지 1 -->
                                               		<li><a href="#" id="supplement" class="supplement">보충제</a></li>
                                                    <li><a href="#" id="meal" class="meal">식단</a></li>
                                                    <!-- 선택지 1 -> supplement 클릭 시 -> 선택지 2 -->
                                                    <li><a href="#" id="protein" class="protein" style="display: none">프로틴</a></li>
                                                    <li><a href="#" id="booster" class="booster" style="display: none">부스터</a></li>
                                                    <li><a href="#" id="nutritive" class="nutritive" style="display: none">영양제</a></li>
                                                    <!-- 선택지 1 -> meal 클릭 시 -> 선택지 2 -->
                                                    <li><a href="#" id="chicken" class="chicken" style="display: none">닭가슴살</a></li>
                                                    <li><a href="#" id="salad" class="salad" style="display: none">샐러드</a></li>
                                                    <li><a href="#" id="lunchbox" class="lunchbox" style="display: none">도시락</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- 식품 카테고리 끝 -->
                                <!-- 가격 카테고리 시작 -->
                                <div class="card">
                                    <div class="card-heading">
                                        <a data-toggle="collapse" data-target="#collapseThree">가격대</a>
                                    </div>
                                    <div id="collapseThree" class="collapse show" data-parent="#accordionExample">
                                        <div class="card-body">
                                            <div class="shop__sidebar__price">
                                                <ul>
                                                    <li><a href="#">5000원 이하</a></li>
                                                    <li><a href="#">5000원 ~ 10000원</a></li>
                                                    <li><a href="#">10000원 ~ 20000원</a></li>
                                                    <li><a href="#">0000원 이상</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- 가격 카테고리 끝 -->
                                <!-- 사이즈 카테고리 시작 -->
                                <div class="card">
                                    <div class="card-heading">
                                        <a data-toggle="collapse" data-target="#collapseFour">Size</a>
                                    </div>
                                    <div id="collapseFour" class="collapse show" data-parent="#accordionExample">
                                        <div class="card-body">
                                            <div class="shop__sidebar__size">
                                                <label for="xs" id="xs" class="xs">XS
                                                    <input type="radio" id="xs">
                                                </label>
                                                <label for="s" id="s" class="s">S
                                                    <input type="radio" id="s">
                                                </label>
                                                <label for="m" id="m" class="m">M
                                                    <input type="radio" id="m">
                                                </label>
                                                <label for="l" id="l" class="l">L
                                                    <input type="radio" id="l">
                                                </label>
                                                <label for="xl" id="xl" class="xl">XL
                                                    <input type="radio" id="xl">
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- 사이즈 카테고리 끝 -->
                                <!-- 색상 카테고리 시작 -->
                                <div class="card">
                                    <div class="card-heading">
                                        <a data-toggle="collapse" data-target="#collapseFive">Colors</a>
                                    </div>
                                    <div id="collapseFive" class="collapse show" data-parent="#accordionExample">
                                        <div class="card-body">
                                            <div class="shop__sidebar__color">
                                                <label class="c-1" for="sp-1">
                                                    <input type="radio" id="sp-1">
                                                </label>
                                                <label class="c-2" for="sp-2">
                                                    <input type="radio" id="sp-2">
                                                </label>
                                                <label class="c-3" for="sp-3">
                                                    <input type="radio" id="sp-3">
                                                </label>
                                                <label class="c-4" for="sp-4">
                                                    <input type="radio" id="sp-4">
                                                </label>
                                                <label class="c-5" for="sp-5">
                                                    <input type="radio" id="sp-5">
                                                </label>
                                                <label class="c-6" for="sp-6">
                                                    <input type="radio" id="sp-6">
                                                </label>
                                                <label class="c-7" for="sp-7">
                                                    <input type="radio" id="sp-7">
                                                </label>
                                                <label class="c-8" for="sp-8">
                                                    <input type="radio" id="sp-8">
                                                </label>
                                                <label class="c-9" for="sp-9">
                                                    <input type="radio" id="sp-9">
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- 색상 카테고리 끝 -->
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-9">
                    <div class="shop__product__option">
                        <div class="row">
                            <div class="col-lg-6 col-md-6 col-sm-6">
                                <div class="shop__product__option__left">
                                    <p>전체 상품 개수 : </p>
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-6">
                                <div class="shop__product__option__right">
                                    <p>정렬</p>
                                    <select>
                                        <option value="">신상품순</option>
                                        <option value="">낮은 가격순</option>
                                        <option value="">높은 가격순</option>
                                    </select>
                                    <select id="dataPerPage">
								        <option value="10">10개씩보기</option>
								        <option value="15">15개씩보기</option>
								        <option value="20">20개씩보기</option>
									</select>

                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- 상품 뿌려주는 곳 시작 -->
                    <%-- <c:if test=""> --%>
                    <div class="row">
                    	<c:forEach var="prodList" items="${prodList}">
                        <div class="col-lg-4 col-md-6 col-sm-6">
                            <div class="product__item">
                                <div class="product__item__pic set-bg">
                                <a href="${pageContext.request.contextPath }/product/details?prodLNum=${prodList.prodLNum}">
									<img src="${pageContext.request.contextPath }/resources/img/product/${prodList.prodLMainimg}" alt="위의 이미지를 누르면 연결됩니다."/>
								</a>
                                    <ul class="product__hover">
                    	 	           <li><a href="${pageContext.request.contextPath }/product/likeinsert?prodLCode=${prodList.prodLCode}&userId=${sessionScope.userId}">
                    	 	           <img src="${pageContext.request.contextPath }/resources/img/icon/heart.png" alt=""><span>찜하기</span></a></li>
                    		           <li><a href="${pageContext.request.contextPath }/order/cart"><img src="${pageContext.request.contextPath }/resources/img/icon/cart.png" alt=""><span>장바구니 담기</span></a></li>
                                   </ul>
                                </div>
                                <div class="product__item__text">
                                   <h7>${prodList.prodLProdnm}</h7>
                                   <!-- 상품가격의 가독성을 높이기 위해 숫자 3자리마다 콤마(,)를 찍어주도록 처리함 -->
                                   <h5> <fmt:formatNumber value="${prodList.prodLPrice}" pattern="###,###,###원"/></h5>
                                    <div class="rating">
                                        <i class="fa fa-star-o"></i>
                                        <i class="fa fa-star-o"></i>
                                        <i class="fa fa-star-o"></i>
                                        <i class="fa fa-star-o"></i>
                                        <i class="fa fa-star-o"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                        </c:forEach>
                    </div>
                    <%-- </c:if> --%>
                    <!-- 상품 뿌려주는 곳 끝 -->

                    <!-- 페이지 (페이징 처리) 시작 -->
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="product__pagination">
                               <c:if test="${prodDTO.startPage > prodDTO.pageBlock }">
									<a href="${pageContext.request.contextPath }
									/product/shop?pageNum=${prodDTO.startPage - prodDTO.pageBlock}">&lt; &lt;</a>
									</c:if>
									<c:forEach var="i" begin="${prodDTO.startPage }" end="${prodDTO.endPage }" step="1">
									<a class="active" href="${pageContext.request.contextPath }/product/shop?pageNum=${i}">${i}</a>
									</c:forEach>
									<c:if test="${prodDTO.endPage < prodDTO.pageCount }">
									<a href="${pageContext.request.contextPath }
									/product/shop?pageNum=${prodDTO.startPage + prodDTO.pageBlock}">&gt; &gt;</a>
								</c:if>
                            </div>
                        </div>
                    </div>
                    <!-- 페이지 (페이징 처리) 끝 -->

                </div>
            </div>
        </div>
    </section>
    <!-- Shop Section End -->



    <!-- Footer -->
    <jsp:include page="../inc/footer.jsp"/>
</body>

</html>