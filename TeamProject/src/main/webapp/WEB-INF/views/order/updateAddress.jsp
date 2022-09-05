<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script>
		$("#mainAddress").change(function(mainAddress) {
			if ($("#mainAddress").is(".checked")) {
				$("#YN").val('#Y');
			} else {
				$("#YN").val('#N');
			}
		});
	</script>
	<form class=form-update
		action="${pageContext.request.contextPath }/order/updateAddressPro"
		method="post">
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
										<td><input type="text" id="addressGetNm"
											name="addressGetNm" title=""
											class="input-text w-full removeEmoji" placeholder="받는 분 입력"
											value="${addressDTO.addressGetNm}"></td>
									</tr>

									<tr>
										<th scope="row">주소 <em class="es"><span
												class="blind"></span></em></th>
										<td>
											<div class="input-group">
												<input type="text" id="addressZipcode" name="addressZipcode"
													title="" class="input-text" placeholder="우편번호"
													readonly="readonly" value="${addressDTO.addressZipcode}">
												<span class="input-group-btn"> <a href="#"
													class="btn-ex-white" onclick="sample6_execDaumPostcode()"><span>우편번호
															찾기</span></a>
												</span>
											</div>
											<div class="input-group w-full">
												<input type="text" id="address" name="address" title=""
													class="input-text" placeholder="기본주소" readonly="readonly"
													value="${addressDTO.address}">
											</div>
											<div class="input-group w-full">
												<input type="text" id="addressDetails" name="addressDetails"
													title="" class="input-text removeEmoji" placeholder="상세주소"
													value="${addressDTO.addressDetails}" maxlength="80">
											</div>
										</td>
									</tr>
									<tr>
										<th scope="row">휴대폰 <em class="es"><span
												class="blind"></span></em></th>


										<td>
											<div class="ui-select select-box w135" data-value="">

												<input type="text" id="addressGetPhone"
													name="addressGetPhone" title="" class="input-text"
													value="${addressDTO.addressGetPhone}" maxlength="11"
													onkeydown="return numberOnly(event)"
													onkeyup="removeChar(event)">
											</div>
										</td>
									</tr>
									<tr>
										<th scope="row"></th>
										<td>
											<div class="custom-checkbox">
												<input type="checkbox" id="mainAddress" class="checkbox"
													name="mainAddress" value="${addressDTO.mainAddress}">
												<label for="check-101"> 기본배송지로 등록</label>
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
						<button type="submit" class="btn-basic-lg2 btn-black" onclick="history.back(-1)">
							<span>확인</span>
						</button>
					</div>
				</div>
			</div>
		</div>
	</form>

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


</body>
</html>