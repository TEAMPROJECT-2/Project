package com.itwillbs.controller;


import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.ProdDTO;
import com.itwillbs.service.AdminService;
import com.itwillbs.service.MemberService;

@Controller
public class AdminController {
	
	@Inject
	private AdminService adminService;
	
	@RequestMapping(value = "/admin/adminMain", method = RequestMethod.GET)
	public String adminAdinMain() {
		return "admin/adminMain";
	}
	@RequestMapping(value = "/admin/updateProd", method = RequestMethod.GET)
	public String adminUpdateProd() {
		return "admin/updateProd";
	}
	@RequestMapping(value = "/admin/insertProd", method = RequestMethod.GET)
	public String adminInsertProd() {
		return "admin/insertProd";
	}
	
	@RequestMapping(value = "/admin/insertProdPro", method = RequestMethod.POST)
	public String insertPro(ProdDTO prodDTO) {
		System.out.println("MemberController insertProProd()");
		// 메서드 호출
		adminService.insertProd(prodDTO);
		
		// 주소변경 이동
		return "redirect:/admin/insertProd";
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
