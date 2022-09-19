/**
 *
 */

 $(document).ready(function() {
	delivNumberAdd();
});
function delivNumberAdd() {
	var optionIndex = 1;
	$('button[id^=delivNumberAdd_btn_')
			.on(
					"click",
					function() {

						$(this).next().html(
										"  <div class='form-group'><input placeholder='송장번호와 택배사' class='form-control' type='text' style='float:left;' id='ordLDelivNumber' name='ordLDelivNumber' >"
												+ "<button type='submit' class='btn btn-primary ' >" + "입력"+"</button></div>"

								);

					});
}