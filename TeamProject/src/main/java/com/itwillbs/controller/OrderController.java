package com.itwillbs.controller;


import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.domain.AddressDTO;
import com.itwillbs.domain.BasketDTO;
import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.OrderDTO;
import com.itwillbs.domain.PointDTO;
import com.itwillbs.domain.ProdDTO;
import com.itwillbs.service.AddressService;
import com.itwillbs.service.BasketService;
import com.itwillbs.service.MemberService;
import com.itwillbs.service.PointService;
//import com.itwillbs.service.OrderService;
//import com.itwillbs.service.ProdService;


@Controller
public class OrderController {

	@Inject
	private AddressService addressService;

	@Inject
	private MemberService memberService;

	@Inject
	private BasketService basketService;
	
	@Inject
	private PointService pointService;
	
	
	
	@RequestMapping(value = "/order/checkout", method = RequestMethod.GET)
	public String orderCheckout(HttpSession session, Model model, @ModelAttribute BasketDTO basketDTO, @ModelAttribute ProdDTO prodDTO, @ModelAttribute PointDTO pointDTO, @ModelAttribute OrderDTO orderDTO) {
		String userId = (String) session.getAttribute("userId");
		basketDTO.setSbUser(userId);
		pointDTO.setUserId(userId);
		AddressDTO addressDTO = addressService.getAddress(userId);
		MemberDTO memberDTO = memberService.getMember(userId);
		List<BasketDTO> basketList=basketService.getBasketList(basketDTO);
		PointDTO pointDTO2 = pointService.getMember(userId);	
		
		
		// 상품 가격 총합
		int total = 0;
		for(BasketDTO dto : basketList) {
			total+=dto.getSbProdPrice() * dto.getSbCount();
		}
		
		model.addAttribute("addressDTO", addressDTO);
		model.addAttribute("memberDTO", memberDTO);
		model.addAttribute("basketList", basketList);
		model.addAttribute("total", total);
		model.addAttribute("pointDTO2", pointDTO2);
		return "order/checkout";
	}
		
}
