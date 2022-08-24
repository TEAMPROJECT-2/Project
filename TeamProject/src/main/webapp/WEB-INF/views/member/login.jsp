<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

</head>
<body>
<!-- 메뉴단 -->
<jsp:include page="../inc/menu.jsp"/>

    <!-- 헤더단(광고같은 거 들어가도 됨) -->
    <section class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__text">
                        <h4>로그인</h4>
                        <div class="breadcrumb__links">
                            <a href="./index.html">Home</a>
                            <span>Login</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

	<!--  내용 -->
    <section class="contact spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6">
                    <div class="contact__text">
                        <div class="section-title">
                            <h2>로그인</h2>
                            <p>계정 없으면 회원가입 어쩌구</p>
                        </div>
                            <hr>
                        <ul>
                            <li>
                                <h4>SNS 로그인</h4>
                                <p>네이버, 카카오톡 같은</p>
                            </li>
                        </ul>
                    </div>
                </div>

                <div class="col-lg-6 col-md-6">
                <div class="checkout__order">
				<main class="form-signin ">
				  <form action="${pageContext.request.contextPath }/member/loginPro" method="post">
                    <div class="checkout__input">
                     <label for="userId">
                        ID
                     </label>
                        <input type="text" id="userId" name="userId" placeholder="ID">
                    </div>
                    <div class="checkout__input">
                  	 <label for="userPass">
                        비밀번호
                     </label>
                        <input type="password" id="userPass" name="userPass" placeholder="비밀번호">
                    </div>
				     <button type="submit" class="site-btn w-100 btn-lg">로그인</button><br>
				  </form>
				</main>
				</div>
                </div>
            </div>
        </div>
    </section>
    <!-- Contact Section End -->

    <!-- Footer -->
    <jsp:include page="../inc/footer.jsp"/>
</body>

</html>