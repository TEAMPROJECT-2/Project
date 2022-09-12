<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- 부트스트랩 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<!-- 아이디 중복검사 -->
<script type="text/javascript"
src="${pageContext.request.contextPath }/resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript">

// 회원 타입 선택
$(document).ready(function(){
	 $("form[name=compForm]").hide();

 $("input:radio[name=memberType]").click(function(){

     if($("input[name=memberType]:checked").val() == "2"){
         $("form[name=compForm]").show();
         $("form[name=userForm]").hide();
         // radio 버튼의 value 값이 1이라면 활성화

     }else if($("input[name=memberType]:checked").val() == "1"){
           $("form[name=userForm]").show();
           $("form[name=compForm]").hide();
         // radio 버튼의 value 값이 0이라면 비활성화
     }
 });
});

// 아이디 중복 체크
function uidCheck(){

	$.ajax({
		url:'${pageContext.request.contextPath }/member/idDupCheck',
		data:{'userId':$('#userId').val()},
		type: 'POST',
		success:function(rdata){
			if(rdata=='iddup'){
				$('#userId').addClass("is-invalid");
				$('#userId').removeClass("is-valid");
			}else{
				$('#userId').addClass("is-valid");
				$('#userId').removeClass("is-invalid");
			}
		}
	});

};

// 이메일 중복 체크
function uemailCheck(){

	$.ajax({
		url:'${pageContext.request.contextPath }/member/mailDupCheck',
		data:{'userEmail':$('#userEmail').val()},
		type: 'POST',
		success:function(rdata){
			if(rdata=='emaildup'){
				$('#userEmail').addClass("is-invalid");
				$('#userEmail').removeClass("is-valid");
			}else{
				$('#userEmail').addClass("is-valid");
				$('#userEmail').removeClass("is-invalid");
			}
		}
	});

};

// 사업자 등록번호
$(document).ready(function () {
   $(function () {

            $('#compRegNum').keydown(function (event) {
             var key = event.charCode || event.keyCode || 0;
             $text = $(this);
             if (key !== 8 && key !== 9) {
                 if ($text.val().length === 3) {
                     $text.val($text.val() + '-');
                 }
                 if ($text.val().length === 6) {
                     $text.val($text.val() + '-');
                 }
             }

             return (key == 8 || key == 9 || key == 46 || (key >= 48 && key <= 57) || (key >= 96 && key <= 105));
			 // Key 8번 백스페이스, Key 9번 탭, Key 46번 Delete 부터 0 ~ 9까지, Key 96 ~ 105까지 넘버패트
			 // => JQuery 0-9 숫자 백스페이스, 탭, Delete 키 넘버패드외에는 입력못함
         })
   });

});

</script>
</head>
<body class="bg-light">
<!-- 메뉴단 -->
<jsp:include page="../inc/menu.jsp"/>

	<!--  내용 -->
    <div class="container-sm py-5 col-md-7 col-sm-6 text-center">
      <section id="forms">
    	<h2 class="fw-bold pt-3 pt-xl-5 pb-2 pb-xl-3">회원가입</h2>

		<div class="mt-2 mb-2">
			<input type="radio" name="memberType" id="user" value="1" checked> <label for="user">회원</label> &nbsp; &nbsp; &nbsp; &nbsp;
			<input type="radio" name="memberType" id="comp" value="2"> <label for="comp">업체</label>
		</div>

<!-- 일반 회원 가입 -->
        <form class=form-signin action="${pageContext.request.contextPath }/member/joinMemPro" name=userForm method="post">
      <div>
        <div class="bd-example">
          <div class="form-floating mb-3">
            <input type="text" class="form-control" name="userId" id="userId" placeholder="ID" onkeyup="uidCheck(this.value)">
            <label for="userId">ID</label>
          </div>
          <div class="form-floating mb-3">
            <input type="email" class="form-control" name="userEmail" id="userEmail" placeholder="name@example.com" onkeyup="uemailCheck(this.value)">
            <label for="userEmail">이메일 주소</label>
          </div>
          <div class="form-floating mb-3">
            <input type="password" class="form-control" name="userPass" id="userPass" placeholder="Password">
            <label for="userPass">비밀번호</label>
          </div>
          <div class="form-floating mb-3">
            <input type="password" class="form-control" name=userPass2 id="userPass2" placeholder="Password">
            <label for="userPass2">비밀번호 확인</label>
          </div>
        </div>
      </div>
      <input type="hidden" name="userType" id="userType" value="1">
            <div class="mb-3">
              <input class="form-check-input is-invalid" type="checkbox" value="" id="invalidCheck3" required>
              <label class="form-check-label" for="invalidCheck3">
                개인정보 수집에 동의합니다.
              </label>

            </div>
          <div class="mb-3">
            <button class="site-btn w-100 btn-lg" type="submit">회원가입</button>
          </div>
       	   </form>

 <!-- 업체 회원 가입 -->
        <form class=form-signin action="${pageContext.request.contextPath }/member/joinCompPro" name=compForm method="post">
      <div>
        <div class="bd-example">
          <div class="form-floating mb-3">
            <input type="text" class="form-control" name="compId" id="compId" placeholder="ID" onkeyup="cidCheck(this.value)">
            <label for="userId">ID</label>
          </div>
          <div class="form-floating mb-3">
            <input type="text" class="form-control" name="compNm" id="compNm" placeholder="상호명">
            <label for="compNm">상호명</label>
          </div>
          <div class="form-floating mb-3">
            <input type="text" class="form-control" name="compRegNum" id="compRegNum" placeholder="123-45-67890" maxlength="12">
            <label for="userEmail">사업자 등록번호</label>
          </div>
          <div class="form-floating mb-3">
            <input type="password" class="form-control" name="compPass" id="compPass" placeholder="Password">
            <label for="userPass">비밀번호</label>
          </div>
          <div class="form-floating mb-3">
            <input type="password" class="form-control" name="compPass2" id="compPass2" placeholder="Password">
            <label for="userPass2">비밀번호 확인</label>
          </div>
        </div>
      </div>
      <input type="hidden" name="userType" id="userType" value="1">
            <div class="mb-3">
              <input class="form-check-input is-invalid" type="checkbox" value="" id="invalidCheck3" required>
              <label class="form-check-label" for="invalidCheck3">
                개인정보 수집에 동의합니다.
              </label>

            </div>
          <div class="mb-3">
            <button class="site-btn w-100 btn-lg" type="submit">회원가입</button>
          </div>
       	   </form>

		</section>
	</div>


    <!-- Footer -->
    <jsp:include page="../inc/footer.jsp"/>
</body>

    <!-- 부트스트랩 -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</html>