package com.itwillbs.controller;


import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.ProdDTO;
import com.itwillbs.domain.ProdStockDTO;
import com.itwillbs.service.CompService;
import com.itwillbs.service.MemberService;

@Controller
public class CompController {
	
	@Inject
	private CompService compService;
	
	@RequestMapping(value = "/comp/compMain", method = RequestMethod.GET)
	public String compAdinMain() {
		return "comp/compMain";
	}
	@RequestMapping(value = "/comp/updateProd", method = RequestMethod.GET)
	public String compUpdateProd() {
		return "comp/updateProd";
	}
	@RequestMapping(value = "/comp/insertProd", method = RequestMethod.GET)
	public String compInsertProd() {
		return "comp/insertProd";
	}
	
	@RequestMapping(value = "/comp/insertProdPro", method = RequestMethod.POST)
	public String insertPro(ProdDTO prodDTO,ProdStockDTO proStockDTO) {
		// 메서드 호출
		proStockDTO.setProdSPnum(prodDTO.getProdLNum()); 
		compService.insertProd(prodDTO,proStockDTO);
		
		// 주소변경 이동
		return "redirect:/comp/insertProd";
	}
	@RequestMapping(value = "/comp/deleteProd", method = RequestMethod.GET)
	public String compDeleteProd() {
		return "comp/deleteProd";
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
