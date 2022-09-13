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
	//전체합계
	for (var i = 0; i < count; i++){

		sum += parseInt(sbProdPrice[i].value) * parseInt(sbCount[i].value);
		itemcount += parseInt(sbCount[i].value);
	}
	var summ = new Intl.NumberFormat('ko-KR', { style: 'currency', currency: 'KRW' }).format(sum);



	$("#itemTotalPrice").html(summ);
	$("#itemTotalVol").html(itemcount);
}