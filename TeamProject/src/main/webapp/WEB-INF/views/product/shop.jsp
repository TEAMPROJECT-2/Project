<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

<!-- 상품 소감(댓글) 목록
<script>
   var gdsNum = ${view.gdsNum};
   $.getJSON("/shop/view/replyList" + "?n=" + gdsNum, function(data){
    var str = "";

    $(data).each(function(){

     console.log(data);

     var repDate = new Date(this.repDate);
     repDate = repDate.toLocaleDateString("ko-US")

     str += "<li data-gdsNum='" + this.gdsNum + "'>"
       + "<div class='userInfo'>"
       + "<span class='userName'>" + this.userName + " "
       + "<span class='date'>" + repDate + " "
       + "</div>"
       + "<div class='replyContent'>" + this.repCon + "</div>"
       + "</li>";
    });

    $("section.replyList ol").html(str);
   });
</script>
 -->

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

<!-- ------------ JQUERY 게시판 버튼형 카테고리 구현 ------------ -->
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">


$(function(){
	var one;
	var two;
	var three;
	var four;

    $("#clothes").on('click',function(){
        var one = $(this).val();       //버튼이 클릭 되었을 시, 개별 버튼의 값이 kind 변수에 담겨집니다.
        $.ajax({
        	url: "/web/common/selectOptionList",
			type: "post",
			data : {"srhHighCd":one},
			dataType: "json",
			async: false,
			success:function( data ) {
				if(data.code=="S") {
					$('#div2').show();
					$('#prodLOption2').show();
					$('#prodLOption2').append("<option>" + "선택" + "</option>");
					var codeList = data.commonList;
				      for(var i = 0; i < codeList.length ; i++){
				        var option = "<option value='" + codeList[i].cdOpt + "'>" + codeList[i].cdOptNm + "</option>";
				        $('#prodLOption2').append(option);
				      }
				} else {
					alert("ERROR : Common Code");
				}
			}
		});
    });


	$('#prodLOption2').change(function () {
        two = this.options[this.selectedIndex].value;
        $('#div3').hide(); //숨김
        $('#prodLOption3').empty(); //초기화
        $('#div4').hide(); //숨김
        $('#prodLOption4').empty(); //초기화
        $('#div5').hide(); //숨김
        $('#prodLOption5').empty(); //초기화
        $.ajax({
        	url: "/web/common/selectOptionList",
			type: "post",
			data : {"srhHighCd":two},
			dataType: "json",
			async: false,
			success:function( data ) {
				if(data.code=="S") {
					$('#div3').show();
					$('#prodLOption3').show();
					$('#prodLOption3').append("<option>" + "선택" + "</option>");
					var codeList = data.commonList;
				      for(var i = 0; i < codeList.length ; i++){
				        var option = "<option value='" + codeList[i].cdOpt + "'>" + codeList[i].cdOptNm + "</option>";
				        $('#prodLOption3').append(option);
				      }
				} else {
					alert("ERROR : Common Code");
				}
			}
		});
    });

	$('#prodLOption3').change(function () {
		three = this.options[this.selectedIndex].value;
		if(three=="P0101" || three=="P0102" || three=="F0101" || three=="F0102" || three=="F0103"){
			if(three=="P0101" || three=="P0102"){
				three="COLOR";
			}else if(three=="F0101" || three=="F0102" || three=="F0103"){
				three="TASTE";
			}else{
				three="";
			}
	        $('#div4').hide(); //숨김
	        $('#prodLOption4').empty(); //초기화
	        $('#div5').hide(); //숨김
	        $('#prodLOption5').empty(); //초기화
	        $.ajax({
	        	url: "/web/common/selectOptionList",
				type: "post",
				data : {"srhHighCd":three},
				dataType: "json",
				async: false,
				success:function( data ) {
					if(data.code=="S") {
						$('#div4').show();
						$('#prodLOption4').show();
						$('#prodLOption4').append("<option>" + "선택" + "</option>");
						var codeList = data.commonList;
					      for(var i = 0; i < codeList.length ; i++){
					        var option = "<option value='" + codeList[i].cdOpt + "'>" + codeList[i].cdOptNm + "</option>";
					        $('#prodLOption4').append(option);
					      }
					} else {
						alert("ERROR : Common Code");
					}
				}
			});
		}
    });

	$('#prodLOption4').change(function () {
		if(three=="COLOR"){
			four = "SIZE";
	        $('#div5').hide(); //숨김
	        $('#prodLOption5').empty(); //초기화
	        $.ajax({
	        	url: "/web/common/selectOptionList",
				type: "post",
				data : {"srhHighCd":four},
				dataType: "json",
				async: false,
				success:function( data ) {
					if(data.code=="S") {
						$('#div5').show();
						$('#prodLOption5').show();
						$('#prodLOption5').append("<option>" + "선택" + "</option>");
						var codeList = data.commonList;
					      for(var i = 0; i < codeList.length ; i++){
					        var option = "<option value='" + codeList[i].cdOpt + "'>" + codeList[i].cdOptNm + "</option>";
					        $('#prodLOption5').append(option);
					      }
					} else {
						alert("ERROR : Common Code");
					}
				}
			});
		}
    });

});

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
                            <form action="#">
                                <input type="text" placeholder="Search...">
                                <button type="submit"><span class="icon_search"></span></button>
                            </form>
                        </div>
                        <div class="shop__sidebar__accordion">
                            <div class="accordion" id="accordionExample">
                                <div class="card">
                                    <div class="card-heading">
                                        <a data-toggle="collapse" data-target="#collapseOne">Categories</a>
                                    </div>
                                    <!-- 상품 카테고리 -->
                                    <div id="collapseTwo" class="collapse show" data-parent="#accordionExample">
                                        <div class="card-body">
                                            <div class="shop__sidebar__categories">
                                                <ul class="nice-scroll">
                                                	<label for="defaultSelect" class="form-label" >종류</label>
                                               		<li><a href="javascript:clothes();">운동용품</a></li>
                                                    <li><a href="javascript:top();">식품</a></li>

                                                    <li><a href="javascript:clothes();">옷 (갯수)</a></li>
                                                    <li><a href="javascript:top();">상의 (갯수)</a></li>
                                                    <li><a href="javascript:bottoms();">하의 (갯수)</a></li>

                                                    <li><a href="javascript:instrument();">기구 (갯수)</a></li>
                                                    <li><a href="javascript:dumbbell();">덤벨 (갯수)</a></li>
                                                    <li><a href="javascript:mat();">매트 (갯수)</a></li>
                                                    <li><a href="javascript:roller();">폼롤러 (갯수)</a></li>

                                                    <li><a href="javascript:stuff();">잡화 (갯수)</a></li>
                                                    <li><a href="javascript:protector();">보호대 (갯수)</a></li>
                                                    <li><a href="javascript:bottle();">보틀 (갯수)</a></li>
                                                   	<li><a href="javascript:bag();">가방 (갯수)</a></li>

                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
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
                                <div class="card">
                                    <div class="card-heading">
                                        <a data-toggle="collapse" data-target="#collapseFour">Size</a>
                                    </div>
                                    <div id="collapseFour" class="collapse show" data-parent="#accordionExample">
                                        <div class="card-body">
                                            <div class="shop__sidebar__size">
                                                <label for="xs">XS
                                                    <input type="radio" id="xs">
                                                </label>
                                                <label for="sm">S
                                                    <input type="radio" id="sm">
                                                </label>
                                                <label for="md">M
                                                    <input type="radio" id="md">
                                                </label>
                                                <label for="xl">L
                                                    <input type="radio" id="xl">
                                                </label>
                                                <label for="2xl">XL
                                                    <input type="radio" id="2xl">
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
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
                    <div class="row">
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

                    <div class="row">
                        <div class="col-lg-12">
                            <div class="product__pagination">
                               <c:if test="${prodDTO.startPage > prodDTO.pageBlock }">
									<a href="${pageContext.request.contextPath }
									/product/shop?prodLNum=${prodDTO.startPage - prodDTO.pageBlock}">&lt; &lt;</a>
									</c:if>
									<c:forEach var="i" begin="${prodDTO.startPage }" end="${prodDTO.endPage }" step="1">
									<a class="active" href="${pageContext.request.contextPath }/product/shop?prodLNum=${i}">${i}</a>
									</c:forEach>
									<c:if test="${prodDTO.endPage < prodDTO.pageCount }">
									<a href="${pageContext.request.contextPath }
									/product/shop?prodLNum=${prodDTO.startPage + prodDTO.pageBlock}">&gt; &gt;</a>
									</c:if>
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