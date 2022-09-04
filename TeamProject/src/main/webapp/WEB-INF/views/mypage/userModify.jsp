<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html
  lang="en"
  class="light-style layout-menu-relative"
  dir="ltr"
  data-theme="theme-default"
  data-assets-path="../assets/"
  data-template="vertical-menu-template-free"
>
  <head>
  </head>

  <body>
  <!-- 메뉴단 -->
<jsp:include page="../inc/menu.jsp"/>
    <!-- Layout wrapper -->
    <div class="layout-wrapper layout-content-navbar">
      <div class="layout-container">
		<jsp:include page="../inc/mypage-menu.jsp"/>

          <!-- Content wrapper -->
          <div class="content-wrapper">
            <!-- Content -->

            <div class="container-xxl flex-grow-1 container-p-y">
              <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">내 계정 /</span> 계정 정보</h4>

              <div class="row">
                <div class="col-md-12">
                  <ul class="nav nav-pills flex-column flex-md-row mb-3">
                    <li class="nav-item">
                      <a class="nav-link active" href="javascript:void(0);"><i class="bx bx-user me-1"></i> 계정 정보</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="${pageContext.request.contextPath }/member/connection">
                      <i class="bx bx-link-alt me-1"></i> 연결</a>
                    </li>
                  </ul>

                  <!-- Account -->
                  <div class="card mb-4">
                    <h5 class="card-header">개인 정보</h5>

                    <hr class="my-0" />
                    <div class="card-body">
                      <form id="formAccountSettings" action="${pageContext.request.contextPath}/member/modifyPro" method="POST">
                        <div class="row">
                          <div class="mb-3 col-md-6">
                            <label for="userNm" class="form-label">이름</label>
                            <input class="form-control form-control-lg" type="text" name="userNm" id="userNm" value="${memberDTO.userNm}" readonly />
                          </div>
                          <div class="mb-3 col-md-6">
                            <label for="userEmail" class="form-label">이메일</label>
                            <input class="form-control form-control-lg" type="email" name="userEmail" id="userEmail" value="${memberDTO.userEmail}" readonly />
                          </div>
                          <div class="mb-3 col-md-6">
                            <label for="userNicknm" class="form-label">닉네임</label>
                            <input class="form-control form-control-lg" type="text" name="userNicknm" id="userNicknm" placeholder="닉네임" value="${memberDTO.userNicknm}"/>
                          </div>
                          <div class="mb-3 col-md-6">
                            <label for="userPass" class="form-label">비밀번호</label>
                            <input class="form-control form-control-lg" type="password" name="userPass" id="userPass" />
                          </div>
                          <div class="mb-3 col-md-6">
                            <label for="userPhone" class="form-label">연락처</label>
                            <input class="form-control form-control-lg" type="text" name="userPhone" id="userPhone" placeholder="012-3456-7890" value="${memberDTO.userPhone}"/>
                          </div>
                          <div class="mb-3 col-md-6">
                            <label class="form-label" for="userAthletic">관심 운동</label>
                            <select class="select2 form-control form-control-lg" id="userAthletic " name="userAthletic">
                            	<option value="" <c:if test="${userAthletic eq null}">selected</c:if>>관심 운동을 선택해주세요</option>
                            	<option value="헬스" <c:if test="${userAthletic eq '헬스'}">selected</c:if>>헬스</option>
								<option value="크로스핏" <c:if test="${userAthletic eq '크로스핏'}">selected</c:if>>크로스핏</option>
								<option value="필라테스" <c:if test="${userAthletic eq '필라테스'}">selected</c:if>>필라테스</option>
								<option value="복싱" <c:if test="${userAthletic eq '복싱'}">selected</c:if>>복싱</option>
								<option value="요가" <c:if test="${userAthletic eq '요가'}">selected</c:if>>요가</option>
								<option value="홈트레이닝" <c:if test="${userAthletic eq '홈트레이닝'}">selected</c:if>>홈트레이닝</option>
