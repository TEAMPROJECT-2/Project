
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.itwillbs.dao.OrderDAO"%>
<%@page import="com.itwillbs.domain.OrderDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<script src="https://code.jquery.com/jquery-3.3.1.min.js" ></script>
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

<script>
	function point(v){
		document.getElementById('usePoint2').innerHTML=v+"원";
		document.getElementById('total2').innerHTML=(${total}-v)+"원"; 		
	}
</script>

<script>
// 포인트사용
function pointUseAll(){
	document.getElementById('textUsePoint').value = ${pointDTO2.pointNow};
}

</script>

	<script type="text/javascript">
		var path = "${pageContext.request.contextPath }";

		$(function() { 
			$("#resTb tbody").append($("#resInfoTr").html()); 

		});

	</script> 


	<script>
	
	function iamport(){
        var amount = '${total}'-$('#textUsePoint').val();
        var discount = "";
        discount += $('#textUsePoint').val();
        var nowPoint = '${pointDTO2.pointNow}' - $('#textUsePoint').val();
        //가맹점 식별코드
        IMP.init('imp27865884');
        IMP.request_pay({
            pg : 'html5_inicis',
            pay_method : 'card',
            merchant_uid : '${memberDTO.userId}' + new Date().getTime(),
            name : '핏티드' , //결제창에서 보여질 이름
            amount : amount, //실제 결제되는 가격
        }, function(rsp) {
           console.log(rsp);
           
           
            if (rsp.success) {
                var msg = '결제가 완료되었습니다.';
                var add = "";
                add += '${addressDTO.address }' + ", " +'${addressDTO.addressDetails }';
				
                alert(msg);
              
                $.ajax({
                    url: "orderComplete",
                   type: "POST",
                   data: { 'ordUser'    		:'${memberDTO.userId}',
	                       'ordGetNm'   		:'${addressDTO.addressGetNm}',
	                       'ordGetAddress' 	   	: add,
	                       'ordGetPhone'    	:'${addressDTO.addressGetPhone }',
	                       'ordDeliveryMessage' : $('#ordDeliveryMessage').val(),
	                       'ordTotalPrice'		:'${total}',
// 	                       'ordNum' 			: merchant_uid,
	                       'ordCouponDc'		: discount,
	                       'pointNow'			: nowPoint,
	                       'pointUsed'			: $('#textUsePoint').val(),
	                       'ordFinalPrice'		: amount,
                       },

                   dataType:"json",
                })
              
                location.href = '${pageContext.request.contextPath}/main/main';
            } else {
              var msg = rsp.error_msg;
              alert(msg);
            }
        });
     }
  </script>
<!--   <script> -->
<%-- //      var point = '${pointDTO2.pointNow}'; --%>
<%-- //      var prePayment = '${prePayment}'; --%>
<!-- //      $(function() { -->
<!-- //         $('#point').val((point * 1).toLocaleString()); -->
<!-- //         $('#textUsePoint').onblur(function() { -->
<!-- //            if($('#textUsePoint').val() - $('#point').val() > 0) { -->
<!-- //               alert('사용 가능 포인트를 초과하였습니다.') -->
<!-- //               $('#point').val(point.toLocaleString()); -->
<!-- //               $('#textUsePoint').val(point); -->
<!-- //               $('#discount').html('0 원'); -->
<!-- //               $('#payment').text(prePayment + ' 원'); -->
<!-- //            } -->
<!-- //            else { -->
<!-- //               if(prePayment - $('#usePoint').val() < 1000) { -->
<!-- //                  alert('최소 결제 금액은 1,000입니다.') -->
<!-- //                  $('#usePoint').val((prePayment - 1000)); -->
<!-- //                  $('#point').val((point - prePayment - 1000).toLocaleString()); -->
<!-- //                  $('#discount').html('- ' + (prePayment -1000 * 1).toLocaleString() + ' 원'); -->
<!-- //                  $('#payment').text('1,000 원'); -->
<!-- //               } -->
<!-- //               else { -->
<!-- //                  $('#point').val((point - $('#usePoint').val()).toLocaleString()); -->
<!-- //                  $('#discount').html('- ' + $('#usePoint').val() + ' 원'); -->
<!-- //                  $('#payment').text((prePayment - $('#usePoint').val()).toLocaleString() + ' 원'); -->
<!-- //               } -->
<!-- //            } -->
<!-- //         }) -->
<!-- //      }) -->
<!--   </script> -->

