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
<script type="text/javascript">
function datecheck(){
	
	
	var today = new Date();
	var startyear = $('#startyear').val(); 
	var endyear = $('#endyear').val();
	var startmonth = $('#startmonth').val();
	var endmonth = $('#endmonth').val();
	var startday = $('#startday').val();
	var endday = $('#endday').val();
	
	
	var startdate1 = new Date();
	startdate1.setFullYear(startyear,startmonth-1,startday);

	var enddate1 = new Date();
	enddate1.setFullYear(endyear,endmonth-1,endday);
	

	var startdate = startyear +"-"+ startmonth +"-"+ startday;
	var enddate = endyear + "-" + endmonth +"-"+ endday
	
	$('#startdate').val(startdate);
	$('#enddate').val(enddate);
	
	if(startdate1 > enddate1){
		alert('검색 종료일을 검색 시작일 보다 늦은 날짜로 지정해주세요.');
		return false;
	}else if(endyear - startyear > 2){
		alert('최대 검색 가능 기간은 1년 입니다.');
		return false;
	}else if(startdate1 > today || enddate1 > today){
		alert('오늘 이전의 날짜만 검색이 가능합니다.');
		return false;
	}
	
}
</script>
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
              <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">포인트/쿠폰 /</span> 포인트</h4>

                <div class="mb-3 row">
                  <div class="col-md-10">
                    <input class="form-control" type="date" id="html5-date-input" />
                    <input class="form-control" type="date" id="html5-date-input" />
                  </div>
                  <label for="html5-date-input" class="col-md-2 col-form-label">Date</label>
                </div>

						<fieldset id="checkline">
							<br>
							<form action="pointcheck.cp" method="post"
								onsubmit="return datecheck()">
								<input type="hidden" id="startdate" name="startdate"> <input
									type="hidden" id="enddate" name="enddate"> <input
									type="button" value="1개월" class="btn btn-outline-info"
									onclick="location.href='pointcheck.cp?searchmonth=1';">
								<input type="button" value="3개월" class="btn btn-outline-info"
									onclick="location.href='pointcheck.cp?searchmonth=3';">
								<input type="button" value="6개월" class="btn btn-outline-info"
									onclick="location.href='pointcheck.cp?searchmonth=6';">

								<br>
								<br> <select name="startyear" id="startyear"
									class="custom-select" style="width: 100px;">
								</select>년
								 <select name="startmonth" id="startmonth"
									class="custom-select" style="width: 100px;">
								</select>월
								<select name="startday" id="startday"
									class="custom-select" style="width: 100px;">
								</select>일 ~ <select name="endyear" id="endyear"
								</select>년 <select name="endmonth" id="endmonth"
								</select>월 <select name="endday" id="endday"
									class="custom-select" style="width: 100px;">
									<%for(int i=1;i<32;i++) {%>
									<option name="<%=i%>"><%=i %></option>
									<%} %>
								</select>일&nbsp;&nbsp; <input type="submit" value="조회하기"
									class="btn btn-info">

							</form>
							<br>
							<br>
						</fieldset>





              <!-- Basic Bootstrap Table -->
              <div class="card">
                <h5 class="card-header">포인트 조회</h5>
                <div class="table-responsive text-nowrap">
                  <table class="table">
                    <thead>
                      <tr>
                        <th>적립일자</th>
                        <th>내역</th>
                        <th>적립</th>
                        <th>잔액</th>
                      </tr>
                    </thead>
                    <tbody class="table-border-bottom-0">
                     <c:forEach var="pointDTO" items="${pointList }">
                      <tr>
                        <td><i class="fab fa-angular fa-lg text-danger me-3"></i> ${pointDTO.pointDate }</td>
                        <td>${pointDTO.pointType }</td>
                        <c:if test="${ pointDTO.pointUsed ne 0}">
                        <td>-${pointDTO.pointUsed }</td>
                        </c:if>
                        <c:if test="${ pointDTO.pointCharge ne 0}">
                        <td>${pointDTO.pointCharge }</td>
                        </c:if>
                        <td><span class="badge bg-label-primary me-1">${pointDTO.pointNow }</span></td>
                      </tr>
					 </c:forEach>					
                    </tbody>
                  </table>
                </div>
              </div>
              <!--/ Basic Bootstrap Table -->
			</div>


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

    <!-- Place this tag in your head or just before your close body tag. -->
    <script async defer src="https://buttons.github.io/buttons.js"></script>

    <!-- Footer Section Begin -->
    <jsp:include page="../inc/footer.jsp"/>
</body>

</html>