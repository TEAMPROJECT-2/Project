<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>charge.jsp</title>
<style>
span {
	width: 70px;
	display: inline-block;
}

</style>
</head>
<body>
<h2>포인트 충전</h2>
				<label class="box-radio-input"><input type="radio" name="cp_item" value="1000"><span>1,000원</span></label>
                <label class="box-radio-input"><input type="radio" name="cp_item" value="5000"><span>5,000원</span></label>
                <label class="box-radio-input"><input type="radio" name="cp_item" value="10000"><span>10,000원</span></label>
                <label class="box-radio-input"><input type="radio" name="cp_item" value="15000"><span>15,000원</span></label>
                <label class="box-radio-input"><input type="radio" name="cp_item" value="20000"><span>20,000원</span></label>
                <label class="box-radio-input"><input type="radio" name="cp_item" value="25000"><span>25,000원</span></label>
                <label class="box-radio-input"><input type="radio" name="cp_item" value="30000"><span>30,000원</span></label>
                <label class="box-radio-input"><input type="radio" name="cp_item" value="35000"><span>35,000원</span></label>
                <label class="box-radio-input"><input type="radio" name="cp_item" value="40000"><span>40,000원</span></label>
                <label class="box-radio-input"><input type="radio" name="cp_item" value="50000"><span>50,000원</span></label>
                <input type="hidden" value="포인트 충전" id="pointChar" name="pointChar">
                <p  style="color: #ac2925; margin-top: 30px">최소 충전금액은 1,000원이며 <br/>최대 충전금액은 50,000원 입니다.</p>
                <button type="button" class="btn btn-lg btn-block  btn-custom" id="charge">충 전 하 기</button>
</body>
<script>
    $('#charge').click(function () {
        // getter
        var IMP = window.IMP;
        IMP.init('imp27865884');
        var money = $('input[name="cp_item"]:checked').val();
        console.log(money);

        IMP.request_pay({
            pg: 'html5_inicis',
            merchant_uid: 'point' + new Date().getTime(),
            name: '핏티드 포인트 충전',
            amount: money,
            buyer_name: '${memberDTO.userNm}',
            buyer_tel: '${memberDTO.userPhone}'
        }, function (rsp) {
            console.log(rsp);

            if (rsp.success) {
                var msg = '결제가 완료되었습니다.';
                msg += '고유ID : ' + rsp.imp_uid;
                msg += '상점 거래ID : ' + rsp.merchant_uid;
                msg += '결제 금액 : ' + rsp.paid_amount;
                msg += '카드 승인번호 : ' + rsp.apply_num;
                $.ajax({
                    url: "insertChargePoint", //충전 금액값을 보낼 url 설정
                    type: "POST",
		        	dataType:"json",
		        	data: {
		            	'userId' : '${pointDTO.userId}',
		            	'pointType' : $('#pointChar').val(),
		            	'pointNow' : '${pointDTO.pointNow}' + 'money',
						'pointCharge' : 'money'
		        	},
		            contentType:"application/json; charset=utf-8"
                });
            } else {
                var msg = '결제에 실패하였습니다.';
                msg += '에러내용 : ' + rsp.error_msg;
            }
            alert(msg);
            location.href="${pageContext.request.contextPath }/main/main"; //alert창 확인 후 이동할 url 설정
            window.close();
        });
    });
</script>
</html>