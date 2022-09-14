/**
 *
 */

$(document).ready(function(){
itemTotal(); // 전체 합계

});



function itemTotal() {
	//전체 합계
	var sbProdPrice = $("input[name='sbProdPrice']");
	var sbCount = $("input[name='sbCount']");
	var sum = 0;
	var count = sbProdPrice.length;
	var itemcount = 0;
	var prodLQuantity = $("input[name='prodLQuantity']");


	//전체합계
	for (var i = 0; i < count; i++){

	  if(prodLQuantity[i].value !=0){ // 품절 상품 아닌것만 더하기
		sum += parseInt(sbProdPrice[i].value) * parseInt(sbCount[i].value);
		itemcount += parseInt(sbCount[i].value);
	  }

	}
	var summ = new Intl.NumberFormat('ko-KR', { style: 'currency', currency: 'KRW' }).format(sum);

	$("#itemTotalPrice").html(summ);
	$("#itemTotalVol").html(itemcount);



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