<!--                               <option value="health">헬스</option> -->
<!--                               <option value="crossfit">크로스핏</option> -->
<!--                               <option value="plates">필라테스</option> -->
<!--                               <option value="boxing">복싱</option> -->
<!--                               <option value="yoga">요가</option> -->
<!--                               <option value="homet">홈트레이닝</option> -->
                            </select>
                          </div>
                        </div>
                        <div class="mt-2">
                          <button type="submit" class="btn btn-primary me-2">정보 수정</button>
                          <button type="reset" class="btn btn-outline-secondary">취소</button>
                        </div>
                      </form>
                    </div>
                    <!-- /Account -->
                  </div>
                  <div class="card">
                    <h5 class="card-header">회원 탈퇴</h5>
                    <div class="card-body">
                      <div class="mb-3 col-12 mb-0">
                        <div class="alert alert-warning">
                          <h6 class="alert-heading fw-bold mb-1">정말 탈퇴하시겠습니까?</h6>
                          <p class="mb-0">탈퇴하면 다시 되돌릴 수 없어요. 신중하게 결정해주세요!</p>
                        </div>
                      </div>
                      <form id="formAccountDeactivation" onsubmit="return false">
                        <div class="form-check mb-3">
                          <input
                            class="form-check-input"
                            type="checkbox"
                            name="accountActivation"
                            id="accountActivation"
                          />
                          <label class="form-check-label" for="accountActivation"
                            >안내사항을 숙지했고 탈퇴를 계속 진행할래요.</label
                          >
                        </div>
                        <button type="submit" class="btn btn-danger deactivate-account">회원 탈퇴하기</button>
                      </form>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <!-- / Content -->

            <!-- Footer -->
            <footer class="content-footer footer bg-footer-theme">
              <div class="container-xxl d-flex flex-wrap justify-content-between py-2 flex-md-row flex-column">
                <div class="mb-2 mb-md-0">
                  ©
                  <script>
                    document.write(new Date().getFullYear());
                  </script>
                  , made with ❤️ by
                  <a href="https://themeselection.com" target="_blank" class="footer-link fw-bolder">ThemeSelection</a>
                </div>
                <div>
                  <a href="https://themeselection.com/license/" class="footer-link me-4" target="_blank">License</a>
                  <a href="https://themeselection.com/" target="_blank" class="footer-link me-4">More Themes</a>

                  <a
                    href="https://themeselection.com/demo/sneat-bootstrap-html-admin-template/documentation/"
                    target="_blank"
                    class="footer-link me-4"
                    >Documentation</a
                  >

                  <a
                    href="https://github.com/themeselection/sneat-html-admin-template-free/issues"
                    target="_blank"
                    class="footer-link me-4"
                    >Support</a
                  >
                </div>
              </div>
            </footer>
            <!-- / Footer -->

            <div class="content-backdrop fade"></div>
          </div>
          <!-- Content wrapper -->
        </div>
        <!-- / Layout page -->
      </div>

      <!-- Overlay -->
      <div class="layout-overlay layout-menu-toggle"></div>
    </div>

    <!-- Core JS -->
    <!-- build:js assets/vendor/js/core.js -->
    <script src="${pageContext.request.contextPath }/resources/assets/vendor/libs/jquery/jquery.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets/vendor/libs/popper/popper.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets/vendor/js/bootstrap.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

    <script src="${pageContext.request.contextPath }/resources/assets/vendor/js/menu.js"></script>
    <!-- endbuild -->

    <!-- Vendors JS -->

    <!-- Main JS -->
    <script src="${pageContext.request.contextPath }/resources/assets/js/main.js"></script>

    <!-- Page JS -->
    <script src="${pageContext.request.contextPath }/resources/assets/js/pages-account-settings-account.js"></script>

    <!-- Place this tag in your head or just before your close body tag. -->
    <script async defer src="https://buttons.github.io/buttons.js"></script>

    <!-- Footer Section Begin -->
    <jsp:include page="../inc/footer.jsp"/>
</body>

</html>