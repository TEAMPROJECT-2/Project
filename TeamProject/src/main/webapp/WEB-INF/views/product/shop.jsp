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
var category = "";

function searchProd(comp){
		debugger;
	var pageNum = "1";

	if(comp.tagName == 'A'){
		if(comp.classList.contains('page')){ // page 눌럿을때
			pageNum = comp.getAttribute('data-value');
		} else { // 카테고리 눌렀을 때
			category = comp.id;
		}
	}

	// 검색창
	var srhText = $('#srhText').val();

	$.ajax({
    	url: '${pageContext.request.contextPath }/product/shopAjax',
		type: 'post',
		data : {
			"category":category,
			"srhText":srhText,
			"pageNum":pageNum
		},
		dataType: "json",
		success:function( data ) {
// 			debugger;
			// 상품 뿌려주기
			printProdList(data.prodList);

			// 페이징 처리
			printPaging(data.prodDTO);

		}
	});
}

// 상품 뿌려주기

function printProdList(data){
	$('#prodContainer').empty();
	data.forEach((e, i) => {
// 		debugger;
    // 상품가격의 가독성을 높이기 위해 숫자 3자리마다 콤마(,)를 찍어주도록 처리함
	var prodLPrice = e.prodLPrice;
	var price = prodLPrice.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
	    $('#prodContainer').append(
    		'<div class="col-lg-4 col-md-6 col-sm-6">'
    		+	'<div class="product__item">'
    		+		'<div class="product__item__pic set-bg" style="background-image: url(&quot;undefined&quot;);">'
    		+		'<a href="/web/product/details?prodLNum='+ e.prodLNum +'">'
    		+ 			'<img src="/web/resources/img/product/'+ e.prodLMainimg +'" alt="위의 이미지를 누르면 연결됩니다.">'
    		+ 		'</a>'
    		+ 			'<ul class="product__hover">'
    		+ 			   '<li><a href="#"><img src="/web/resources/img/icon/heart.png" alt=""><span>찜하기</span></a></li>'
    		+ 			   '<li><a href="/web/order/cart"><img src="/web/resources/img/icon/cart.png" alt=""><span>장바구니 담기</span></a></li>'
    		+ 		   '</ul>'
    		+ 		'</div>'
    		+ 		'<div class="product__item__text">'
    		+ 		   '<h7>'+ e.prodLProdnm +'</h7>'
    		+ 		   '<h5>'
    		+ 			price
    		+ 			'원</h5>'
    		+ 			'<div class="rating">'
    		+ 				'<i class="fa fa-star-o"></i> '
    		+ 				'<i class="fa fa-star-o"></i> '
    		+ 				'<i class="fa fa-star-o"></i> '
    		+ 				'<i class="fa fa-star-o"></i> '
    		+ 				'<i class="fa fa-star-o"></i> '
    		+ 			'</div>'
    		+ 		'</div>'
    		+ 	'</div>'
    		+ '</div>'
	    );
	});
}

// 페이징 처리
function printPaging(dto){

	$('#product__pagination').empty();
	var context = '${pageContext.request.contextPath }';

	// << (첫 페이지로 가기)
	if(dto.startPage > dto.pageBlock) {
		var pageNum = dto.startPage - dto.pageBlock
		$('#product__pagination').append('<a class="search page" data-value="' + pageNum + '"  href="#">&lt; &lt;</a> ')
	}

	// for
	for(var i = dto.startPage; i <= dto.endPage; i++){
		$('#product__pagination').append(
				'<a class="active search page" data-value="' + i + '"  href="#">'+ i +'</a> '
		);
	}

	// >> (끝 페이지로 가기)
	if(dto.endPage < dto.pageCount) {
		var pageNum = dto.startPage + dto.pageBlock
		$('#product__pagination').append('<a class="search page" data-value="' + pageNum + '"  href="#">&gt; &gt;</a> ')
	}

	$('.search').click(function(){
		searchProd(this);
	});

}

<!-- 이벤트 시작 -->
// 검색창 이벤트
$(document).ready(function(){
	$('.search').click(function(){
		searchProd(this);
	});
	// 검색창 엔터키 이벤트
	$('#srhText').on("keyup", function(key) {
		if(key.keyCode == 13){
			if($("#srhText").val().length==''){
				alert("검색어를 입력해주세요.");
				$("#srhText").focus();
				return;
			}
			searchProd(this);
		}
	});
	// 검색창 클릭 이벤트
	$('#submit').click(function() {
		if($("#srhText").val().length==''){
			alert("검색어를 입력해주세요.");
			$("#srhText").focus();
			return;
		}
		searchProd(this);
	});
});

