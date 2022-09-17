<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html
  class="light-style layout-menu-relative"
  dir="ltr"
  data-theme="theme-default"
  data-assets-path="../assets/"
  data-template="vertical-menu-template-free"
>
  <head>
<script type="text/javascript"
src="${pageContext.request.contextPath }/resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript">

// 탈퇴 비밀번호 입력창 나오게
$(document).ready(function(){
	$('#delCheck').change(function(){
		if ($('#delCheck').is(':checked')) {
			$('#delDiv1').show();
		}else {
			$('#delDiv1').hide();

		}
	});
});

// 탈퇴
$(document).ready(function(){
	$('#delBtn').click(function(){
		$.ajax({
			url:'/web/comp/deletePro',
			type:'POST',
			data:{'compId':$('#compId1').val(),'compPass':$('#compPass1').val()},
			success:function(rdata){
				 if(rdata=="ok"){	// 아이디 없음
					 window.location.href = "${pageContext.request.contextPath }/main/main"
				 	}else{				// 아이디 있음
				 	 alert("다시 입력해주세요!")
				 	}
			}
		});
	});
});

</script>

  </head>

  <body>
  <!-- 메뉴단 -->
<jsp:include page="../inc/menu.jsp"/>
    <!-- Layout wrapper -->
    <div class="layout-wrapper layout-content-navbar">
      <div class="layout-container">
		<jsp:include page="../inc/comp-menu.jsp" />

          <!-- Content wrapper -->
          <div class="content-wrapper">
            <!-- Content -->

            <div class="container-xxl flex-grow-1 container-p-y">
              <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">업체 계정 /</span> 계정 정보</h4>

              <div class="row">
                <div class="col-md-12">
                  <ul class="nav nav-pills flex-column flex-md-row mb-3">
                    <li class="nav-item">
                      <a class="nav-link active" href="${pageContext.request.contextPath }/comp/modify">
                      <i class="bx bx-user me-1"></i> 계정 정보</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="${pageContext.request.contextPath }/comp/passMod">
                      <i class="bx bx-user me-1"></i> 비밀번호 변경</a>
                    </li>

                  </ul>

                  <!-- Account -->
                  <div class="card mb-4">
                    <h5 class="card-header">업체 정보</h5>

                    <hr class="my-0" />
                    <div class="card-body">
                      <form id="formAccountSettings" action="${pageContext.request.contextPath}/comp/modifyPro" method="POST">
                        <div class="row">
                            <input class="form-control form-control-lg" type="hidden" name="compId" id="compId" value="${compDTO.compId}" readonly />
                          <div class="mb-3 col-md-6">
                            <label for="compNm" class="form-label">업체이름</label>
                            <input class="form-control form-control-lg" type="text" name="compNm" id="compNm" value="${compDTO.compNm}"/>
                          </div>
                          <div class="mb-3 col-md-6">
                            <label for="compEmail" class="form-label">이메일</label>
                            <input class="form-control form-control-lg" type="email" name="compEmail" id="compEmail" value="${compDTO.compEmail}" readonly />
                          </div>
                          <div class="mb-3 col-md-6">
                            <label for="compPass" class="form-label">비밀번호</label>
                            <input class="form-control form-control-lg" type="password" name="compPass" id="compPass" />
                          </div>
                          <div class="mb-3 col-md-6">
                            <label for="compPhone" class="form-label">연락처</label>
                            <input class="form-control form-control-lg" type="text" name="compPhone" id="compPhone" placeholder="012-3456-7890" value="${compDTO.compPhone}"/>
                          </div>
                        </div>
                        <div class="mt-2">
                          <button type="submit" class="btn btn-primary me-2">정보 수정</button>
                          <button type="reset" class="btn btn-outline-secondary">취소</button>
                        </div>
                      </form>
                    </div>
                    <!-- /Account -->

                    <!-- 회월탈퇴 -->
                  </div>
                  <div class="card">
                    <h5 class="card-header">업체 탈퇴</h5>
                    <div class="card-body">
                      <div class="mb-3 col-12 mb-0">
                        <div class="alert alert-warning">
                          <h6 class="alert-heading fw-bold mb-1">정말 탈퇴하시겠습니까?</h6>
                          <p class="mb-0">탈퇴하면 다시 되돌릴 수 없어요. 신중하게 결정해주세요!</p>
                        </div>
                      </div>
                      <form id="deleteUser" method="POST">
                        <div class="form-check mb-3">
                          <input
                            class="form-check-input"
                            type="checkbox"
                            id="delCheck"
                          />
                          <label class="form-check-label" for="delCheck">안내사항을 숙지했고 탈퇴를 계속 진행할래요.</label>
                        </div>

                          <div class="mb-3 col-md-4" id="delDiv" >
                            <label for="compPass" class="form-label">비밀번호를 입력하세요</label>
                            <input class="form-control form-control-lg" type="hidden" name="compId1" id="compId1" value="${compDTO.compId}"/>
                            <input class="form-control form-control-lg" type="password" name="compPass1" id="compPass1"/>
                          </div>

                        <button type="button" name="delBtn" id="delBtn" class="btn btn-danger deactivate-account">업체 탈퇴하기</button>
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
                </div>
                <div>
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