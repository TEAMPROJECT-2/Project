package com.itwillbs.controller;


import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.itwillbs.domain.CommonDTO;
import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.ProdDTO;
import com.itwillbs.domain.ProdStockDTO;
import com.itwillbs.service.AdminService;
import com.itwillbs.service.CommonService;
import com.itwillbs.service.CompService;
import com.itwillbs.service.MemberService;

@Controller
public class AdminController {

	@Inject
	private MemberService memberService;
	@Inject
	private CompService compService;
	@Inject
	private CommonService commonservice;

	// 관리자 페이지
	@RequestMapping(value = "/adminpage", method = RequestMethod.GET)
	public String adminPage() {
		return "admin/adminpage";
	}

	// 회원 리스트
//	@RequestMapping(value = "/admin/user", method = RequestMethod.GET)
//	public ModelAndView userList(HttpServletRequest req, HttpServletResponse res, @ModelAttribute MemberDTO memberDTO) throws Exception {

//		try {
//			ModelAndView mv = new ModelAndView();
//
//			//코드 생성 > "코드" + YYMMDD + max(000)+1
//			CommonDTO commonDTO =  new CommonDTO();
//			commonDTO.setColumnNum("USER_INFO_NUM");	// 기준 컬럼 정의
//			commonDTO.setTableNm("USER_INFO");		// 테이블 정의
//			CommonDTO cd = commonService.getList(commonDTO);
//			// 조회해온 코드값을 원하는 DTO에 Set 처리
//
//			List<CommonDTO> commonList =  commonService.selectCommonList(commonDTO);
//
//			int pageSize = 10;
//			String pageNum = prodDTO.getPageNum();
//			if(pageNum == null) {
//				pageNum = "1";
//			}
//			int currentPage=Integer.parseInt(pageNum);
//
//			int count = prodService.selectProdListCnt(prodDTO);
//			int pageBlock = 10;
//			int startPage = (currentPage-1)/pageBlock*pageBlock+1;
//			int endPage=startPage+pageBlock-1;
//			int pageCount=count / pageSize +(count % pageSize==0?0:1);
//			if(endPage > pageCount){
//				endPage = pageCount;
//			}
//
//			prodDTO.setCurrentPage(currentPage);
//			prodDTO.setPageSize(10);
//
//			List<ProdDTO> prodList = prodService.selectProdList(prodDTO);
//
//			prodDTO.setCount(count);
//			prodDTO.setPageBlock(pageBlock);
//			prodDTO.setStartPage(startPage);
//			prodDTO.setEndPage(endPage);
//			prodDTO.setPageCount(pageCount);
//
//			mv.addObject("cd", cd);
//			mv.addObject("prodList", prodList);
//			mv.addObject("prodDTO", prodDTO);
//			mv.setViewName("product/shop");
//
//			return mv;
//		}catch (Exception e) {
//			e.printStackTrace();
//		}
//		return null;

//		return "admin/userList";
//	}

	@RequestMapping(value = "/admin/insertProd", method = RequestMethod.GET)
	public String adminInsertProd() {
		return "admin/insertProd";
	}

	@RequestMapping(value = "/admin/deleteProd", method = RequestMethod.GET)
	public String adminDeleteProd() {
		return "admin/deleteProd";
	}

	@RequestMapping(value = "/admin/prodRefund", method = RequestMethod.GET)
	public String adminProdRefund() {
		return "admin/prodRefund";
	}
	@RequestMapping(value = "/admin/updateAccount", method = RequestMethod.GET)
	public String adminupdateAccount() {
		return "admin/updateAccount";
	}
	@RequestMapping(value = "/admin/prodList", method = RequestMethod.GET)
	public String adminProdList() {
		return "admin/prodList";
	}
	@RequestMapping(value = "/admin/ordList", method = RequestMethod.GET)
	public String adminOrdList() {
		return "admin/ordList";
	}

}