<!-- <script> -->
 
<!-- //             function itemSum() { -->
<!-- //                 var str = ""; -->
<!-- //                 var sum = 0; -->
<!-- //                 for (var i = 0; i < count; i++) { -->
<!-- //                     if ($(".chkbox")[i].checked == true) { -->
<!-- //                         sum += parseInt($(".chkbox")[i].value); -->
<!-- //                     } -->
<!-- //                 } -->
<!-- //                 $("#total_sum").html(sum + " 원"); -->
<!-- //                 $("#amount").val(sum); -->
<!-- //             } -->
 
<!--         </script> -->

	<!-- 메뉴단 -->
	<jsp:include page="../inc/menu.jsp" />



	<!-- Breadcrumb Section Begin -->
	<section class="breadcrumb-option">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb__text">
						<h4>상품 주문</h4>
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
<!-- 				<form action="#"> -->
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


										<div class="list-head-sub">

											<h3 class="title-list">배송지 정보</h3>

					<c:if test="${addressDTO.address ne null }">
										<form name="updateAddressPro2"
						class=form-update
							action="${pageContext.request.contextPath }/order/updateAddressPro2"
							method="post" >
					</c:if>
                    
                       <c:if test="${addressDTO.address eq null }">
						<form name="insertAddress2" action="${pageContext.request.contextPath }/order/insertAddress2" method="post">
						</c:if>
                        <div class="row">
                          <div class="mb-3 col-md-6">
                            <label for="userNm" class="form-label">받는 분</label>
                            <input class="form-control form-control-lg" type="text" name="addressGetNm" id="addressGetNm" value="${addressDTO.addressGetNm}"/>
                          </div>
                          <div class="mb-3 col-md-6">
                            <label for="userPhone" class="form-label" >연락처</label>
                            <input class="form-control form-control-lg" type="text" name="addressGetPhone" id="addressGetPhone" maxlength="11" value="${addressDTO.addressGetPhone}" />
                          </div>
                          <div class="mb-3 col-md-3">
                            <label for="userNicknm" class="form-label">우편번호</label>
                            <input class="form-control form-control-lg" type="text" name="addressZipcode" id="addressZipcode"  value="${addressDTO.addressZipcode}" readonly/>
                          </div>
                          <div class="mb-3 col-md-7">
                            <label for="userNicknm" class="form-label">주소</label>
                            <input class="form-control form-control-lg" type="text" name="address" id="address"  value="${addressDTO.address}" readonly/>
                          </div>
                          <div class="mb-3 col-md-2">
                          	<button type="button" class="btn btn-outline-primary me-2" onclick="sample6_execDaumPostcode();" style="margin-top: 1.8rem; height:60%">주소 검색</button>
                          </div>
                          <div class="mb-3 col-md-12">
                            <label for="userNicknm" class="form-label">상세주소</label>
                            <input class="form-control form-control-lg" type="text" name="addressDetails" id="addressDetails"  value="${addressDTO.addressDetails}"/>
                          </div>
                        </div>
                        
                        <div class="mt-3" id="mt-3" name="mt-3">
                         <c:if test="${addressDTO.address ne null }">
                          <button type="submit" class="btn btn-primary me-2">배송지 저장</button>
                          <button type="reset" class="btn btn-outline-secondary">취소</button>
                      </form>
                      </c:if>
                      <c:if test="${addressDTO.address eq null }">
                          <button type="submit" class="btn btn-primary me-2">배송지 저장</button>
                          <button type="reset" class="btn btn-outline-secondary">취소</button>
                      </form>
                      </c:if>
                        </div>
                      
                    </div>

								<div class="order-info">
									<div class="list-head">
										<h3 class="title-list">포인트 / 쿠폰 사용</h3>
									</div>
									<!--// list-head -->
									<div class="lineless-table type1">
										<table>
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
																	<input type="number" title=""
																		class="input-text ui-point-input" id="textUsePoint"
																		name="textUsePoint" placeholder="1,000P부터 사용가능"
																		min='1000' max="${pointDTO2.pointNow}" onblur="point(value)">
