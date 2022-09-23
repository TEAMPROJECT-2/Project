package com.itwillbs.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.itwillbs.domain.ProdDTO;
import com.itwillbs.domain.BoardDTO;
import com.itwillbs.domain.CommonDTO;
import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.service.CommonService;
import com.itwillbs.service.MemberService;
import com.itwillbs.service.ProdService;

@Controller
public class ProdController {

	//객체생성 부모인터페이스 = 자식클래스
	@Inject
	private ProdService prodService;
	@Inject
	private CommonService commonService;

	//업로드 경로 servlet-context.mxl upload폴더 경로 이름
	@Resource(name = "uploadPath")
	private String uploadPath;

	// 상품페이지
	@RequestMapping(value = "/product/shop", method = RequestMethod.GET)
	public ModelAndView list(HttpServletRequest req, HttpServletResponse res, @ModelAttribute ProdDTO prodDTO) throws Exception {
		try {
			ModelAndView mv = new ModelAndView();
			// ---------------- 자동 코드값 생성 시작
			//코드 생성 > "코드" + YYMMDD + max(000)+1
			CommonDTO commonDTO =  new CommonDTO();
			commonDTO.setComCd("PF"); // 코드 정의
			commonDTO.setColumnNm("PROD_L_CODE"); //기준 컬럼
			commonDTO.setTableNm("PRODUCT_LIST"); //테이블 정의
			CommonDTO cd = commonService.selectCodeSearch(commonDTO);
			//cd = PF220906001 로 생성됨
			//조회해온 코드값을 원하는 DTO에 Set 처리
			prodDTO.setProdLCode(cd.getPkCd());

			List<CommonDTO> commonList =  commonService.selectCommonList(commonDTO);
			// ---------------- 자동 코드값 생성 끝
			// ---------------- 페이징 처리 시작
			int pageSize = 9;
			String pageNum = prodDTO.getPageNum();
			if(pageNum == null) {
				pageNum = "1";
			}
			int currentPage=Integer.parseInt(pageNum);

			prodDTO.setCurrentPage(currentPage);
			prodDTO.setPageSize(9);

			List<ProdDTO> prodList = prodService.selectProdList(prodDTO);
			int count = prodService.selectProdListCnt(prodDTO);
			int pageBlock = 3;
			int startPage = (currentPage-1)/pageBlock*pageBlock+1;
			int endPage=startPage+pageBlock-1;
			int pageCount=count / pageSize +(count % pageSize==0?0:1);
			if(endPage > pageCount){
				endPage = pageCount;
			}

			prodDTO.setCount(count);
			prodDTO.setPageBlock(pageBlock);
			prodDTO.setStartPage(startPage);
			prodDTO.setEndPage(endPage);
			prodDTO.setPageCount(pageCount);
			// ---------------- 페이징 처리 끝

			// 데이터 담기
			mv.addObject("cd", cd);
			mv.addObject("prodList", prodList);
			mv.addObject("prodDTO", prodDTO);
			mv.setViewName("product/shop");

			return mv;
		}catch (Exception e) {
			e.printStackTrace();
		}
		return null;

	}

