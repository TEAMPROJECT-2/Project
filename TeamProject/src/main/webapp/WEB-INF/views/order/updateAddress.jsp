<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>



	<div class="layer-wrap onload" id="popup-myAddress"
		style="display: block;">
		<div id="userDeliveryList" class="layer-pop dlv-addr-pop hideLayers"
			style="display: none;">
			<div class="layer-inner">
				<div class="layer-head">
					<h4 class="layer-pop-title">배송지 목록</h4>
					<button type="button" class="btn-basic-sm btn-default-ex"
						data-v-deliveryid="new" data-func="defaultForm">
						<i class="ico-plus"></i><span>신규 배송지 추가</span>
					</button>
				</div>

				<div class="layer-content">
					<div class="inner">
						<div
							class="scroll-area ui-custom-scroll mCustomScrollbar _mCS_4 mCS_no_scrollbar">
							<div id="mCSB_4"
								class="mCustomScrollBox mCS-light mCSB_vertical mCSB_inside"
								style="max-height: 520px;" tabindex="0">
								<div id="mCSB_4_container"
									class="mCSB_container mCS_y_hidden mCS_no_scrollbar_y"
									style="position: relative; top: 0; left: 0;" dir="ltr">
									<ul class="dlv-addr-list">
										<li>
											<div class="custom-radio">
												<input type="radio" id="radio-delivery-20220824000001406156"
													class="radio" name="vDeliveryid"
													value="20220824000001406156"
													data-v-deliveryid="20220824000001406156"
													data-v-postcd="47247"
													data-v-addr="부산광역시 부산진구 서전로37번길 25-5(전포동, 세경골든빌)"
													data-v-addr-dtl="403호" data-v-addr1="" data-v-addr2=""
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
													for="radio-delivery-20220824000001406156"> <span
													class="name">김창현</span> <em class="badge-sm-navy">기본배송지</em><em
													class="imgbadge-dlv-normal"> <span class="blind">일반배송</span>
												</em> <span class="addr-txt">부산광역시 부산진구 서전로37번길 25-5(전포동,
														세경골든빌)&nbsp;403호</span>
												</label>
											</div> <!--// custom-radio -->
											<div class="bottom-line">
												<p class="tel">01024012912</p>
												<div class="btn-area">
													<button type="button" class="btn-option btn-default"
														data-v-deliveryid="20220824000001406156"
														data-func="openForm">
														<span>수정</span>
													</button>
												</div>
											</div> <!--// bottom-line -->
										</li>
										<li>
											<div class="custom-radio">
												<input type="radio" id="radio-delivery-20220424000000009691"
													class="radio" name="vDeliveryid"
													value="20220424000000009691"
													data-v-deliveryid="20220424000000009691"
													data-v-postcd="51025"
													data-v-addr="경상남도 김해시 주촌면 천곡로 26(김해센텀두산위브더제니스)"
													data-v-addr-dtl="123-2202" data-v-addr1="" data-v-addr2=""
													data-v-addr3="" data-v-delivery-tel=""
													data-v-delivery-cell="01022302912"
													data-v-delivery-cell1="010"
													data-v-delivery-cell2="22302912" data-v-delivery-nm="ㅇㅇㅇ"
													data-v-door-access-method-save-yn="N"
													data-v-door-access-method-cd=""
													data-v-door-access-method-memo="" data-v-basic-dlv-yn="N"
													data-v-express-yn="N" data-v-today-dlv-yn=""
													data-v-dawn-dlv-yn="" data-v-dawn-dlv-alarm-yn="">
												<label for="radio-delivery-20220424000000009691"> <span
													class="name">ㅇㅇㅇ</span> <em class="imgbadge-dlv-normal">
														<span class="blind">일반배송</span>
												</em> <span class="addr-txt">경상남도 김해시 주촌면 천곡로
														26(김해센텀두산위브더제니스)&nbsp;123-2202</span>
												</label>
											</div> <!--// custom-radio -->
											<div class="bottom-line">
												<p class="tel">01022302912</p>
												<div class="btn-area">
													<button type="button" class="btn-option btn-default"
														data-v-deliveryid="20220424000000009691"
														data-func="openForm">
														<span>수정</span>
													</button>
													<button type="button" class="btn-option btn-default"
														data-v-deliveryid="20220424000000009691" data-func="delt">
														<span>삭제</span>
													</button>
												</div>
											</div> <!--// bottom-line -->
										</li>
									</ul>
									<!--// dlv-addr-list -->
									<!-- paging -->
									<div class="pagination"></div>
									<!--// paging -->
								</div>
								<div id="mCSB_4_scrollbar_vertical"
									class="mCSB_scrollTools mCSB_4_scrollbar mCS-light mCSB_scrollTools_vertical"
									style="display: none;">
									<div class="mCSB_draggerContainer">
										<div id="mCSB_4_dragger_vertical" class="mCSB_dragger"
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
					onclick="closePop();">
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
				style="">
				<div class="layer-inner">
					<div class="layer-head">
						<h4 class="layer-pop-title" id="popTitle">배송지 수정</h4>
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
													class="blind"></span></em></th>
											<td><input type="text" name="vDeliveryNm" title=""
												class="input-text w-full removeEmoji" placeholder="받는 분 입력"
												value="${memberDTO.userNm }"></td>
										</tr>


										<!-- 										<input type="text" id="sample6_postcode" placeholder="우편번호"> -->
										<!-- 										<input type="button" onclick="sample6_execDaumPostcode()" -->
										<!-- 											value="우편번호 찾기"> -->
										<!-- 										<br> -->
										<!-- 										<input type="text" id="sample6_address" placeholder="주소"> -->
										<!-- 										<br> -->
										<!-- 										<input type="text" id="sample6_detailAddress" -->
										<!-- 											placeholder="상세주소"> -->

										<tr>
											<th scope="row">주소 <em class="es"><span
													class="blind"></span></em></th>
											<td>
												<div class="input-group">
													<input type="text" id="sample6_postcode" name="vPostcd"
														title="" class="input-text" placeholder="우편번호"
														readonly="readonly" value=""> <span
														class="input-group-btn"> <a href="#"
														class="btn-ex-white" onclick="sample6_execDaumPostcode()"><span>우편번호
																찾기</span></a>
													</span>
												</div>
												<div class="input-group w-full">
													<input type="text" id="sample6_address" name="vAddr"
														title="" class="input-text" placeholder="기본주소"
														readonly="readonly" value="">
												</div>
												<div class="input-group w-full">
													<input type="text" id="sample6_detailAddress"
														name="vAddrDtl" title="" class="input-text removeEmoji"
														placeholder="상세주소" value="" maxlength="80">
												</div>
											</td>
										</tr>
										<tr>
											<th scope="row">휴대폰 <em class="es"><span
													class="blind"></span></em></th>


											<td>
												<div class="input-group w-full">
													<div class="input-group-form">
														<div class="ui-select select-box w135" data-value="">

															<input type="text" name="vDeliveryCell2" title=""
																class="input-text" value="${memberDTO.userPhone }" maxlength="11"
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
							<button type="button" class="btn btn-outline-dark"
								onclick="history.back(-1)">
								<a href="javascript:history.back(-1)">취소</a>

								<!-- 								<span>취소</span> -->
							</button>
							<button type="button" class="btn-basic-lg2 btn-black"
								onclick="save();">
								<span>확인</span>
							</button>
						</div>
					</div>
					<!--// layer-bottom -->

					<!-- 					<button type="button" class="btn-x-md2 ui-close-pop closeDiv" -->
					<!-- 						title=""> -->
					<!-- 						<i class="ico-x-black"></i><span class="blind">닫기</span> -->
					<!-- 					</button> -->
				</div>
				<!--// layer-inner -->
			</div>
			<!--// layer-pop -->
			<!-- ========== 팝업 영역 ========== -->
			<div>
				<input type="hidden" name="_csrf"
					value="1ad456a8-1a31-48c6-bde8-90787e7bafcc">
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
					value="1ad456a8-1a31-48c6-bde8-90787e7bafcc">
			</div>
		</form>
	</div>

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
							// 							var extraAddr = ''; // 참고항목 변수

							//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
							if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
								addr = data.roadAddress;
							} else { // 사용자가 지번 주소를 선택했을 경우(J)
								addr = data.jibunAddress;
							}

							// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
							// 							if (data.userSelectedType === 'R') {
							// 								// 법정동명이 있을 경우 추가한다. (법정리는 제외)
							// 								// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							// 								if (data.bname !== ''
							// 										&& /[동|로|가]$/g.test(data.bname)) {
							// 									extraAddr += data.bname;
							// 								}
							// 								// 건물명이 있고, 공동주택일 경우 추가한다.
							// 								if (data.buildingName !== ''
							// 										&& data.apartment === 'Y') {
							// 									extraAddr += (extraAddr !== '' ? ', '
							// 											+ data.buildingName
							// 											: data.buildingName);
							// 								}
							// 								// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							// 								if (extraAddr !== '') {
							// 									extraAddr = ' (' + extraAddr + ')';
							// 								}
							// 								// 조합된 참고항목을 해당 필드에 넣는다.
							// 								document.getElementById("sample6_extraAddress").value = extraAddr;

							// 							} else {
							// 								document.getElementById("sample6_extraAddress").value = '';
							// 							}

							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							document.getElementById('sample6_postcode').value = data.zonecode;
							document.getElementById("sample6_address").value = addr;
							// 커서를 상세주소 필드로 이동한다.
							document.getElementById("sample6_detailAddress")
									.focus();
						}
					}).open();
		}
	</script>


</body>
</html>