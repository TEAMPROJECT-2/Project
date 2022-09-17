/**
 *
 */

$(document).ready(function(){
itemTotal(); // 전체 합계
myCoupon(); // 쿠폰 선택

// 주문시 선택항목 없으면 경고창
$('#orderChk').on("click",function (){

	var valueArr = new Array();   // valueArr에 체크된 데이터가 배열로 저장
	var list = $("input[name='CheckRow']"); // list는 CheckRow(그페이지에 있는 행수)가 저장됨
	for(var i =0; i <list.length; i++){ // 그페이지에 있는 행수 만큼 for문을 돌리되
		if(list[i].checked){            // 선택되어 있으면 배열값에 저장
			valueArr.push(list[i].value);
		}
	}

	if (valueArr.length == 0){ //valueArr길이가 0이면 경고창
		alert("항목을 선택하세요");
		return false;

	}


}); // #orderChk


}); // documnet



function myCoupon(){
 var sbUser = $('#sbUser').val();
 $('.nice-select').hide();
 $('#myCouponList').show();
	$.ajax({
        	url: "/web/order/myCoupon",
			type: "post",
			data : {'couUserNm':sbUser},
			dataType: "json",
			async: false,
			success:function( data ) {
				if(data.code=="S") {
					$('#myCouponList').append("<option value='0_0'>" + "선택" + "</option>");
					var codeList = data.couponList;
				      for(var i = 0; i < codeList.length ; i++){
				        var option = "<option value='" + codeList[i].couNumCouDc + "'>" + codeList[i].couNm + "</option>";
				        $('#myCouponList').append(option);
				      }
				} else {
					alert("ERROR : Common Code");
				}
			}
		}); // ajax
}


function itemTotal() {

	//전체 합계
	var sbProdPrice = $("input[name='sbProdPrice']");
	var sbCount = $("input[name='sbCount']");
	var sum = 0;
	var count = sbProdPrice.length;
	var itemDC = 0;
	var prodLQuantity = $("input[name='prodLQuantity']");


	//전체합계
	for (var i = 0; i < count; i++){

	  if(prodLQuantity[i].value !=0){ // 품절 상품 아닌것만 더하기
		sum += parseInt(sbProdPrice[i].value) * parseInt(sbCount[i].value);
	  }

	}
	var sum = new Intl.NumberFormat('ko-KR', { style: 'currency', currency: 'KRW' }).format(sum);
	var itemDC = new Intl.NumberFormat('ko-KR', { style: 'currency', currency: 'KRW' }).format(itemDC);
	$("#itemTotalPrice").html(sum); // 총합표시
	$("#itemDcPrice").html(itemDC); // 할인가격 표시



}



//전체체크시작

$(function(){
	var chkObj = document.getElementsByName("CheckRow");
	var rowCnt = chkObj.length;

	$("input[name='allCheck']").click(function(){
		var chk_listArr = $("input[name='CheckRow']");
		for (var i=0; i<chk_listArr.length;i++){
			chk_listArr[i].checked = this.checked;
		}
	});
	$("input[name='CheckRow']").click(function(){

			if($("input[name='RowCheck']:checked").length == rowCnt){
				$("input[name='allCheck']")[0].checked =true;
			}
			else {
				$("input[name='allCheck']")[0].checked = false;
			}
	});
});

// 전체 체크 끝


// 삭제 코드 시작
function deleteValue(){
	var sendUrl = "delete";       // Controller로 보내는 URL Controller에 /delete로 전송되고 매핑함
	var valueArr = new Array();   // valueArr에 체크된 데이터가 배열로 저장
	var list = $("input[name='CheckRow']"); // list는 CheckRow(그페이지에 있는 행수)가 저장됨
	for(var i =0; i <list.length; i++){ // 그페이지에 있는 행수 만큼 for문을 돌리되
		if(list[i].checked){            // 선택되어 있으면 배열값에 저장
			valueArr.push(list[i].value);
		}
	}



	if (valueArr.length == 0){ //valueArr길이가 0이면 경고창
		alert("항목을 선택하세요");

	}
	else{
		var chk = confirm("정말 삭제하시겠습니까?"); //chk가 boolean타입으로 선택가능
		if(chk){ //chk가 true면 if문으로 들어옴
		$.ajax({
			type : 'POST',       // Post방식
			url : sendUrl,          // 전송 URL
			traditional : true,		// ajax 배열 넘기기 옵션
			data : {
				valueArr : valueArr   // 보내고자 하는 data 변수 설정
			},
			success: function (rdata) {
				if(rdata == 1) {
				 location.href="cart";
				}else {
					alert("삭제 실패");
				}

			},
			error:function(){

				alert("에러");
			}
		}); // ajax
		} else {
			location.href="cart";
		}

	}
}


// 삭제 코드 끝


//수량 수정 디비 저장
function updateValue(index){
	var url = "/web/order/update";

	var vol = $('#select_vol_'+index).val();
	var sbProdCode = $('#sbProdCode_'+index).val();
	var sbUser = $('#sbUser').val();

	$.ajax({
			type : 'POST',       // Post방식
			url : url,          // 전송 URL
			traditional : true,		// ajax 배열 넘기기 옵션
			data : {
				'sbCount' : vol,
				'sbProdCode': sbProdCode,
				'sbUser' : sbUser                 // 보내고자 하는 data 변수 설정
			}

		}); // ajax
}





