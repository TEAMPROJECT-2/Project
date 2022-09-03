/**
 *
 */

 // 식품선택시
 $(document).ready(function(){
	$('#select').change(function(){
		//보충제 식단 선택
		var result = $('#select option:selected').val();
		//보충제, 식단 선택
//		var selectFoodDetail = $('#selectFoodDetail option:selected').val();

//		식품을 선택시
		if (result == 'f01') {
			$('.foodF01').show();
		}
		else {
			$('.foodF01').hide();

		}
		if (result == 'f02') {
			$('.foodF02').show();
		}
		else {
			$('.foodF02').hide();

		}
		if (result == 'f0101') {
			$('.foodF0101').show();
		}else {
			$('.foodF0101').hide();

		}
	});
});
// 맛 선택창
$(document).ready(function(){
	$('#select1').change(function(){
		var result = $('#select1 option:selected').val();
		if (result == 'f0101') {
			$('.foodF0101').show();
		}else {
			$('.foodF0101').hide();

		}
	});
});

//용품 선택시

 $(document).ready(function(){
	$('#select2').change(function(){
		//옷,기구,잡화
		var result2 = $('#select2 option:selected').val();
//		옷선택시
		if (result2 == 'p01') {
			$('.prod_p01').show();
			$('.prod_color').show();
			$('.prod_size').show();
		}else {
			$('.prod_p01').hide();
			$('.prod_color').hide();
			$('.prod_size').hide();
		}
		// 기구선택시
		if (result2 == 'p02') {
			$('.prod_p02').show();
		}else {
			$('.prod_p02').hide();
		}
//		잡화 선택시
		if (result2 == 'p03') {
			$('.prod_p03').show();
		}else {
			$('.prod_p03').hide();
		}
		if (result2 == 'p02') {
			$('.prod_p02').show();
		}else {
			$('.prod_p02').hide();
		}
    });
});

