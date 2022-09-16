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
import com.itwillbs.domain.CompDTO;
import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.ProdDTO;
import com.itwillbs.domain.ProdStockDTO;
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
	private CommonService commonService;

	// 관리자 페이지
	@RequestMapping(value = "/adminpage", method = RequestMethod.GET)
	public ModelAndView list(HttpServletRequest req, HttpServletResponse res,
							@ModelAttribute MemberDTO memberDTO,
							@ModelAttribute CompDTO compDTO) throws Exception {
		try {
			ModelAndView mv = new ModelAndView();
			// 일반 회원 수
			CommonDTO commonDTO =  new CommonDTO();
			commonDTO.setTableNm("USER_INFO"); 	// 기준 컬럼
			int userCount = commonService.getCount(commonDTO);
			mv.addObject("userCount", userCount);
			mv.setViewName("admin/adminpage");
			// 업체 수
			commonDTO.setTableNm("COMPANY_INFO"); 	// 기준 컬럼
			int compCount = commonService.getCount(commonDTO);
			mv.addObject("compCount", compCount);
			// 총 회원 수
			int totalMember = userCount+compCount;
			mv.addObject("totalMember",totalMember);
			return mv;
		}catch (Exception e) {
			e.printStackTrace();
		}
		return null;

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

	// 쿠폰 페이지
	@RequestMapping(value = "/admin/coupon", method = RequestMethod.GET)
	public String coupon() {
		return "admin/coupon";
	}


}
