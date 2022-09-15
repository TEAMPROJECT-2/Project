
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.itwillbs.dao.OrderDAO"%>
<%@page import="com.itwillbs.domain.OrderDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/jsPro/basketListPro.js"></script>
<!DOCTYPE html>
<html>
<head>

</head>
<body>

	<script type="text/javascript">
		var path = "${pageContext.request.contextPath }";

		$(function() {
			$("#resTb tbody").append($("#resInfoTr").html());

		});

		function resOpenPopup() {
			var pop = window.open("/web/order/updateAddress", "resPopup",
					"width=500,height=500, scrollbars=yes, resizable=yes");
		}
	</script>


	<script>
	
	function iamport(){
        
        var amount = '${total}';
        //- '${prePayment}' - $('#usePoint').val();
        //가맹점 식별코드
        IMP.init('imp27865884');
        IMP.request_pay({
            pg : 'html5_inicis',
            pay_method : 'card',
            merchant_uid : '${basketDTO.sbBasketNum}' + new Date().getTime(),
            name : '핏티드' , //결제창에서 보여질 이름
            amount : amount, //실제 결제되는 가격
            buyer_email : '${memberDTO.userEmail}',
            buyer_name : '${memberDTO.userNm}',
            buyer_tel : '${memberDTO.userPhone}',
        }, function(rsp) {
           console.log(rsp);
           
           
//              var reservation = {
//                 reservationNum: rsp.merchant_uid,
//                    checkin: '${date1}',
//                    checkout: '${date2}',
//               paymentPrice: '${prePayment}',
//                    roomNum: '${room.roomNum}',
//                    userid: '${user.userId}',
//                    pensionid: '${pension.pensionid}'
//                    };
                   
            if (rsp.success) {
                var msg = '결제가 완료되었습니다.';
                console.log(reservation);
                alert(msg);
              
                $.ajax({
                    url: "/verifyIamport/" + rsp.imp_uid,
                   type: "POST",
                   headers: { "Content-Type": "application/json" },
                   data: JSON.stringify(reservation),
                   dataType:"json",
                    contentType:"application/json; charset=utf-8"
                })
              
                location.href = '${pageContext.request.contextPath}/mypage/order';
            } else {
              var msg = rsp.error_msg;
              alert(msg);
            }
        });
     }
  </script>
  <script>
     var point = '${user.point}';
     var prePayment = '${prePayment}';
     $(function() {
        $('#point').val((point * 1).toLocaleString());
        $('#usePoint').keyup(function() {
           if($('#usePoint').val() - $('#point').val() > 0) {
              alert('사용 가능 포인트를 초과하였습니다.')
              $('#point').val(point.toLocaleString());
              $('#usePoint').val(0);
              $('#discount').html('0 원');
              $('#payment').text(prePayment + ' 원');
           }
           else {
              if(prePayment - $('#usePoint').val() < 1000) {
                 alert('최소 결제 금액은 1,000입니다.')
                 $('#usePoint').val((prePayment - 1000));
                 $('#point').val((point - prePayment - 1000).toLocaleString());
                 $('#discount').html('- ' + (prePayment -1000 * 1).toLocaleString() + ' 원');
                 $('#payment').text('1,000 원');
              }
              else {
                 $('#point').val((point - $('#usePoint').val()).toLocaleString());
                 $('#discount').html('- ' + $('#usePoint').val() + ' 원');
                 $('#payment').text((prePayment - $('#usePoint').val()).toLocaleString() + ' 원');
              }
           }
        })
     })
  </script>

<script>
 
            function itemSum() {
                var str = "";
                var sum = 0;
                for (var i = 0; i < count; i++) {
                    if ($(".chkbox")[i].checked == true) {
                        sum += parseInt($(".chkbox")[i].value);
                    }
                }
                $("#total_sum").html(sum + " 원");
                $("#amount").val(sum);
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
									</div>
									<!--// 회원일때 -->


									<form name="fr123" action="#">
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
															<td><input type=text name="addressGetNm123"
																value="${addressDTO.addressGetNm}"></td>
														</tr>
														<tr>
															<th scope="row">주소</th>
															<td>${addressDTO.address}
																&nbsp;${addressDTO.addressDetails}</td>
														</tr>
														<tr>
															<th scope="row">휴대전화</th>
															<td>${addressDTO.addressGetPhone}</td>
														</tr>
													</tbody>
												</table>
											</div>
									</form>

									<div class="text-center">
										<a href="javascript:void(0);"
											onclick="resOpenPopup();return false;"
											class="btn btn-outline-primary">배송지 수정</a>
									</div>
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
																		name="textUsePoint" placeholder="1,000P부터 사용가능"
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
																사용 가능 포인트 <em class="text-num-bold">${pointDTO.pointNow}</em>P
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
																사용 가능한 쿠폰 <em class="text-num-bold" id="userCouponCount">0</em>개
															</p>
														</div> <!--// order-point -->
													</td>
												</tr>
											</tbody>
										</table>
									</div>
									<!--// lineless-table -->
								</div>


								<div class="checkout__input">
									<p>
										배송시 요구사항<span>*</span>
									</p>
									<input type="checkbo x" placeholder="메세지를 입력하세요."> 
								</div>
							</div>



							<div class="col-lg-4 col-md-6">
								<div class="checkout__order">
									<h4 class="order__title">주문 정보</h4>
									<div class="checkout__order__products">
										Product <span>Total</span>
									</div>


									<c:forEach items="${basketList }" var="basketDTO"
										varStatus="status">
										<ul class="checkout__total__products">
											<li>${basketDTO.sbProdNm }${basketDTO.sbCount }개<span>${basketDTO.sbProdPrice }원</span></li>
											<li>${basketDTO.sbProdPrice *basketDTO.sbCount }원</li>
										</ul>
									</c:forEach>
									
									
			
									<c:set var = "total" value = "0" />

									<c:forEach var="basketDTO" items="${basketList}" varStatus="status">     
									
									<c:set var= "total" value="${total + (basketDTO.sbProdPrice *basketDTO.sbCount)}"/>
									
									</c:forEach>
									
									
									
									
									
									<ul class="checkout__total__all">
										<li>할인 금액<span>0000원</span></li>
										<li>Total <span>${total}원</span></li>
									</ul>
									
<!-- 									<div class="checkout__input__checkbox"> -->
<!-- 										<label for="payment"> 신용카드/무통장입금 사항 선택해도 되고 <input -->
<!-- 											type="checkbox" id="payment"> <span class="checkmark"></span> -->
<!-- 										</label> -->
<!-- 									</div> -->
<!-- 									<div class="checkout__input__checkbox"> -->
<!-- 										<label for="paypal"> 개인정보 어쩌구에 동의하는지 해도 될듯 <input -->
<!-- 											type="checkbox" id="paypal"> <span class="checkmark"></span> -->
<!-- 										</label> -->
<!-- 									</div> -->
<!-- 									<button type="submit" class="site-btn">결제</button> -->
									<button type="button" onclick="iamport();">결제하기</button>
									</div>
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