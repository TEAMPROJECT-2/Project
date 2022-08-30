<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- 부트스트랩 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
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
                            <h2>비밀번호 찾기</h2>
                            <p>회원가입 시 기입했던 아이디와 이메일을 적어주세요!</p>
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

                <div class="col-lg-6 col-md-6  bd-example">
			        <nav>
			          <div class="nav nav-tabs" id="nav-tab" role="tablist">
			            <button class="nav-link active" id="user-insert-tab" data-bs-toggle="tab" data-bs-target="#user-insert" type="button" role="tab" aria-controls="user-insert" aria-selected="true">일반</button>
			            <button class="nav-link" id="comp-insert-tab" data-bs-toggle="tab" data-bs-target="#comp-insert" type="button" role="tab" aria-controls="comp-insert" aria-selected="false">업체</button>
			          </div>
			        </nav>
			        	<div class="tab-content" id="nav-tabContent">

						<!-- ID 찾기 -->
         					 <div class="tab-pane fade show active" id="user-insert" role="tabpanel" aria-labelledby="user-insert-tab">
				                <div class="checkout__order">
								<main class="form-signin ">
								  <form method="post">
				                    <div class="checkout__input">
				                     <label for="userId">
				                        아이디
				                     </label>
				                        <input type="text" id="userId" name="userId" placeholder="아이디">
				                    </div>
				                    <div class="checkout__input">
				                  	 <label for="userEmail">
				                        이메일
				                     </label>
				                        <input type="email" id="userEmail" name="userEmail" placeholder="이메일">
				                    </div>
<%-- 				                     <input type="hidden" name="userLastDate" id="userLastDate" value="${userLastDate }" > --%>
								     <input type="button" class="site-btn w-100 btn-lg" value="비밀번호 찾기" id="searchPass"><br>
								  </form>
								</main>
								</div>



				         	</div>
				         	<!-- 업체 로그인 -->
         					 <div class="tab-pane fade" id="comp-insert" role="tabpanel" aria-labelledby="comp-insert-tab">
				                <div class="checkout__order">
								<main class="form-signin ">
								  <form action="${pageContext.request.contextPath }/member/loginCompPro" method="post">
				                    <div class="checkout__input">
				                     <label for="compId">
				                        업체 ID
				                     </label>
				                        <input type="text" id="compId" name="compId" placeholder="업체 ID">
				                    </div>
				                    <div class="checkout__input">
				                  	 <label for="compPass">
				                        비밀번호
				                     </label>
				                        <input type="password" id="compPass" name="compPass" placeholder="비밀번호">
				                    </div>
<!-- 				                     <input type="hidden" name="compType" placeholder="멤버 타입"> -->
								     <button type="submit" class="site-btn w-100 btn-lg">로그인</button><br>
								  </form>
								</main>
								</div>
				         	</div>
				         	</div>
                  </div>
        	</div>
    	</div>
    </section>
    <!-- Contact Section End -->



    <!-- Footer -->
    <jsp:include page="../inc/footer.jsp"/>
</body>
<!-- 부트스트랩 JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

</html>