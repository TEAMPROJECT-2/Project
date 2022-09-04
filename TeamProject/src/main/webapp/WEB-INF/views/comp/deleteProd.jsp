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
  <script src="http://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="${pageContext.request.contextPath }/resources/jsPro/deleteProd.js?testNum=2"></script>
<!--   전체선택, 선택삭제 자바스크립트 -->


  </head>

  <body>
  <!-- 메뉴단 -->
<jsp:include page="../inc/menu.jsp"/>
    <!-- Layout wrapper -->
    <div class="layout-wrapper layout-content-navbar">
      <div class="layout-container">

<!-- 		큰화면 버티컬 시작-->
		<jsp:include page="../inc/comp-menu.jsp"/>
<!-- 		큰화면 버티컬 끝 -->


           <!-- Content wrapper -->
          <div class="content-wrapper">
            <!-- Content -->
<!-- 화면줄였을때 버티컬 메뉴 및 큰화면에서는 시작 -->
            <div class="container-xxl flex-grow-1 container-p-y">
              <h4 class="fw-bold py-3 mb-4">
                <span class="text-muted fw-light">상품삭제 </span>
              </h4>

              <div class="row">
                <div class="col-md-12">
                  <ul class="nav nav-pills flex-column flex-md-row mb-3">
                    <li class="nav-item">
                      <a class="nav-link" href="${pageContext.request.contextPath }/comp/deleteProd"
                        ><i class="bx bx-user me-1"></i>상품삭제 </a
                      >


                  </ul>
<!--  화면줄였을때 버티컬 및 큰화면에서는 시작 매뉴끝                  -->



                <div class="card">
                <h5 class="card-header">상품목록</h5>
                <form>
                <table class="table table-striped">
                 <tbody class="table-border-bottom-0">
                  <tr>
                  	 <td></td>
                     <td class="mb-3">
                        <select id="defaultSelect" class="form-select">
                          <option>재고상태 선택</option>
                          <option value="1">양호</option>
                          <option value="2">품절임박</option>
                          <option value="3">품절</option>
                        </select>
                     </td>
                     <td colspan="2" class="input-group input-group-merge">
                        <span class="input-group-text" id="basic-addon-search31"><i class="bx bx-search"></i></span>
                        <input
                          type="text"
                          class="form-control"
                          placeholder="상품번호 검색"
                          aria-label="Search..."
                          aria-describedby="basic-addon-search31"/>
                	</td>
                	<td><button type="submit" class="btn btn-primary">검색</button> </td>
                  </tr>
                 </tbody>
               </table>
               </form>


                <div class="table-responsive text-nowrap" id="Context">
                 <form>
                  <table class="table table-striped" >
                    <thead>
                      <tr>
                        <th>&nbsp;&nbsp;<input class="form-check-input" type="checkbox" id="allCheck" name="allCheck" />&nbsp;&nbsp;&nbsp;&nbsp;전체선택 </th>
                        <th>번호</th>
                        <th>상품코드</th>
                        <th>상품이름</th>
                        <th>가격</th>
                        <th>재고수량</th>
                        <th>재고상태</th>
                      </tr>
                    </thead>
                    <tbody class="table-border-bottom-0">
					  <c:forEach var="prodDTO" items="${prodList }">
                      <tr onClick="location.href='${pageContext.request.contextPath }/comp/update?CheckRow=${prodDTO.prodLCode }'" style="cursor:pointer;">
                      	<td onclick="event.cancelBubble=true">&nbsp;&nbsp;&nbsp;&nbsp;<input class="form-check-input" type="checkbox" value="${prodDTO.prodLCode }" name="CheckRow" id="defaultCheck1" />
                      	<label class="form-check-label" for="defaultCheck1"> 선택 </label></td>
                        <td>${prodDTO.prodLNum }</td>
                        <td><i class="fab fa-angular fa-lg text-danger me-3"></i> <strong>${prodDTO.prodLCode }</strong></td>
                        <td>${prodDTO.prodLProdnm }</td>
                        <td>
                          ${prodDTO.prodLPrice }
                        </td>
                        <td>
                          ${prodDTO.prodLQuantity }
                        </td>

                        <td><span class="badge bg-label-info me-1">양호</span></td>
                      </tr>
                      </c:forEach>

					  <c:if test="${pageDTO.startPage > pageDTO.pageBlock }">
						<a href="${pageContext.request.contextPath }
							/board/list?pageNum=${pageDTO.startPage - pageDTO.pageBlock}">Prev</a>
					  </c:if>

						<c:forEach var="i" begin="${pageDTO.startPage }" end="${pageDTO.endPage }" step="1">
						<a href="${pageContext.request.contextPath }/comp/deleteProd?pageNum=${i}">${i}</a>
						</c:forEach>

					  <c:if test="${pageDTO.endPage < pageDTO.pageCount }">
						<a href="${pageContext.request.contextPath }
						 /comp/deleteProd?pageNum=${pageDTO.startPage + pageDTO.pageBlock}">Next</a>
					  </c:if>
                    </tbody>
                  </table>

                  <button type="submit" class="btn btn-primary" onclick="deleteValue();">선택삭제</button>
                 </form>
                </div>
              </div>




                </div>
              </div>
            </div>
            <!--/ Content -->

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
          <!-- 화면 줄였을때 Content wrapper -->
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

    <!-- Place this tag in your head or just before your close body tag. -->
    <script async defer src="https://buttons.github.io/buttons.js"></script>

    <!-- Footer Section Begin -->
    <jsp:include page="../inc/footer.jsp"/>
</body>

</html>