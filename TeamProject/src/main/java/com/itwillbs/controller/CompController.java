package com.itwillbs.controller;


import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.itwillbs.domain.BoardDTO;
import com.itwillbs.domain.CommonDTO;
import com.itwillbs.domain.CompDTO;
import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.ProdDTO;
import com.itwillbs.domain.ProdStockDTO;
import com.itwillbs.service.CommonService;
import com.itwillbs.service.CompService;
import com.itwillbs.service.MemberService;
import com.mysql.cj.x.protobuf.MysqlxDatatypes.Array;

@Controller
public class CompController {

	@Inject
	private CompService compService;
	@Inject
	private CommonService commonService ;
	@Resource(name = "compUploadPath")
	private String compUploadPath;

	@RequestMapping(value = "/comp/compMain", method = RequestMethod.GET)
	public String compAdinMain() {
		return "comp/compMain";
	}
	@RequestMapping(value = "/comp/updateProd", method = RequestMethod.GET)
	public String compUpdateProd() {
		return "comp/updateProd";
	}
	@RequestMapping(value = "/comp/insertGoods", method = RequestMethod.GET)
	public String compInsertProd() {
		System.out.println("comp/insertGoods");
		return "comp/insertGoods";
	}



	@RequestMapping(value = "/comp/insertGoodsPro", method = RequestMethod.POST)
	public String insertPro(HttpServletRequest request,HttpSession session,MultipartFile prodLMainimg,MultipartFile prodLSubimg) throws Exception {
		System.out.println("/comp/insertGoodsPro");

		ProdDTO prodDTO = new ProdDTO();


		CommonDTO commonDTO =  new CommonDTO();
		commonDTO.setComCd("PF"); // 코드 정의
		commonDTO.setColumnNm("PROD_L_CODE"); //기준 컬럼
		commonDTO.setTableNm("PRODUCT_LIST"); //테이블 정의
		CommonDTO cd = commonService.selectCodeSearch(commonDTO);
		//cd = PF220906001 로 생성됨
		//조회해온 코드값을 원하는 DTO에 Set 처리
		prodDTO.setProdLCode(cd.getPkCd());



		//		ProdDTO prodDTO,
		// 로그인후 세션값, 업체 아이디 갖고옴
		System.out.println("insertPro");
		String CompNm = (String)session.getAttribute("compId");
		prodDTO.setProdLCompnm(CompNm);
//
		//파일 이름  => 랜덤문자_파일이름

		UUID uuid=UUID.randomUUID();

		String MainImg=uuid.toString()+"_"+prodLMainimg.getOriginalFilename();
		String SubImg=uuid.toString()+"_"+prodLSubimg.getOriginalFilename();

		//업로드파일 file.getBytes() => upload/랜덤문자_파일이름 복사
		File uploadMainFile=new File(compUploadPath, MainImg);
		File uploadSubFile=new File(compUploadPath,SubImg);
		System.out.println("메인사진이름 : "+MainImg);
		FileCopyUtils.copy(prodLMainimg.getBytes(), uploadMainFile);
		FileCopyUtils.copy(prodLSubimg.getBytes(), uploadSubFile);


		prodDTO.setProdLOption1(request.getParameter("prodLOption1"));
		prodDTO.setProdLOption2(request.getParameter("prodLOption2"));
		prodDTO.setProdLOption3(request.getParameter("prodLOption3"));
		prodDTO.setProdLOption4(request.getParameter("prodLOption4"));
		prodDTO.setProdLOption5(request.getParameter("prodLOption5"));
		prodDTO.setProdLProdnm(request.getParameter("prodLProdNm"));
		prodDTO.setProdLPrice(Integer.parseInt(request.getParameter("prodLPrice")));
		prodDTO.setProdLDetail(request.getParameter("ProdLDetail"));
		prodDTO.setProdLQuantity(Integer.parseInt(request.getParameter("prodLQuantity")));
		prodDTO.setProdLSubimg(SubImg);
		prodDTO.setProdLMainimg(MainImg);


//		상세 옵션 넣기




		compService.insertProd(prodDTO);
//		System.out.println(prodDTO);
		// 주소변경 이동
		return "redirect:/comp/insertGoods";
	}
	//업로드 경로 servlet-context.mxl upload폴더 경로 이름


	@RequestMapping(value = "/comp/deleteProd", method = RequestMethod.GET)
	public String list(HttpServletRequest request, Model model,HttpSession session,@ModelAttribute ProdDTO prodDTO) {
		// 한화면에 보여줄 글개수
		int pageSize=10;
		//현페이지 번호
		String pageNum=request.getParameter("pageNum");
		String CompNm = (String)session.getAttribute("compId");

		System.out.println("CompNm : " + CompNm);

		if(pageNum==null) {
			pageNum="1";
		}

		//현페이지 번호를 정수형으로 변경
		int currentPage=Integer.parseInt(pageNum);
		// PageDTO 객체생성
		PageDTO pageDTO=new PageDTO();
		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);
		pageDTO.setCompNm(CompNm);
		pageDTO.setColumnNm(request.getParameter("searchCol") == null ? "0" : request.getParameter("searchCol")); // 기준 컬럼
		pageDTO.setSearchKeyWord(request.getParameter("searchKeyWord")); // 검색 키워드 갖고오기
		pageDTO.setStatus(request.getParameter("status")); // 검색 양호,품절 상태 갖고오기
		System.out.println("getSearchKeyWord() : "+pageDTO.getSearchKeyWord());
		System.out.println("pageDTO.getColumnNm() : "+pageDTO.getColumnNm());
		System.out.println("pageDTO.getStatus() : "+pageDTO.getStatus());
//		pageDTO.setSearchKeyWord(searchKeyWord);
//		pageDTO.setCompCode(request.getParameter(""));
		//세션값 가져가기( 해당 업체 물건만 갖고 오려고)
		System.out.println(pageDTO);
		List<ProdDTO> prodList=compService.getProdList(pageDTO); // 물건 리스트 갖고오기
		int count=compService.getProdCount(pageDTO);     // 업체 전체 물건 리스트 갯수
		// 페이징
		int pageBlock=10;
		int startPage=(currentPage-1)/pageBlock*pageBlock+1;
		int endPage=startPage+pageBlock-1;
		int pageCount=count / pageSize +(count % pageSize==0?0:1);
		if(endPage > pageCount){
			endPage = pageCount;
		}