	// 상품페이지 Ajax
	@RequestMapping(value = "/product/shopAjax", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> listAjax(HttpServletRequest req, HttpServletResponse res, @ModelAttribute ProdDTO prodDTO) {
		Map<String, Object> map = new HashMap<>();
		String category = req.getParameter("category");
		String srhText = req.getParameter("srhText");
		String pageNum = req.getParameter("pageNum");

		if(pageNum == null) {
			pageNum = "1";
		}
		int currentPage=Integer.parseInt(pageNum);

		prodDTO.setCurrentPage(currentPage);
		prodDTO.setPageSize(9);
		// ---------------- 페이징 처리(Ajax) 시작
		int pageSize = 9;
		int count = prodService.selectProdListCnt(prodDTO);
		int pageBlock = 3;
		int startPage = (currentPage-1)/pageBlock*pageBlock+1;
		int endPage=startPage+pageBlock-1;
		int pageCount=count / pageSize +(count % pageSize==0?0:1);
		if(endPage > pageCount){
			endPage = pageCount;
		}

		prodDTO.setCurrentPage(currentPage);
		prodDTO.setPageSize(9);
		prodDTO.setCount(count);
		prodDTO.setPageBlock(pageBlock);
		prodDTO.setStartPage(startPage);
		prodDTO.setEndPage(endPage);
		prodDTO.setPageCount(pageCount);

		prodDTO.setCategory(category);
		prodDTO.setSrhText(srhText);

		// ---------------- 페이징 처리(Ajax) 끝

		List<ProdDTO> prodList = prodService.selectProdList(prodDTO);

		map.put("prodList", prodList);
		map.put("prodDTO", prodDTO);

		return map;
	}

	// 상세화면
	@RequestMapping(value = "/product/details", method = RequestMethod.GET)
	public ModelAndView details(HttpServletRequest req, HttpServletResponse res,HttpSession session, @ModelAttribute ProdDTO prodDTO) throws Exception {
		try {
			ModelAndView mv = new ModelAndView();

			ProdDTO details = prodService.selectProdDetail(prodDTO);
			String userId = (String)session.getAttribute("userId");
			prodDTO.setUserId(userId);

			// 추천꺼 LIST
//			List<ProdDTO> prodList = prodService.selectProdList(prodDTO);

			mv.addObject("details", details);
			// 추천 꺼 만들기
			mv.addObject("prodDTO", prodDTO);
			mv.setViewName("product/details");

			return mv;
		}catch (Exception e) {
			e.printStackTrace();
		}
		return null;

	}

	// 리뷰창
	@RequestMapping(value = "/product/replyEnroll", method = RequestMethod.GET)
	public ModelAndView replyEnrollWindow(HttpServletRequest req, HttpServletResponse res,HttpSession session, @ModelAttribute ProdDTO prodDTO) throws Exception {
		try {
			ModelAndView mv = new ModelAndView();
			String userId = (String)session.getAttribute("userId");

			if(!"".equals(userId) && userId !=null) {
				mv.addObject("prodDTO", prodDTO);
				mv.setViewName("product/replyEnroll");
			}else {
				mv.setViewName("product/msg");
			}

			return mv;

		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;

	}

	// 댓글 등록 전 회원이 이전에 등록한 댓글이 있는지 확인하는 기능
	// 존재 : 1  /  존재x : 0
	@RequestMapping(value = "/product/check", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> replyCheck(HttpServletRequest req, HttpServletResponse res, ProdDTO prodDTO) {
		Map<String, Object> map = new HashMap<>();

		int check = prodService.checkReply(prodDTO);
		// 댓글 등록 전 회원이 이전에 등록한 댓글이 있는지 확인하는 기능
		if(check > 0) {
			map.put("code", "F"); // 이미 리뷰 쓴 경우
		}else {
			map.put("code", "S");
		}
		map.put("prodDTO", prodDTO);
		return map;
	}

	// 리뷰 등록
	@RequestMapping(value = "/product/enroll", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> enrollReply(HttpServletRequest req, HttpServletResponse res, ProdDTO prodDTO) {
		Map<String, Object> map = new HashMap<>();

		int check = prodService.checkReply(prodDTO);
		// 댓글 등록 전 회원이 이전에 등록한 댓글이 있는지 확인하는 기능
		if(check > 0) {
			map.put("check", "F"); // 이미 리뷰 쓴 경우
		}else {
			prodService.enrollReply(prodDTO); //insert
			ProdDTO reply =  prodService.getProdNumName(prodDTO);
			map.put("reply", reply);
			map.put("code", "S");
		}
		map.put("prodDTO", prodDTO);
		return map;
	}

}