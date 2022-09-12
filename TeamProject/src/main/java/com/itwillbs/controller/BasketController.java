package com.itwillbs.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwillbs.domain.BasketDTO;
import com.itwillbs.service.BasketSerive;

@Controller
public class BasketController {
	@Inject
	private BasketSerive basketService;


	@ResponseBody
	@RequestMapping(value = "/order/cartPro", method = RequestMethod.POST)
	public String orderCart(HttpSession session,HttpServletRequest request,BasketDTO basketDTO) throws Exception {
		String userId = (String)session.getAttribute("userId");


		if (userId == null) {
			return "board/msg";
		}
		else if(userId != null){
		      basketDTO.setSbUser(userId);
		      if(basketService.getMemberchk(basketDTO) != null) {
		    	  return "2";
		      }
		      basketService.insertBasket(basketDTO);
		}
		return "1";

	}

}