<!-- 																		onKeyPress="return checkNum(event)" -->
<!-- 																		onkeyup="removeChar(event)" onblur="fnUsePoint()" -->
																	<span class="input-group-btn">
																		<button type="reset" class="btn-x-xs btn-input-del"
																			title=""><span>삭제</span>
																		</button>
																		<button type="button" class="btn-ex-grey"
																			onclick="pointUseAll();">
																			<span>전액사용</span>
																		</button>
																	</span>
																</div>
																<!--// input-group -->
															</div>
															<!--// input-group-wrap -->
															<p class="point-guide">
																사용 가능 포인트 <em class="text-num-bold">${pointDTO2.pointNow}</em>P
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
									<input type="checkbo x" id="ordDeliveryMessage" name="ordDeliveryMessage" placeholder="메세지를 입력하세요."> 
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
									
									<ul class="checkout__total__all">
										<li>할인 금액<span id="usePoint2">0원</span></li>
										<li>Total <span id="total2" >${total }원</span></li>
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

	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		function sample6_execDaumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

							// 각 주소의 노출 규칙에 따라 주소를 조합한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var addr = ''; // 주소 변수

							//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
							if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
								addr = data.roadAddress;
							} else { // 사용자가 지번 주소를 선택했을 경우(J)
								addr = data.jibunAddress;
							}
							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							document.getElementById('addressZipcode').value = data.zonecode;
							document.getElementById("address").value = addr;
							// 커서를 상세주소 필드로 이동한다.
							document.getElementById("addressDetails").value = "";
							document.getElementById("addressDetails").focus();
						}
					}).open();
		}
	</script>

<script type="text/javascript">

  $(function(){

	    $("#addressGetPhone").on('keydown', function(e){
	       // 숫자만 입력받기
	        var trans_num = $(this).val().replace(/-/gi,'');
		var k = e.keyCode;
					
		if(trans_num.length >= 11 && ((k >= 48 && k <=126) || (k >= 12592 && k <= 12687 || k==32 || k==229 || (k>=45032 && k<=55203)) ))
		{
	  	    e.preventDefault();
		}
	    }).on('blur', function(){ // 포커스를 잃었을때 실행합니다.
	        if($(this).val() == '') return;

	        // 기존 번호에서 - 를 삭제합니다.
	        var trans_num = $(this).val().replace(/-/gi,'');
	      
	        // 입력값이 있을때만 실행합니다.
	        if(trans_num != null && trans_num != '')
	        {
	            // 총 핸드폰 자리수는 11글자이거나, 10자여야 합니다.
	            if(trans_num.length==11 || trans_num.length==10) 
	            {   
	                // 유효성 체크
	                var regExp_ctn = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})([0-9]{3,4})([0-9]{4})$/;
	                if(regExp_ctn.test(trans_num))
	                {
	                    // 유효성 체크에 성공하면 하이픈을 넣고 값을 바꿔줍니다.
	                    trans_num = trans_num.replace(/^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?([0-9]{3,4})-?([0-9]{4})$/, "$1-$2-$3");                  
	                    $(this).val(trans_num);
	                }
	                else
	                {
	                    alert("유효하지 않은 전화번호 입니다.");
	                    $(this).val("");
	                    $(this).focus();
	                }
	            }
	            else 
	            {
	                alert("유효하지 않은 전화번호 입니다.");
	                $(this).val("");
	                $(this).focus();
	            }
	      }
	  });  
	});
  </script>

<!-- jQuery -->
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<!-- iamport.payment.js -->
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-{SDK-최신버전}.js"></script>

</html>