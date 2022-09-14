package com.itwillbs.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwillbs.domain.BasketDTO;
import com.itwillbs.domain.ProdDTO;
import com.itwillbs.service.BasketService;

@Controller
public class BasketController {
	@Inject
	private BasketService basketService;

	@RequestMapping(value = "/order/cart", method = RequestMethod.GET)
	public String orderCartList(HttpServletRequest request, Model model,HttpSession session,@ModelAttribute BasketDTO basketDTO) {
		String userId = (String)session.getAttribute("userId");
		basketDTO.setSbUser(userId);

		List<BasketDTO> basketList=basketService.getBasketList(basketDTO); // 물건 리스트 갖고오기
		model.addAttribute("basketList", basketList);

		return "order/cart";

	}

	@ResponseBody
	@RequestMapping(value = "/product/cartPro", method = RequestMethod.POST)
	public ResponseEntity<String> orderCart(HttpSession session,HttpServletRequest request,BasketDTO basketDTO) throws Exception {
		String userId = (String)session.getAttribute("userId");

		basketDTO.setSbCount(basketDTO.getSbCount());
		basketDTO.setSbUser(userId);
		basketService.insertBasket(basketDTO);



		//		if (userId == null) {
//			return "board/msg";
//		}
//		else if(userId != null){
//		      basketDTO.setSbUser(userId);
//		      if(basketService.getMemberchk(basketDTO) != null) {
//		    	  return "2";
//		      }
//		      basketService.insertBasket(basketDTO);
//		}
		ResponseEntity<String> entity=new ResponseEntity<String>("1" ,HttpStatus.OK);
		return entity;

	}
	// 주문인서트 구현
			@RequestMapping(value = "/order/insertOrder", method = RequestMethod.POST)
			public String insertOrder (HttpSession session,HttpServletRequest request,BasketDTO basketDTO) {
				String[] sbProdCode=request.getParameterValues("CheckRow");
				String[] sbCount=request.getParameterValues("sbCount");
				String[] sbProdPrice=request.getParameterValues("sbProdPrice");
				String userId = (String)session.getAttribute("userId");

				for(int i =0 ; i < sbProdCode.length;i++ ) {
					basketDTO.setSbProdCode(sbProdCode[i]);
					basketDTO.setSbCount(Integer.parseInt(sbCount[i]));
					basketDTO.setSbProdPrice(Integer.parseInt(sbProdPrice[i]));
					System.out.println(sbCount[i]);
					System.out.println(sbProdPrice[i]);
					basketDTO.setSbUser(userId);
					basketService.insertOrder(basketDTO);
					basketService.deleteBasket(basketDTO);
				}


				return "redirect:/order/cart";
			}


}
