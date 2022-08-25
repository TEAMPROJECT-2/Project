<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- 부트스트랩 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body class="bg-light">
<!-- 메뉴단 -->
<jsp:include page="../inc/menu.jsp"/>

	<!--  내용 -->
    <div class="container-sm py-5 col-md-7 col-sm-6 text-center">
      <section id="forms">
    	<h2 class="sticky-xl-top fw-bold pt-3 pt-xl-5 pb-2 pb-xl-3">회원가입</h2>

        <form class=form-signin>
      <div>
        <div class="bd-example">
          <div class="form-floating mb-3">
            <input type="text" class="form-control" id="floatingInput" placeholder="name@example.com">
            <label for="floatingInput">ID</label>
          </div>
          <div class="form-floating mb-3">
            <input type="email" class="form-control" id="floatingPassword" placeholder="Password">
            <label for="floatingPassword">이메일 주소</label>
          </div>
          <div class="form-floating mb-3">
            <input type="password" class="form-control" id="floatingPassword" placeholder="Password">
            <label for="floatingPassword">비밀번호</label>
          </div>
        </div>
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

    <!-- 부트스트랩 -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</html>