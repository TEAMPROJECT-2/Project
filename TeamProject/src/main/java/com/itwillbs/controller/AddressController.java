package com.itwillbs.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.dao.AddressDAO;
import com.itwillbs.domain.AddressDTO;
import com.itwillbs.domain.MemberDTO;
import com.itwillbs.service.AddressService;
import com.itwillbs.service.MemberService;

@Controller
public class AddressController {

	@Inject
	private AddressService addressService;

	@Inject
	private MemberService memberService;



//	@RequestMapping(value = "/order/changeAddress", method = RequestMethod.GET)
//	public String changeAddress(HttpSession session, Model model) {
//		String userId = (String) session.getAttribute("userId");
//		MemberDTO memberDTO = memberService.getMember(userId);
//		model.addAttribute("memberDTO", memberDTO);
//		
//		return "order/changeAddress";
//	}

	@RequestMapping(value = "/order/changeAddressPro", method = RequestMethod.POST)
	public String changeAddressPro(@ModelAttribute AddressDTO addressDTO, HttpSession session) {
		return "redirect:/order/checkout";
	}

	@RequestMapping(value = "/order/newAddress", method = RequestMethod.GET)
	public String newAddress(HttpServletRequest request, Model model) {
		return "order/newAddress";
	}

	@RequestMapping(value = "/order/insertAddress", method = RequestMethod.POST)
	public String insertAddress(AddressDTO addressDTO, HttpSession session) {
		String userId = (String) session.getAttribute("userId");
		addressDTO.setUserId(userId);
		addressService.insertAddress(addressDTO);
		return "redirect:/mypage/addr";
	}
	
	@RequestMapping(value = "/order/insertAddress2", method = RequestMethod.POST)
	public String insertAddress2(AddressDTO addressDTO, HttpSession session) {
		String userId = (String) session.getAttribute("userId");
		addressDTO.setUserId(userId);
		addressService.insertAddress(addressDTO);
		return "/order/checkout";
	}

	@RequestMapping(value = "/order/updateAddress", method = RequestMethod.GET)
	public String updateAddress(HttpSession session, Model model) {
		String userId = (String) session.getAttribute("userId");
		AddressDTO addressDTO = addressService.getAddress(userId);
		MemberDTO memberDTO = memberService.getMember(userId);
		model.addAttribute("addressDTO", addressDTO);
		model.addAttribute("memberDTO", memberDTO);

		return "mypage/userAddress";
	}

	@RequestMapping(value = "/order/updateAddressPro", method = RequestMethod.POST)
	public String updateAddressPro(AddressDTO addressDTO, HttpSession session) {
		String userId = (String) session.getAttribute("userId");
		addressDTO.setUserId(userId);
		System.out.println(addressDTO.getAddress());
		System.out.println(addressDTO.getUserId());
		addressService.updateAddress(addressDTO);

		return "redirect:/mypage/addr";
	}
	
	@RequestMapping(value = "/order/updateAddressPro2", method = RequestMethod.POST)
	public String updateAddressPro2(AddressDTO addressDTO, HttpSession session) {
		String userId = (String) session.getAttribute("userId");
		addressDTO.setUserId(userId);
		System.out.println(addressDTO.getAddress());
		System.out.println(addressDTO.getUserId());
		addressService.updateAddress(addressDTO);
		
		return "redirect:/order/checkout";
	}
	
	@RequestMapping(value = "/mypage/addr", method = RequestMethod.GET)
	public String userAddress(HttpSession session, Model model) {
		String userId = (String) session.getAttribute("userId");
		AddressDTO addressDTO = addressService.getAddress(userId);
		MemberDTO memberDTO = memberService.getMember(userId);
		model.addAttribute("addressDTO", addressDTO);
		model.addAttribute("memberDTO", memberDTO);
		
		return "mypage/userAddress";
	}

//	@RequestMapping(value = "/order/getAddressList", method = RequestMethod.GET)
//	public String getAddressList(@PathVariable(value = "num") int num, Model model) throws Exception {
//		List<AddressDTO> addressList = addressService.getAddressList(num);
//
//
//		model.addAttribute("addressList", addressList);
//		return "";
//	}

}
