<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en" class="light-style layout-menu-relative" dir="ltr" data-theme="theme-default" data-assets-path="../assets/" data-template="vertical-menu-template-free">
<head>
<script src="http://code.jquery.com/jquery-3.6.0.js"></script>
<script src="${pageContext.request.contextPath }/resources/jsPro/insertGoods.js"></script>
<!--   셀렉트박스 js -->
</head>

<body>
	<!-- 메뉴단 -->
	<jsp:include page="../inc/menu.jsp" />
	<!-- Layout wrapper -->
	<div class="layout-wrapper layout-content-navbar">
		<div class="layout-container">

			<!-- 		큰화면 버티컬 시작-->
			<jsp:include page="../inc/comp-menu.jsp" />
			<!-- 		큰화면 버티컬 끝 -->


			<!-- Content wrapper -->
			<div class="content-wrapper">
				<!-- Content -->
				<!-- 화면줄였을때 버티컬 메뉴 및 큰화면에서는 시작 -->
				<div class="container-xxl flex-grow-1 container-p-y">
					<h4 class="fw-bold py-3 mb-4">
						<span class="text-muted fw-light">상품관리 </span>
					</h4>

					<div class="row">
						<div class="col-md-12">
							<ul class="nav nav-pills flex-column flex-md-row mb-3">
								<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/comp/updateProd">
										<i class="bx bx-user me-1"></i>신규등록
									</a>
							</ul>
							<!--  화면줄였을때 버티컬 및 큰화면에서는 시작 매뉴끝                  -->

							<div class="col-xl">
								<!-- 			탭바		 -->
								<nav>
									<div class="nav nav-tabs" id="nav-tab" role="tablist" >
										<button class="nav-link active" id="user-insert-tab" data-bs-toggle="tab" data-bs-target="#user-insert" type="button" role="tab" aria-controls="user-insert" aria-selected="true" style="width:50%">운동용품</button>
										<button class="nav-link" id="comp-insert-tab" data-bs-toggle="tab" data-bs-target="#comp-insert" type="button" role="tab" aria-controls="comp-insert" aria-selected="false" style="width:50%">식품</button>
									</div>
								</nav>
								<!-- 			탭바		 -->
								<!-- 				컨텐트 탭바로 크게 감싸기 -->
								<div class="tab-content" id="nav-tabContent" style="padding:0em">
									<div class="tab-pane fade" id="comp-insert" role="tabpanel" aria-labelledby="comp-insert-tab">


										<div class="card mb-4">
											<div class="card-header d-flex justify-content-between align-items-center">
												<h5 class="mb-0">식품</h5>
												<small class="text-muted float-end"></small>
											</div>
											<div class="card-body">
												<form action="${pageContext.request.contextPath }/comp/insertGoodsPro" method="post" enctype="multipart/form-data">
													<div class="row">
													<div class="mb-3">
														<label class="form-label" for="basic-default-fullname">업체ID</label>
														<input type="text" class="form-control" id="basic-default-fullname" name="compId" value="${sessionScope.compId }" readonly />
													</div>
													<div class="food col-4" >
														<label for="defaultSelect" class="form-label">상품종류</label>
														<select id="select" class="form-select" name="prodLOption2">
															<option>선택</option>
															<option value="f01">보충제</option>
															<option value="f02">식단</option>
														</select>
													</div>

													<div class="foodF01 col-4" style="display: none">
														<label for="defaultSelect" class="form-label">보충제종류</label>
														<select id="select1" class="form-select" name="prodLOption3">
															<option>선택</option>
															<option value="f0101">프로틴</option>
															<option value="f0102">부스터</option>
															<option value="f0103">비타민</option>
															<option value="f0104">영양제</option>
														</select>
													</div>

													<div class="foodF02 col-4" style="display: none">
														<label for="defaultSelect" class="form-label">식단종류</label>
														<select id="select" class="form-select" name="prodLOption3">
															<option>선택</option>
															<option value="f0201">닭가슴살</option>
															<option value="f0202">샐러드</option>
															<option value="f0203">도시락</option>
														</select>
													</div>
													<div class="foodF0101 col-4" style="display: none">
														<label for="defaultSelect" class="form-label">맛</label>
														<select id="select" class="form-select" name="prodLOption4">
															<option>선택</option>
															<option value="T0101">초코</option>
															<option value="T0102">딸기</option>
															<option value="T0103">바나나</option>
															<option value="T0104">포도</option>
															<option value="T0105">쿠키</option>
															<option value="T0106">커피</option>
															<option value="T0107">바닐라</option>
														</select>
													</div>
													<div class="mb-3">
														<label class="form-label" for="basic-default-fullname">제품코드</label>
														<input type="text" class="form-control" id="basic-default-fullname" name="prodLCode" placeholder="제품코드 입력" />
													</div>

													<div class="mb-3">
														<label class="form-label" for="basic-default-fullname">상품명</label>
														<input type="text" class="form-control" id="basic-default-fullname" name="prodLProdNm" placeholder="상품명 입력" />
													</div>
													<div class="mb-3">
														<label class="form-label" for="basic-default-company">가격</label>
														<input type="text" class="form-control" id="basic-default-company" name="prodLPrice" placeholder="가격은 숫자만 입력" />
													</div>
													<div class="mb-3">
														<label class="form-label" for="basic-default-company">수량</label>
														<input type="text" class="form-control" id="basic-default-company" name="prodLQuantity" placeholder="수량은 숫자만 입력" />
													</div>

													<div class="mb-3">
														<label class="form-label" for="basic-default-message">상품상세설명</label>
														<textarea id="basic-default-message" name="ProdLDetail" class="form-control" placeholder="상세상품설명 입력"></textarea>
													</div>
													<div class="card">
														<label class="form-label" for="basic-default-message">상품 메인 사진 첨부</label>
														<div class="card-body">
															<div class="mb-3">
																<label for="formFile" class="form-label">상품사진 선택</label>
																<input class="form-control" type="file" id="formFile" name="prodLMainimg" />
															</div>
														</div>
														<label class="form-label" for="basic-default-message">상품 서브 사진 첨부</label>
														<div class="card-body">
															<div class="mb-3">
																<label for="formFile" class="form-label">상품사진 선택</label>
																<input class="form-control" type="file" id="formFile" name="prodLSubimg" />
															</div>
														</div>

													</div>
													</div>
													<input type="hidden" name="prodLOption1" value="food">
													<button type="submit" class="btn btn-primary">등록</button>
													<button type="submit" class="btn btn-primary">취소</button>
												</form>
											</div>
										</div>
									</div>


									<div class="tab-pane fade show active" id="user-insert" role="tabpanel" aria-labelledby="user-insert-tab">

										<div class="card mb-4">
											<div class="card-header d-flex justify-content-between align-items-center">
												<h5 class="mb-0">운동용품</h5>
												<small class="text-muted float-end"></small>
											</div>
											<div class="card-body">
												<form action="${pageContext.request.contextPath }/comp/insertGoodsPro" method="post" enctype="multipart/form-data">
													<div class="row">
													<div class="mb-3">
														<label class="form-label" for="basic-default-fullname">업체ID</label>
														<input type="text" class="form-control" id="basic-default-fullname" name="prodLCompNm" value="${sessionScope.compId }" readonly />
													</div>
													<div class="prod col-3" >
														<label for="defaultSelect" class="form-label">상품종류</label>
														<select id="select2" class="form-select" name="prodLOption2">
															<option>선택</option>
															<option value="p01">옷</option>
															<option value="p02">기구</option>
															<option value="p03">잡화</option>
														</select>
													</div>

													<div class="prod_p01 col-3" style="display: none">
														<label for="defaultSelect" class="form-label" >상품상세종류</label>
														<select id="select2" class="form-select" name="prodLOption3">
															<option>선택</option>
															<option value="p101">상의</option>
															<option value="p102">하의</option>
														</select>
													</div>

													<div class="prod_p02 col-3" style="display: none">
														<label for="defaultSelect" class="form-label">상품상세종류</label>
														<select id="select2" class="form-select" name="prodLOption3">
															<option>선택</option>
															<option value="P0202">덤벨</option>
															<option value="P0203">아령</option>
															<option value="P0204">폼롤러</option>
														</select>
													</div>


													<div class="prod_p03 col-3" style="display: none">
														<label for="defaultSelect" class="form-label">상품상세종류</label>
														<select id="select2" class="form-select" name="prodLOption3">
															<option>선택</option>
															<option value="P0301">보호대</option>
															<option value="P0302">보틀</option>
															<option value="P0304">가방</option>
														</select>
													</div>
													<div class="prod_color col-3" style="display: none">
														<label for="defaultSelect" class="form-label">색상</label>
														<select id="select2" class="form-select" name="prodLOption4">
															<option>선택</option>
															<option value="C0101">빨간색</option>
															<option value="C0102">주황색</option>
															<option value="C0103">노란색</option>
															<option value="C0104">초록색</option>
															<option value="C0105">파란색</option>
															<option value="C0106">남색</option>
															<option value="C0107">보라색</option>
															<option value="C0108">회색</option>
															<option value="C0109">분홍색</option>
															<option value="C0110">흰색</option>
															<option value="C0111">검은색</option>
														</select>
													</div>
													<div class="prod_size col-3" style="display: none">
														<label for="defaultSelect" class="form-label">사이즈</label>
														<select id="select2" class="form-select" name="prodLOption5">
															<option>선택</option>
															<option value="S0101">XS</option>
															<option value="S0102">S</option>
															<option value="S0103">M</option>
															<option value="S0104">L</option>
															<option value="S0105">XL</option>
														</select>
													</div>


													<div class="mb-3">
														<label class="form-label" for="basic-default-fullname">제품코드</label>
														<input type="text" class="form-control" id="basic-default-fullname" name="prodLCode" placeholder="제품코드 입력" />
													</div>

													<div class="mb-3">
														<label class="form-label" for="basic-default-fullname">상품명</label>
														<input type="text" class="form-control" id="basic-default-fullname" name="prodLProdNm" placeholder="상품명 입력" />
													</div>


													<div class="mb-3">
														<label class="form-label" for="basic-default-company">가격</label>
														<input type="text" class="form-control" id="basic-default-company" name="prodLPrice" placeholder="가격은 숫자만 입력" />
													</div>
													<div class="mb-3">
														<label class="form-label" for="basic-default-company">수량</label>
														<input type="text" class="form-control" id="basic-default-company" name="prodLQuantity" placeholder="수량은 숫자만 입력" />
													</div>

													<div class="mb-3">
														<label class="form-label" for="basic-default-message">상품상세설명</label>
														<textarea id="basic-default-message" name="ProdLDetail" class="form-control" placeholder="상세상품설명 입력"></textarea>
													</div>
													<div class="card">
														<label class="form-label" for="basic-default-message">상품 메인 사진 첨부</label>
														<div class="card-body">
															<div class="mb-3">
																<label for="formFile" class="form-label">상품사진 선택</label>
																<input class="form-control" type="file" id="formFile" name="prodLMainimg" />
															</div>
														</div>
														<label class="form-label" for="basic-default-message">상품 서브 사진 첨부</label>
														<div class="card-body">
															<div class="mb-3">
																<label for="formFile" class="form-label">상품사진 선택</label>
																<input class="form-control" type="file" id="formFile" name="prodLSubimg" />
															</div>
														</div>

													</div>
													</div>
													<input type="hidden" name="prodLOption1" value="goods">
													<button type="submit" class="btn btn-primary">등록</button>
													<button type="submit" class="btn btn-primary">취소</button>
												</form>
											</div>
										</div>
									</div>
								</div>
								<!-- 				컨텐트 탭바로 크게 감싸기 -->

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
							<a href="https://themeselection.com/demo/sneat-bootstrap-html-admin-template/documentation/" target="_blank" class="footer-link me-4">Documentation</a>

							<a href="https://github.com/themeselection/sneat-html-admin-template-free/issues" target="_blank" class="footer-link me-4">Support</a>
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
	<jsp:include page="../inc/footer.jsp" />
</body>

</html>