		pageDTO.setCount(count);
		pageDTO.setPageBlock(pageBlock);
		pageDTO.setStartPage(startPage);
		pageDTO.setEndPage(endPage);
		pageDTO.setPageCount(pageCount);
//		pageDTO.setStatus(status);
		System.out.println("pageDTO.getStatus() : "+pageDTO.getStatus());

		//데이터 담아서 list.jsp 이동
		model.addAttribute("prodList", prodList);
		model.addAttribute("pageDTO", pageDTO);

		// 주소변경없이 이동
		// WEB-INF/views/board/list.jsp 이동
		return "/comp/deleteProd";
	}



	// 삭제기능 구현
	@RequestMapping(value = "/comp/delete")
	public ResponseEntity<String> compProdDeleteAjax(HttpServletRequest request) {
		String[] ajaxMsg = request.getParameterValues("valueArr");
		System.out.println("compController : "+ajaxMsg[0]);
		// 삭제되는 데이터 만큼 for 문을 돌려 compService.deleteProd 호출
		for(int i=0; i<ajaxMsg.length; i++) {
			compService.deleteProd(ajaxMsg[i]);
			System.out.println("compController : "+ ajaxMsg[i]);
		}

		ResponseEntity<String> entity=new ResponseEntity<String>("1" ,HttpStatus.OK);
		return entity;
	}



	// 수정
	@RequestMapping(value = "/comp/update", method = RequestMethod.GET)
	public String update(HttpServletRequest request, Model model) {
		//파라미터 가져오기
		String prodLCode=request.getParameter("CheckRow");
		// 디비에서 조회
		System.out.println(prodLCode);
		ProdDTO prodDTO=compService.getProd(prodLCode);

		// model에 데이터 저장
		model.addAttribute("prodDTO", prodDTO);

		// 주소변경없이 이동
		// WEB-INF/views/board/updateForm.jsp 이동
		return "/comp/updateProd";
	}

	@RequestMapping(value = "/comp/updatePro", method = RequestMethod.POST)
	public String updatePro(HttpSession session,HttpServletRequest request,MultipartFile prodLMainimg,MultipartFile prodLSubimg) throws Exception {
		String filenamemain = "";
		String filenamesub = "";
		if(prodLMainimg.isEmpty()) {
			filenamemain=request.getParameter("oldfilemain");
		}else {
			UUID uuid=UUID.randomUUID();
			filenamemain=uuid.toString()+"_"+prodLMainimg.getOriginalFilename();
			//업로드파일 file.getBytes() => upload/랜덤문자_파일이름 복사
			File uploadFileMain=new File(compUploadPath,filenamemain);

			FileCopyUtils.copy(prodLMainimg.getBytes(), uploadFileMain);
		}
		if(prodLSubimg.isEmpty()) {
			filenamemain=request.getParameter("oldfilesub");
		}else {
			UUID uuid=UUID.randomUUID();
			filenamemain=uuid.toString()+"_"+prodLSubimg.getOriginalFilename();
			//업로드파일 file.getBytes() => upload/랜덤문자_파일이름 복사
			File uploadFileSub=new File(compUploadPath,filenamesub);

			FileCopyUtils.copy(prodLSubimg.getBytes(), uploadFileSub);
		}

				ProdDTO prodDTO=new ProdDTO();
				prodDTO.setProdLCode(request.getParameter("prodLCode"));
				prodDTO.setProdLPrice(Integer.parseInt(request.getParameter("prodLPrice")));
				prodDTO.setProdLQuantity(Integer.parseInt(request.getParameter("prodSCount")));
				prodDTO.setProdLDetail(request.getParameter("ProdLDetail"));
				prodDTO.setProdLMainimg(filenamemain);
				prodDTO.setProdLSubimg(filenamesub);

		//id 일치 확인
		CompDTO compDTO = new CompDTO();
		String CompNm = (String)session.getAttribute("compId");
		compDTO.setCompId(CompNm);
		System.out.println("업체 아이디 : "+compDTO.getCompId());
		compDTO=compService.getComp(compDTO);
		if(compDTO!=null) {
//			num pass 일치
			compService.updateProd(prodDTO);
			// 주소변경하면서 이동 /board/list 이동
			return "redirect:/comp/updateProd";
		}else {
			// 아이디 틀림
			// "틀림" 뒤로이동
			// 주소변경없이 이동
			// WEB-INF/views/board/msg.jsp 이동
			return "board/msg";
		}
	}


	@RequestMapping(value = "/comp/prodRefund", method = RequestMethod.GET)
	public String compProdRefund() {
		return "comp/prodRefund";
	}
	@RequestMapping(value = "/comp/updateAccount", method = RequestMethod.GET)
	public String compupdateAccount() {
		return "comp/updateAccount";
	}
	@RequestMapping(value = "/comp/prodList", method = RequestMethod.GET)
	public String compProdList() {
		return "comp/prodList";
	}
	@RequestMapping(value = "/comp/ordList", method = RequestMethod.GET)
	public String compOrdList() {
		return "comp/ordList";
	}

}