// 카테고리 클릭 이벤트
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
	    if($(".sub2").is(":visible")){
	        $(".sub2").slideUp();
	    }
	    else{
	        $(".sub2").slideDown();
	    }
	});
	$(".stuff").click(function(){
	    if($(".sub3").is(":visible")){
	        $(".sub3").slideUp();
	    }
	    else{
	        $(".sub3").slideDown();
	    }
	});
	$(".supplement").click(function(){
	    if($(".sub4").is(":visible")){
	        $(".sub4").slideUp();
	    }
	    else{
	        $(".sub4").slideDown();
	    }
	});
	$(".meal").click(function(){
	    if($(".sub5").is(":visible")){
	        $(".sub5").slideUp();
	    }
	    else{
	        $(".sub5").slideDown();
	    }
	});
});
<!-- 이벤트 끝 -->

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
<%--                 	<form action="${pageContext.request.contextPath }/product/shop"> --%>
                    <div class="shop__sidebar">
                        <div class="shop__sidebar__search">
                                <input type="text" id="srhText" name="srhText">
                                <button type="submit" id="submit" class="search">
                                <span class="icon_search"></span></button>
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
                                               				<li><a class="search" href="#" id="P0101">ㅡ　상의</a></li>
                                               				<li><a class="search" href="#" id="P0102">ㅡ　하의</a></li>
                                               			</ul>
                                               		</li>
                                               		<li><a href="#" id="instrument" class="instrument">기구</a>
                                               			<ul class="sub2" style="display: none">
                                               				<li><a class="search" href="#" id="P0201">ㅡ　덤벨</a></li>
                                               				<li><a class="search" href="#" id="P0202">ㅡ　매트</a></li>
                                               				<li><a class="search" href="#" id="P0203">ㅡ　폼롤러</a></li>
                                               			</ul>
                                               		</li>
                                               		<li><a href="#" id="stuff" class="stuff">잡화</a>
                                               			<ul class="sub3" style="display: none">
                                               				<li><a class="search" href="#" id="P0301">ㅡ　보호대</a></li>
                                               				<li><a class="search" href="#" id="P0302">ㅡ　보틀</a></li>
                                               				<li><a class="search" href="#" id="P0303">ㅡ　가방</a></li>
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
                                                	<li><a href="#" id="supplement" class="supplement">보충제</a>
                                               			<ul class="sub4" style="display: none">
                                               				<li><a href="#" id="protein" id="F0101">ㅡ　프로틴</a></li>
                                               				<li><a href="#" id="booster" id="F0102">ㅡ　부스터</a></li>
                                               				<li><a href="#" id="nutritive" id="F0103">ㅡ　영양제</a></li>
                                               			</ul>
                                               		</li>
                                               		<li><a href="#" id="meal" class="meal">식단</a>
                                               			<ul class="sub5" style="display: none">
                                               				<li><a href="#" id="chicken" id="F0201">ㅡ　닭가슴살</a></li>
                                               				<li><a href="#" id="salad" id="F0202">ㅡ　샐러드</a></li>
                                               				<li><a href="#" id="lunchbox" id="F0203">ㅡ　도시락</a></li>
                                               			</ul>
                                               		</li>
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
<!--                     </form> -->
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
                    <div class="row" id="prodContainer">
                    	<c:forEach var="prodList" items="${prodList}">
                        <div class="col-lg-4 col-md-6 col-sm-6">
                            <div class="product__item">
                                <div class="product__item__pic set-bg">
                                <a href="${pageContext.request.contextPath }/product/details?prodLNum=${prodList.prodLNum}">
									<img src="${pageContext.request.contextPath }/resources/img/product/${prodList.prodLMainimg}" alt="위의 이미지를 누르면 연결됩니다."/>
								</a>
                                    <ul class="product__hover">
                    	 	           <li><a href="#"><img src="${pageContext.request.contextPath }/resources/img/icon/heart.png" alt=""><span>찜하기</span></a></li>
                    		           <li><a href="${pageContext.request.contextPath }/order/cart"><img src="${pageContext.request.contextPath }/resources/img/icon/cart.png" alt=""><span>장바구니 담기</span></a></li>
                                   </ul>
                                </div>
                                <div class="product__item__text">
                                   <h7>${prodList.prodLProdnm}</h7>
                                   <!-- 상품가격의 가독성을 높이기 위해 숫자 3자리마다 콤마(,)를 찍어주도록 처리함 -->
                                   <h5> <fmt:formatNumber value="${prodList.prodLPrice}" pattern="###,###,###원"/></h5>
<%-- 									<h5>${prodList.prodLPrice}원</h5> --%>
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
                    <!-- 상품 뿌려주는 곳 끝 -->

                    <!-- 페이지 (페이징 처리) 시작 -->
                    <div class="row">
                        <div class="col-lg-12">
                            <div id="product__pagination" class="product__pagination">
                               <c:if test="${prodDTO.startPage > prodDTO.pageBlock }">
									<a class="search page" data-value="${prodDTO.startPage - prodDTO.pageBlock}" href="#">&lt; &lt;</a>
									</c:if>
									<c:forEach var="i" begin="${prodDTO.startPage }" end="${prodDTO.endPage }" step="1">
									<a class="active search page" data-value="${i}" href="#">${i}</a>
									</c:forEach>
									<c:if test="${prodDTO.endPage < prodDTO.pageCount }">
									<a class="search page" data-value="${prodDTO.startPage + prodDTO.pageBlock}" href="#">&gt; &gt;</a>
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