<%@page import="java.awt.Window"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>changeAddress</title>
</head>
<body>
<body>

	<script type="text/javascript"
										src="${pageContext.request.contextPath }/resources/js/jquery-3.6.0.js"></script>

	<script type="text/javascript">
		var path = "${pageContext.request.contextPath }";

		$(function() {
			$("#resTb tbody").append($("#resInfoTr").html());

		});

		function resOpenPopup() {
			var pop = window.open("/web/order/newAddress", "resPopup",
					"width=500,height=500, scrollbars=yes, resizable=yes");
			pop.focus();
		}

		function resOpenPopup2() {
			var pop = window.open("/web/order/updateAddress", "resPopup",
					"width=500,height=500, scrollbars=yes, resizable=yes");
			pop.focus();
		}
	</script>






	<div class="layer-wrap onload" id="popup-myAddress"
		style="display: block;">
		<div id="userDeliveryList" class="layer-pop dlv-addr-pop hideLayers"
			style="display: block">
			<div class="layer-inner">
				<div class="layer-head">
					<h4 class="layer-pop-title">배송지 목록</h4>
					<div class="text-center">

						<div class="newAdd">
							<a href="javascript:void(0);"
								onclick="resOpenPopup();return false;"
								class="btn btn-outline-dark">신규 배송지 추가</a>
						</div>
					</div>
				</div>

				<div class="layer-content">
					<div class="inner">
						<div
							class="scroll-area ui-custom-scroll mCustomScrollbar _mCS_2 mCS_no_scrollbar">
							<div id="mCSB_2"
								class="mCustomScrollBox mCS-light mCSB_vertical mCSB_inside"
								style="max-height: none;" tabindex="0">
								<div id="mCSB_2_container"
									class="mCSB_container mCS_y_hidden mCS_no_scrollbar_y"
									style="position: relative; top: 0; left: 0;" dir="ltr">
									<ul class="dlv-addr-list">
										<li>
											<div class="custom-radio">
												<input type="radio" id="radio-delivery-20220424000000009691"
													class="radio" name="vDeliveryid"
													value="20220424000000009691"
													data-v-deliveryid="20220424000000009691"
													data-v-postcd="52822" data-v-addr="경상남도 진주시 가좌길 18-5(가좌동)"
													data-v-addr-dtl="304호" data-v-addr1="" data-v-addr2=""
													data-v-addr3="" data-v-delivery-tel=""
													data-v-delivery-cell="01024012912"
													data-v-delivery-cell1="010"
													data-v-delivery-cell2="24012912" data-v-delivery-nm="김창현"
													data-v-door-access-method-save-yn="N"
													data-v-door-access-method-cd=""
													data-v-door-access-method-memo="" data-v-basic-dlv-yn="Y"
													data-v-express-yn="N" data-v-today-dlv-yn=""
													data-v-dawn-dlv-yn="" data-v-dawn-dlv-alarm-yn=""
													checked="checked"> <label
													for="radio-delivery-20220424000000009691"> <span
													class="name">${memberDTO.userNm}</span>                                           
													<span class="addr-txt">${memberDTO.userAddress} &nbsp;${memberDTO.userAddressDetails}</span>
												</label>
											</div> <!--// custom-radio -->
											<div class="bottom-line">
												<p class="tel">${memberDTO.userPhone}</p>
												<div class="btn-area">
													<a href="javascript:void(0);"
														onclick="resOpenPopup2();return false;"
														class="btn btn-outline-dark">수정</a>



												</div>
											</div> <!--// bottom-line -->
										</li>
									</ul>
									<!--// dlv-addr-list -->
									<!-- paging -->
									<div class="pagination"></div>
									<!--// paging -->
								</div>
								<div id="mCSB_2_scrollbar_vertical"
									class="mCSB_scrollTools mCSB_2_scrollbar mCS-light mCSB_scrollTools_vertical"
									style="display: none;">
									<div class="mCSB_draggerContainer">
										<div id="mCSB_2_dragger_vertical" class="mCSB_dragger"
											style="position: absolute; min-height: 0px; height: 0px; top: 0px;">
											<div class="mCSB_dragger_bar" style="line-height: 0px;"></div>
										</div>
										<div class="mCSB_draggerRail"></div>
									</div>
								</div>
							</div>
						</div>
						<!--// scroll-area -->
					</div>
				</div>
				<!--// layer-content -->

				<div class="layer-bottom type-shadow">
					<div class="btn-area">
						<button type="button" class="btn-basic-lg2 btn-black w-full"
							onclick="addrReturn();">
							<span>확인</span>
						</button>
					</div>
				</div>
				<!--// layer-bottom -->

				<button type="button" class="btn-x-md2 ui-close-pop" title=""
					onclick="closeClick()">
					<i class="ico-x-black"></i><span class="blind">닫기</span>
				</button>
			</div>
			<!--// layer-inner -->
		</div>
		<!--// layer-pop  -->

		<form id="userDeliveryForm" name="userDeliveryForm"
			action="/order/order/userDeliveryList" method="post">
			<input type="hidden" name="vDeliveryid"> <input type="hidden"
				name="vDeliveryCell">
			<!-- ========== 팝업 영역 ========== -->
			<div id="userDeliveryDiv" class="layer-pop dlv-addr-pop hideLayers"
				style="display: none;">
				<div class="layer-inner">
					<div class="layer-head">
						<h4 class="layer-pop-title" id="popTitle"></h4>
					</div>

					<div class="layer-content">
						<div class="inner">
							<div class="lineless-table type2">
								<table>
									<caption>정보 입력</caption>
									<colgroup>
										<col style="width: 70px">
										<col>
									</colgroup>
									<tbody>
										<tr>
											<th scope="row">받는분 <em class="es"><span
													class="blind">필수입력</span></em></th>
											<td><input type="text" name="vDeliveryNm" title=""
												class="input-text w-full removeEmoji" placeholder="받는 분 입력"
												value=""></td>
										</tr>
										<tr>
											<th scope="row">주소 <em class="es"><span
													class="blind">필수입력</span></em></th>
											<td>
												<div class="input-group">
													<input type="text" name="vPostcd" title=""
														class="input-text" placeholder="우편번호" readonly="readonly"
														value=""> <span class="input-group-btn"> <a
														href="#" class="btn-ex-white"
														onclick="openPostSearchForm(1);"><span>우편번호 찾기</span></a>
													</span>
												</div>
												<div class="input-group w-full">
													<input type="text" name="vAddr" title="" class="input-text"
														placeholder="기본주소" readonly="readonly" value="">
												</div>
												<div class="input-group w-full">
													<input type="text" name="vAddrDtl" title=""
														class="input-text removeEmoji" placeholder="상세주소" value=""
														maxlength="80">
												</div>
											</td>
										</tr>
										<tr>
											<th scope="row">휴대폰 <em class="es"><span
													class="blind">필수입력</span></em></th>
											<td>
												<div class="input-group w-full">
													<div class="input-group-form">
														<div class="ui-select select-box w135" data-value="">
															<input type="hidden" name="vDeliveryCell1" value="">
															<a href="#none" title="" class="select-value"><span>010</span></a>
															<div class="select-list">
																<ul>
																	<li data-name="010"><a href="#none"><span>010</span></a></li>
																	<li data-name="011"><a href="#none"><span>011</span></a></li>
																	<li data-name="016"><a href="#none"><span>016</span></a></li>
																	<li data-name="017"><a href="#none"><span>017</span></a></li>
																	<li data-name="018"><a href="#none"><span>018</span></a></li>
																	<li data-name="019"><a href="#none"><span>019</span></a></li>
																</ul>
															</div>
														</div>
													</div>
													<input type="text" name="vDeliveryCell2" title=""
														class="input-text" value="" maxlength="8"
														onkeydown="return numberOnly(event)"
														onkeyup="removeChar(event)">
												</div>
											</td>
										</tr>
										<tr>
											<th scope="row">전화번호</th>
											<td>
												<div class="input-group w-full">
													<input type="text" name="vDeliveryTel" title=""
														class="input-text w-full" value="" maxlength="11"
														onkeydown="return numberOnly(event)"
														onkeyup="removeChar(event)">
												</div>
											</td>
										</tr>
										<tr>
											<th scope="row"></th>
											<td>
												<div class="custom-checkbox">
													<input type="checkbox" id="check-101" class="checkbox"
														name="vBasicDlvYn" value=""> <label
														for="check-101"> 기본배송지로 등록</label>
												</div>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<!--// layer-content -->

					<div class="layer-bottom">
						<div class="btn-area">
							<button type="button" class="btn-basic-lg2 btn-grey3 closeDiv">
								<span>취소</span>
							</button>
							<button type="button" class="btn-basic-lg2 btn-black"
								onclick="save();">
								<span>확인</span>
							</button>
						</div>
					<!--// layer-bottom -->

					<button type="button" class="btn-x-md2 ui-close-pop closeDiv"
						title="" onclick="closeClick()">
						<i class="ico-x-black"></i><span class="blind">닫기</span>
					</button>
				</div>
				<!--// layer-inner -->
			</div>
			<!--// layer-pop -->
			<!-- ========== 팝업 영역 ========== -->
			<div>
				<input type="hidden" name="_csrf"
					value="ef6f43f4-6aed-465c-a3d7-12ff84046ff7">
			</div>
		</form>
		<form id="postSearchForm" name="postSearchForm"
			action="/order/order/userDeliveryList" method="post"
			onsubmit="return false;">
			<input type="hidden" name="resultType" value="json"> <input
				type="hidden" name="pageSize" value="5">
			<div id="jusoDiv" class="searchPop"></div>
			<div>
				<input type="hidden" name="_csrf"
					value="ef6f43f4-6aed-465c-a3d7-12ff84046ff7">
			</div>
		</form>
	</div>



	<script>
		function closeClick() {
			window.close();
		}
	</script>



</body>
</body>
</html>