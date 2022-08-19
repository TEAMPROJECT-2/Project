package com.itwillbs.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.domain.MemberDTO;
import com.itwillbs.service.MemberService;
import com.itwillbs.service.MemberServiceImpl;

@Controller
public class MemberController {
	
	// 멤버변수 (부모인터페이스변수) 객체생성 자동화 됨=> @Service MemberServiceImpl 찾아감 
//	MemberService memberService=new MemberServiceImpl();
	@Inject
	private MemberService memberService;

	//	가상주소 시작점 http://localhost:8080/myweb2/member/insert 
	
	
	@RequestMapping(value = "/main/main", method = RequestMethod.GET)
	public String indexMain() {
		return "main/main";
	}
	@RequestMapping(value = "/product/shop", method = RequestMethod.GET)
	public String productShop() {
		return "product/shop";
	}
	@RequestMapping(value = "/product/details", method = RequestMethod.GET)
	public String productDetail() {
		return "product/details";
	}
	
	@RequestMapping(value = "/food/shop", method = RequestMethod.GET)
	public String foodShop() {
		return "food/shop";
	}
	@RequestMapping(value = "/food/details", method = RequestMethod.GET)
	public String foodDetail() {
		return "food/details";
	}
	@RequestMapping(value = "/member/account-connections", method = RequestMethod.GET)
	public String memberAccountConnections() {
		return "member/account-connections";
	}
	@RequestMapping(value = "/member/account-modiify", method = RequestMethod.GET)
	public String memberAccountModiify() {
		return "member/account-modiify";
	}
	@RequestMapping(value = "/member/cards-basic", method = RequestMethod.GET)
	public String memberCardsBasic() {
		return "member/cards-basic";
	}
	@RequestMapping(value = "/member/form-layouts-horizontal", method = RequestMethod.GET)
	public String memberFormLayoutsHorizontal() {
		return "member/form-layouts-horizontal";
	}
	@RequestMapping(value = "/member/form-layouts-vertical", method = RequestMethod.GET)
	public String memberFormLayoutsVertical() {
		return "member/form-layouts-vertical";
	}
	@RequestMapping(value = "/member/forms-basic-inputs", method = RequestMethod.GET)
	public String memberFormBasicInputs() {
		return "member/forms-basic-inputs";
	}
	@RequestMapping(value = "/member/forms-input-groups", method = RequestMethod.GET)
	public String memberFormInputGroups() {
		return "member/forms-input-groups";
	}
	@RequestMapping(value = "/member/mypage", method = RequestMethod.GET)
	public String memberMypage() {
		return "member/mypage";
	}
	@RequestMapping(value = "/member/tables", method = RequestMethod.GET)
	public String memberTables() {
		return "member/tables";
	}
	@RequestMapping(value = "/member/ui-buttons", method = RequestMethod.GET)
	public String memberUiButtons() {
		return "member/ui-buttons";
	}
	@RequestMapping(value = "/member/ui-pagination", method = RequestMethod.GET)
	public String memberUiPagination() {
		return "member/ui-pagination";
	}
	
	
	
	@RequestMapping(value = "/order/cart", method = RequestMethod.GET)
	public String orderCart() {
		return "order/cart";
	}
	@RequestMapping(value = "/order/checkout", method = RequestMethod.GET)
	public String orderCheckout() {
		return "order/checkout";
	}
	
	
	
	
	
	
	
	@RequestMapping(value = "/member/insertPro", method = RequestMethod.POST)
	public String insertPro(MemberDTO memberDTO) {
		System.out.println("MemberController insertPro()");
		// 회원가입
		// 메서드 호출
		memberService.insertMember(memberDTO);
		
		// 주소변경 이동
		return "redirect:/member/login";
	}
	
	@RequestMapping(value = "/member/login", method = RequestMethod.GET)
	public String login() {
		return "member/loginForm";
	}
	
	@RequestMapping(value = "/member/loginPro", method = RequestMethod.POST)
	// jsp는 세션이 자동으로 만들어지지만 자바는 HttpSession으로 만들어야한다
	public String loginPro(MemberDTO memberDTO, HttpSession session) {
		System.out.println("MemberController loginPro()");
		// 메서드 호출
		MemberDTO memberDTO2=memberService.userCheck(memberDTO);
		if(memberDTO2!=null) {
			// 아이디 비밀번호가 일치하면 null 아닌 값이 들고오는
			// 세션값 생성 "id", id
			session.setAttribute("id", memberDTO.getId());
			
			// member/main 이동
			return "redirect:/member/main";
		}else {
			// null일 경우 아이디 비밀번호 틀림
			// "틀림" 뒤로이동
			// 주소변경없이 이동
			// WEB-INF/views/member/msg.jsp 이동
			return "/member/msg";
		}
	}
	//	가상주소 시작점 http://localhost:8080/myweb2/member/main
	@RequestMapping(value = "/member/main", method = RequestMethod.GET)
	public String main() {
		// 주소변경없이 이동
		// WEB-INF/views/member/insertForm.jsp 이동
		return "member/main";
	}
	
	//	가상주소 시작점 http://localhost:8080/myweb2/member/logout
	@RequestMapping(value = "/member/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		// 세션값 초기화
		session.invalidate();
		// /member/main 이동
		// 주소변경 이동
		return "redirect:/member/main";
	}
	
	//	가상주소 시작점 http://localhost:8080/myweb2/member/logout
	@RequestMapping(value = "/member/info", method = RequestMethod.GET)
	public String info(HttpSession session, Model model) {
//		// 세션값 가져오기
		String id=(String)session.getAttribute("id");
		// id에 대한 정보를 디비에 가져오기
		MemberDTO memberDTO = memberService.getMember(id);
		// 가져온 정보를 담아 info.jsp 이동
		model.addAttribute("",memberDTO);
		
//		// 주소변경없이 이동
		// WEB-INF/views/member/info.jsp 이동
		return "member/info";
	}
	
	
	
}
