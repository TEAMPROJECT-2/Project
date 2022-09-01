package com.itwillbs.controller;


import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.ProdDTO;
import com.itwillbs.domain.ProdStockDTO;
import com.itwillbs.service.CompService;
import com.itwillbs.service.MemberService;

@Controller
public class CompController {

	@Inject
	private CompService compService;
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
	public String insertPro(HttpServletRequest request,HttpSession session,MultipartFile prodLMainImg,MultipartFile prodLSubImg) throws Exception {
//		ProdDTO prodDTO,
		// 로그인후 세션값, 업체 아이디 갖고옴
		System.out.println("insertPro");
		String CompNm = (String)session.getAttribute("compId");
		ProdDTO prodDTO = new ProdDTO();
		prodDTO.setProdLCompnm(CompNm);
//
		//파일 이름  => 랜덤문자_파일이름

		UUID uuid=UUID.randomUUID();

		String MainImg=uuid.toString()+"_"+prodLMainImg.getOriginalFilename();
		String SubImg=uuid.toString()+"_"+prodLSubImg.getOriginalFilename();

		//업로드파일 file.getBytes() => upload/랜덤문자_파일이름 복사
		File uploadMainFile=new File(compUploadPath, MainImg);
		File uploadSubFile=new File(compUploadPath,SubImg);

		FileCopyUtils.copy(prodLMainImg.getBytes(), uploadMainFile);
		FileCopyUtils.copy(prodLSubImg.getBytes(), uploadSubFile);

		prodDTO.setProdLCode(request.getParameter("prodLCode"));
		prodDTO.setProdLType(request.getParameter("default-radio-1"));
		prodDTO.setProdLOption1(request.getParameter("prodLOption1"));
		prodDTO.setProdLOption2(request.getParameter("prodLOption2"));
		prodDTO.setProdLProdnm(request.getParameter("prodLProdNm"));
		prodDTO.setProdLPrice(Integer.parseInt(request.getParameter("prodLPrice")));
		prodDTO.setProdLDetail(request.getParameter("ProdLDetail"));
		prodDTO.setProdLQuantity(Integer.parseInt(request.getParameter("prodLQuantity")));




		prodDTO.setProdLSubimg(SubImg);
		prodDTO.setProdLMainimg(MainImg);

		// 관리자 물품 입력시 옵션 넣기
		Map<String, Object> opMap = new HashMap<String, Object>();
		opMap.put("ProdCodeKey",request.getParameter("prodLCode"));


		Map<String,Object> op1Map ;

		 List<Map<String,Object>> opList = new ArrayList<Map<String,Object>>();

		 op1Map = new HashMap<String, Object>();
		 op1Map.put("prodLOptionKey",request.getParameter("prodLOption1"));
		 op1Map.put("prodOptionNmKey",request.getParameter("prodOptionNm1"));
		 opList.add(op1Map);

		 op1Map = new HashMap<String, Object>();
		 op1Map.put("prodLOptionKey",request.getParameter("prodLOption2"));
		 op1Map.put("prodOptionNmKey",request.getParameter("prodOptionNm2") );
		 opList.add(op1Map);

		 opMap.put("opList",opList);

		compService.insertProd(prodDTO,opMap);
//		System.out.println(prodDTO);
		// 주소변경 이동
		return "redirect:/comp/insertGoods";
	}
	//업로드 경로 servlet-context.mxl upload폴더 경로 이름


	@RequestMapping(value = "/comp/deleteProd", method = RequestMethod.GET)
	public String list(HttpServletRequest request, Model model) {
		// 한화면에 보여줄 글개수
		int pageSize=10;
		//현페이지 번호
		String pageNum=request.getParameter("pageNum");
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

		List<ProdDTO> prodList=compService.getProdList(pageDTO);

		// pageBlock  startPage endPage count pageCount
		int count=compService.getProdCount();
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

		//데이터 담아서 list.jsp 이동
		model.addAttribute("prodList", prodList);
		model.addAttribute("pageDTO", pageDTO);

		// 주소변경없이 이동
		// WEB-INF/views/board/list.jsp 이동
		return "/comp/deleteProd";
	}
	// 삭제기능 구현
	@RequestMapping(value = "/comp/delete")
	public String compProdDeleteAjax(HttpServletRequest request) {
		String[] ajaxMsg = request.getParameterValues("valueArr");
		System.out.println("compController : "+ajaxMsg[0]);
		int size = ajaxMsg.length;
		for(int i=0; i<size; i++) {
			compService.deleteProd(ajaxMsg[i]);
			System.out.println("compController : "+ ajaxMsg[i]);
		}


		return "redirect:/comp/deleteProd";
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
