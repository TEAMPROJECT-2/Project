/**
 *
 */

//전체체크시작

$(function(){debugger;
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
	var sendUrl = "delete";   // Controller로 보내는 URL Controller에 /delete로 전송되고 매핑함
	var valueArr = new Array();
	var list = $("input[name='CheckRow']");
	for(var i =0; i <list.length; i++){
		if(list[i].checked){ // 선택되어 있으면 배열값에 저장
			valueArr.push(list[i].value);
		}
	}
	if (valueArr.length == 0){
		alert("항목을 선택하세요");
	}
	else{
		var chk = confirm("정말 삭제하시겠습니까?");
		$.ajax({
			url : sendUrl,          // 전송 URL
			type : 'POST',       // Post방식
			traditional : true,
			data : {
				valueArr : valueArr   // 보내고자 하는 data 변수 설정
			},
			success: function () {
				location.href="deleteProd";
			},
			error:function(){
				location.href="deleteProd";
			}
		});
	}
}


// 삭제 코드 끝




