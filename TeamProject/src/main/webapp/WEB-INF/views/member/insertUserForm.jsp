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

</script>
</head>
<body class="bg-light">
<!-- 메뉴단 -->
<jsp:include page="../inc/menu.jsp"/>

	<!--  내용 -->
    <div class="container-sm py-5 col-md-7 col-sm-6 text-center">
      <section id="forms">
    	<h2 class="fw-bold pt-3 pt-xl-5 pb-2 pb-xl-3">회원가입</h2>

        <form class=form-signin action="${pageContext.request.contextPath }/member/joinMemPro" method="post">
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
		</section>
	</div>


    <!-- Footer -->
    <jsp:include page="../inc/footer.jsp"/>
</body>

    <!-- 부트스트랩 -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</html>