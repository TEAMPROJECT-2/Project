package com.itwillbs.controller;


import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.domain.MemberDTO;
import com.itwillbs.service.MemberService;
//import com.itwillbs.service.OrderService;


@Controller
public class OrderController {
		
//		@Inject
//		private OrderService orderService;
//	
		
		
		
		@Inject
		private MemberService memberService;
	
		@RequestMapping(value = "/order/checkout", method = RequestMethod.GET)
		public String orderCheckout(HttpSession session, Model model) {
			String userId=(String)session.getAttribute("userId");
			MemberDTO memberDTO=memberService.getMember(userId);
			model.addAttribute("memberDTO", memberDTO);
			return "order/checkout";
		}
	
	
	
		@RequestMapping(value = "/order/changeAddress", method = RequestMethod.GET)
		public String changeAddress(HttpSession session, Model model) {
			String userId=(String)session.getAttribute("userId");
			MemberDTO memberDTO=memberService.getMember(userId);
			System.out.println(memberDTO.getUserId());
			model.addAttribute("memberDTO", memberDTO);
			return "order/changeAddress";
		}
		
		
		
		@RequestMapping(value = "/order/newAddress", method = RequestMethod.GET)
		public String newAddress(HttpServletRequest request, Model model) {
			return "order/newAddress";
		}
		
		@RequestMapping(value = "/order/updateAddress", method = RequestMethod.GET)
		public String updateAddress(HttpSession session, Model model) {
			String userId=(String)session.getAttribute("userId");
			MemberDTO memberDTO=memberService.getMember(userId);
			
			model.addAttribute("memberDTO", memberDTO);
			return "order/updateAddress";
		}

		
		
}
