package com.itwillbs.controller;

import java.io.File;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.itwillbs.domain.ProdDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.service.ProdService;

@Controller
public class ProdController {

	//객체생성 부모인터페이스 = 자식클래스
	@Inject
	private ProdService prodService;
	
	//업로드 경로 servlet-context.mxl upload폴더 경로 이름
	@Resource(name = "uploadPath")
	private String uploadPath;
	
	@RequestMapping(value = "/product/shop", method = RequestMethod.GET)
	public ModelAndView list(HttpServletRequest req, HttpServletResponse res, @ModelAttribute ProdDTO prodDTO) throws Exception {
		try {
			ModelAndView mv = new ModelAndView();
			
			int pageSize = 10;
			String pageNum = prodDTO.getPageNum();
			if(pageNum == null) {
				pageNum = "1";
			}
			int currentPage=Integer.parseInt(pageNum);
			
			int count = prodService.selectProdListCnt(prodDTO);
			int pageBlock = 10;
			int startPage = (currentPage-1)/pageBlock*pageBlock+1;
			int endPage=startPage+pageBlock-1;
			int pageCount=count / pageSize +(count % pageSize==0?0:1);
			if(endPage > pageCount){
				endPage = pageCount;
			}
			
			prodDTO.setCurrentPage(currentPage);
			prodDTO.setPageSize(10);
			
			List<ProdDTO> prodList =  prodService.selectProdList(prodDTO);
			
			prodDTO.setCount(count);
			prodDTO.setPageBlock(pageBlock);
			prodDTO.setStartPage(startPage);
			prodDTO.setEndPage(endPage);
			prodDTO.setPageCount(pageCount);
			
			mv.addObject("prodList", prodList);
			mv.addObject("prodDTO", prodDTO);
			mv.setViewName("product/shop");
			
			return mv;
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return null;
		
	}

	@RequestMapping(value = "/product/details", method = RequestMethod.GET)
	public String productDetail() {
		
		
		return "product/details";
	}
	
}
