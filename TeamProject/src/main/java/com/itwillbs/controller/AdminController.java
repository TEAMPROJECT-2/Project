package com.itwillbs.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AdminController {
	
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
