<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
</style>
</head>
<body class="bg-light">
<!-- 메뉴단 -->
<jsp:include page="../inc/menu.jsp"/>

	<!--  내용 -->
    <div class="container-sm py-5 col-md-7 col-sm-6 text-center">
      <section id="forms">
    	<h2 class="sticky-xl-top fw-bold pt-3 pt-xl-5 pb-2 pb-xl-3">회원가입</h2>

        <form class=form-signin>
        <div class="mb-3">
          <input class="form-control form-control-lg" type="text" placeholder="아이디" aria-label=".form-control-lg example">
        </div>
        <div class="mb-3">
          <input class="form-control form-control-lg" type="text" placeholder="이메일 주소" aria-label=".form-control-lg example">
        </div>
        <div class="mb-3">
          <input class="form-control form-control-lg" type="password" placeholder="비밀번호" aria-label=".form-control-lg example">
        </div>

            <div class="mb-3">
              <input class="form-check-input is-invalid" type="checkbox" value="" id="invalidCheck3" required>
              <label class="form-check-label" for="invalidCheck3">
                개인정보 수집에 동의합니다.
              </label>

            </div>
          <div class="mb-3">
            <button class="btn site-btn" type="submit">회원가입</button>
          </div>
       	   </form>
		</section>
	</div>




    <!-- Footer -->
    <jsp:include page="../inc/footer.jsp"/>
</body>

</html>