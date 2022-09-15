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

	<script>
		function reload() {
			opener.parent.location = '/web/order/checkout';
			// 	opener.parent.location.reload();
			window.close();
		}
	</script>

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

// 		function oneCheckbox(a) {
// 			var obj = document.getElementsByName("mainAddress");
// 			for (var i = 0; i < obj.length; i++) {
// 				if (obj[i] != a) {
// 					obj[i].checked = false;
// 				}
// 			}
// 		}
		
		function YnCheck(obj){
			var checked = obj.checked;
			if(checked){
				obj.value="Y";
			}else{
				obj.value="N";
			}
		};
		
	</script>




<form name="getAddressList" method="get" >

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
				
				
				<form name="sendForm" method="get">           
				<div class="layer-content">
					<div class="inner">
									<c:forEach var="getAddressList" items="${addressDTOList}">
									
										<input type="checkbox" id="mainAddress" name="mainAddress" value="1"
											onclick="oneCheckbox(this)">
											<div class="custom-radio">
												<label for="radio-delivery-20220424000000009691"> <span
													class="name">${addressDTO.addressGetNm}</span> <span
													class="addr-txt">${addressDTO.address}
														&nbsp;${addressDTO.addressDetails}</span>
												</label>
												<p class="tel">${addressDTO.addressGetPhone}</p>
													<a href="javascript:void(0);"
														onclick="resOpenPopup2();return false;"
														class="btn btn-outline-dark">수정</a> 
											</div>
									</c:forEach>
									
													
														
<!-- 													<input type="checkbox" -->
<!-- 														name="mainAddress" value="2" onclick="oneCheckbox(this)">a2 -->
<!-- 														<div class="custom-radio"> -->
<!-- 												<label for="radio-delivery-20220424000000009691"> <span -->
<%-- 													class="name">${addressDTO.addressGetNm}</span> <span --%>
<%-- 													class="addr-txt">${addressDTO.address} --%>
<%-- 														&nbsp;${addressDTO.addressDetails}</span> --%>
<!-- 														</label> -->
<%-- 												<p class="tel">${addressDTO.addressGetPhone}</p> --%>
<!-- 													<a href="javascript:void(0);" -->
<!-- 														onclick="resOpenPopup2();return false;" -->
<!-- 														class="btn btn-outline-dark">수정</a>  -->
<!-- 														</div> -->
														
<!-- 													<input type="checkbox" name="mainAddress" value="3" -->
<!-- 														onclick="oneCheckbox(this)">a3 -->
<!-- 														<div class="custom-radio"> -->
<!-- 												<label for="radio-delivery-20220424000000009691"> <span -->
<%-- 													class="name">${addressDTO.addressGetNm}</span> <span --%>
<%-- 													class="addr-txt">${addressDTO.address} --%>
<%-- 														&nbsp;${addressDTO.addressDetails}</span> --%>
<!-- 														</label> -->
<%-- 												<p class="tel">${addressDTO.addressGetPhone}</p> --%>
<!-- 													<a href="javascript:void(0);" -->
<!-- 														onclick="resOpenPopup2();return false;" -->
<!-- 														class="btn btn-outline-dark">수정</a>  -->
<!-- 														</div> -->

												</div>
									</ul>
											</form>
									<div class="pagination"></div>
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
					</div>
				</div>

				<div class="layer-bottom type-shadow">
					<div class="btn-area">
						<button type="button" class="btn-basic-lg2 btn-black w-full"
							onclick="reload()">
							<span>확인</span>
						</button>
					</div>
				</div>

				<button type="button" class="btn-x-md2 ui-close-pop" title=""
					onclick="closeClick()">
					<i class="ico-x-black"></i><span class="blind">닫기</span>
				</button>
				</div>
				
</form>

	<script>
		function closeClick() {
			window.close();
		}
	</script>



</body>
</body>
</html>