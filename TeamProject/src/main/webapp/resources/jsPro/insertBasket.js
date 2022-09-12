/**
 *
 */






$(document)
			.ready(
					function() {

					$("#insertBasket ").on("click",function(){

						var str = "$('#prodnm').val()";
						console.log(str);

						debugger;

						var obj = {
							price : "${prodDTO.prodLPrice}",
							name : "${details.prodLCode}"
						};
						console.log(obj);
						alert(obj);



						$
							.ajax({
										type : "POST",
										url : "/main/cart",
										dataType : "json",
										data : {
											'cart_option_no' : item_optionValue,
											'cart_option_content' : item_optionContent,
											'cart_item_no' : item_no
										},
//										error : function(
//												request,
//												status, error) {
//											alert("code:"
//													+ request.status
//													+ "\n"
//													+ "message:"
//													+ request.responseText
//													+ "\n"
//													+ "error:"
//													+ error);
//										},
										success : function(data) {

											if (data == 1) {
												cartHeaderView();
												toastr.options.preventDuplicates = true;

												toastr
														.success("장바구니 추가완료");
											} else if (data == 2) {
												toastr.options.preventDuplicates = true;

												toastr
														.warning("이미 추가 된 상품입니다");
											}

										}







					});

			  });
