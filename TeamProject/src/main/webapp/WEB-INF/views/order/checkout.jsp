
<%@page import="com.itwillbs.dao.OrderDAO"%>
<%@page import="com.itwillbs.domain.OrderDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
</head>
<body>

	<script type="text/javascript">
    var path = "${pageContext.request.contextPath }";
 
    $(function(){
        $("#resTb tbody").append($("#resInfoTr").html());


    });
    
    function resOpenPopup(){
        var pop = window.open("/web/order/changeAddress","resPopup","width=500,height=500, scrollbars=yes, resizable=yes"); 
        pop.focus();
    }
        
</script>

	<script>
	<!-- 결제 -->
   	  var IMP = window.IMP; // 생략 가능
   	    IMP.init("imp62740061"); // 예: imp00000000
	
   	    IMP.request_pay({
   	      /* ...중략... */
   	    }, function (rsp) { // callback
   	      if (rsp.success) { // 결제 성공 시: 결제 승인 또는 가상계좌 발급에 성공한 경우
   	        // jQuery로 HTTP 요청
   	        jQuery.ajax({
   	            url: "{서버의 결제 정보를 받는 endpoint}", // 예: https://www.myservice.com/payments/complete
   	            method: "POST",
   	            headers: { "Content-Type": "application/json" },
   	            data: {
   	                imp_uid: rsp.imp_uid,
   	                merchant_uid: rsp.merchant_uid
   	            }
   	        }).done(function (data) {
   	          // 가맹점 서버 결제 API 성공시 로직
   	        })
   	      } else {
   	        alert("결제에 실패하였습니다. 에러 내용: " +  rsp.error_msg);
   	      }
   	    });
	
  
    function requestPay() {
      // IMP.request_pay(param, callback) 결제창 호출
      IMP.request_pay({ // param
          pg: "html5_inicis",
          pay_method: "card",
          merchant_uid: "ORD20180131-0000011",
          name: "노르웨이 회전 의자",
          amount: 64900,
          buyer_email: "gildong@gmail.com",
          buyer_name: "홍길동",
          buyer_tel: "010-4242-4242",
          buyer_addr: "서울특별시 강남구 신사동",
          buyer_postcode: "01181"
      }, function (rsp) { // callback
          if (rsp.success) {
              ...,
              // 결제 성공 시 로직,
              ...
          } else {
              ...,
              // 결제 실패 시 로직,
              ...
          }
      });
    }
    
    
  </script>


	<!-- 메뉴단 -->
	<jsp:include page="../inc/menu.jsp" />




	<!-- Breadcrumb Section Begin -->
	<section class="breadcrumb-option">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb__text">
						<h4>Check Out</h4>
						<div class="breadcrumb__links">
							<a href="./index.html">Home</a> <a href="./shop.html">Shop</a> <span>Check
								Out</span>
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



							<div class="checkout__input">

								<div class="order-info" id="orderUserInfo">
									<div class="list-head">
										<h3 class="title-list">주문자 정보</h3>
									</div>
									<!--// list-head -->




									<script type="text/javascript"
										src="${pageContext.request.contextPath }/resources/js/jquery-3.6.0.js"></script>
									<!-- 회원일때 -->
									<div class="order-address">
										<ul class="info-txt">
											<li>아이디 : ${sessionScope.userId }</li>
											<li>성함 :${memberDTO.userNm }</li>
											<li>이메일 :${memberDTO.userEmail}</li>
										</ul>
										<button type="button" class="btn btn-outline-primary">
											<a href="/web/mypage/modify" class="text-primary"><span>주문자
													정보변경</span><i class="ico-arr-right"></i></a>
										</button>
										<input type="hidden" name="orderName" value="김창현"> <input
											type="hidden" name="orderCell" value="01024012912"> <input
											type="hidden" name="orderEmail" value="2912rla@gmail.com">
									</div>
									<!--// 회원일때 -->
									<div class="list-head-sub">
										<h3 class="title-list">배송지 정보</h3>


										<!-- 회원일때 -->
										<div class="aaaaaaaaaaaaaaaaaaaaa">


											<table>
												<colgroup>
													<col style="width: 115px">
													<col>
												</colgroup>
												<tbody>
													<tr>
														<th scope="row">받는분</th>
														<td>${addressDTO.addressGetNm}</td>
													</tr>
													<tr>
														<th scope="row">주소</th>
														<td>${addressDTO.address} &nbsp;${addressDTO.addressDetails}</td>
													</tr>
													<tr>
														<th scope="row">휴대전화</th>
														<td>${addressDTO.addressGetPhone}</td>
													</tr>
												</tbody>
											</table>
										</div>

										<div class="text-center">
											<a href="javascript:void(0);"
												onclick="resOpenPopup();return false;"
												class="btn btn-outline-primary">배송지 관리</a>
										</div>

										<!-- 										<button type="button" class="btn btn-outline-primary"> -->
										<!-- 											<a -->
										<%-- 												href="${pageContext.request.contextPath }/order/changeAddress" --%>
										<!-- 												class="btn-basic-sm2 btn-default" -->
										<!-- 												onclick="openUserDeliveryListPop();"><span>배송지변경</span><i -->
										<!-- 												class="ico-arr-right"></i></a> -->
										<!-- 										</button> -->
									</div>


									<div class="order-info">
										<div class="list-head">
											<h3 class="title-list">포인트 / 쿠폰 사용</h3>
										</div>
										<!--// list-head -->
										<div class="lineless-table type1">
											<table>
												<caption>쿠폰/할인 사용</caption>
												<colgroup>
													<col style="width: 190px">
													<col>
												</colgroup>
												<tbody>
													<tr>
														<th scope="row"><span class="tit">포인트 사용</span></th>
														<td>
															<div class="order-point">
																<div class="input-group-wrap box-type">
																	<div class="input-group">
																		<!-- 현재 보유 포인트 -->
																		<input type="hidden" id="currentPoint"
																			name="currentPoint" value="0"> <input
																			type="hidden" id="usePoint" name="usePoint" value="0">
																		<input type="text" title=""
																			class="input-text ui-point-input" id="textUsePoint"
																			name="textUsePoint" placeholder="2,000P부터 사용가능"
																			onkeydown="return numberOnly(event)"
																			onkeyup="removeChar(event)" onblur="fnUsePoint()">
																		<span class="input-group-btn">
																			<button type="button" class="btn-x-xs btn-input-del"
																				title="">
																				<i class="ico-x-normal"></i><span class="blind">삭제</span>
																			</button>
																			<button type="button" class="btn-ex-grey"
																				onclick="fnUsePoint('all')">
																				<span>전액사용</span>
																			</button>
																		</span>
																	</div>
																	<!--// input-group -->
																</div>
																<!--// input-group-wrap -->
																<p class="point-guide">
																	사용 가능 포인트 <em class="text-num-bold">0</em>P
																</p>
															</div> <!--// order-point -->
														</td>
													</tr>
													<tr>
														<th scope="row"><span class="tit">쿠폰 사용</span></th>
														<td>
															<div class="order-point">
																<div class="input-group-wrap box-type">
																	<div class="input-group">
																		<input type="text" title="" class="input-text"
																			id="text_use_coupon" readonly=""> <input
																			type="hidden" name="cartCouponid"> <input
																			type="hidden" name="orderCouponOwnid"> <input
																			type="hidden" name="orderCouponCd"> <input
																			type="hidden" name="deliveryCouponOwnid"> <input
																			type="hidden" name="deliveryCouponCd"> <span
																			class="input-group-btn"> <a
																			href="#popup-coupon"
																			class="btn-ex-grey cpn_select_btn"><span>쿠폰선택</span></a>
																		</span>
																	</div>
																	<!--// input-group -->
																</div>
																<!--// input-group-wrap -->
																<p class="point-guide">
																	사용 가능한 쿠폰 <em class="text-num-bold"
																		id="userCouponCount">0</em>개
																</p>
															</div> <!--// order-point -->
														</td>
													</tr>
												</tbody>
											</table>
										</div>
										<!--// lineless-table -->
									</div>



									<button onclick="requestPay()">결제하기</button>






									<div class="checkout__input">
										<p>
											배송시 요구사항<span>*</span>
										</p>
										<input type="checkbo x" placeholder="메세지를 선택하세요."> <input
											type="text" placeholder="체크박스로 해도 될듯">
									</div>
								</div>



								<div class="col-lg-4 col-md-6">
									<div class="checkout__order">
										<h4 class="order__title">주문 정보</h4>
										<div class="checkout__order__products">
											Product <span>Total</span>
										</div>
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
											<label for="payment"> 신용카드/무통장입금 사항 선택해도 되고 <input
												type="checkbox" id="payment"> <span
												class="checkmark"></span>
											</label>
										</div>
										<div class="checkout__input__checkbox">
											<label for="paypal"> 개인정보 어쩌구에 동의하는지 해도 될듯 <input
												type="checkbox" id="paypal"> <span class="checkmark"></span>
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
	<jsp:include page="../inc/footer.jsp" />
</body>


<!-- jQuery -->
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<!-- iamport.payment.js -->
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-{SDK-최신버전}.js"></script>

</html>