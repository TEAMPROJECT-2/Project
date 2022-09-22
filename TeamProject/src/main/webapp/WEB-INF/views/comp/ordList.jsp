<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
  <script src="${pageContext.request.contextPath }/resources/jsPro/ordList.js"></script>
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
              <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">주문 관리 </span> </h4>

			<div class="row">
                <div class="col-md-12">
                  <ul class="nav nav-pills flex-column flex-md-row mb-3">
                    <li class="nav-item">
                      <a class="nav-link" href="${pageContext.request.contextPath }/comp/ordList">
                      <i class="bx bx-user me-1"></i> 주문 목록</a>
                    </li>

                  </ul>
<!--  화면줄였을때 버티컬 및 큰화면에서는 시작 매뉴끝                  -->



                <div class="card">
                <h5 class="card-header">주문목록</h5>

                  <table class="table table-striped" >
                    <thead>
                      <tr>
                        <th>주문일</th>
                        <th>주문번호</th>
                        <th>주문물품</th>
                        <th>주문자</th>
                        <th>총금액</th>
                        <th>배송</th>
                        <th></th>
                      </tr>
                    </thead>
                    <tbody class="table-border-bottom-0">
					  <c:forEach var="orderListDTO" items="${ordList }" varStatus="status">
                      <tr >

                        <td><fmt:formatDate pattern="yy-MM-dd" value="${orderListDTO.ordLDate }"/></td>
                        <td><i class="fab fa-angular fa-lg text-danger me-3"></i> <strong>${orderListDTO.num }</strong></td>
                        <td>
                        ${orderListDTO.ordLCode }
                        </td>
                        <td>
                        ${orderListDTO.ordLUser }
                        </td>
                        <td>
                          ${orderListDTO.ordFinalprice }
                        </td>

                        <td colspan="2">
					  		<form action="${pageContext.request.contextPath }/comp/delivNumberInsert" method="post">
                      			<input type="hidden" value="${orderListDTO.ordLCode }" name="ordLCode" id="ordLCode">
                      			<input type="hidden" value="${orderListDTO.ordLUser }" name="ordLUser" id="ordLUser">
                      			<div id="delivNumber_${orderListDTO.trnum}">
                     	  		<c:set var="num" value="${orderListDTO.ordDeliveryStatus }" />
                         		<c:choose>
						 			<c:when test="${num eq '1'}">
						  				물품준비중&nbsp;&nbsp;
                       					<button class="btn btn-primary" id="delivNumberAdd_btn_${orderListDTO.trnum}" type="button">
                       					송장번호입력
                       					</button>
                       					<div></div>
						 			</c:when>
						 			<c:when test="${num eq '2'}">
						  				배송중
						 			</c:when>
						 			<c:when test="${num eq '3'}">
						  				배송완료
						 			</c:when>
						 		</c:choose>
                				</div>
                 			</form>

						</td>
                      </tr>
                      </c:forEach>


                    </tbody>
                  </table>

			        <div class="bd-example-snippet bd-code-snippet"><div class="bd-example " >
			        <nav aria-label="Standard pagination example">
			          <ul class="pagination">
			            <li class="page-item">
			              <c:if test="${pageDTO.startPage > pageDTO.pageBlock }">
			              <a class="page-link" href="${pageContext.request.contextPath }
							/board/list?pageNum=${pageDTO.startPage - pageDTO.pageBlock}" aria-label="Previous">
			                <span aria-hidden="true">&laquo;</span>
			              </a>
			              </c:if>
			            </li>

			            <c:forEach var="i" begin="${pageDTO.startPage }" end="${pageDTO.endPage }" step="1">
			            <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath }/comp/ordList?pageNum=${i}">${i}</a></li>
			            </c:forEach>

			            <li class="page-item">
			              <c:if test="${pageDTO.endPage < pageDTO.pageCount }">
			              <a class="page-link" href="${pageContext.request.contextPath }
						 /comp/deleteProd?pageNum=${pageDTO.startPage + pageDTO.pageBlock}" aria-label="Next">
			                <span aria-hidden="true">&raquo;</span>
			              </a>
			              </c:if>
			            </li>
			          </ul>
			        </nav>
			        </div></div>
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