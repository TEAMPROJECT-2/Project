package com.itwillbs.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwillbs.domain.CompDTO;
import com.itwillbs.domain.MemberDTO;
import com.itwillbs.mail.MailUtils;
import com.itwillbs.mail.TempKey;
import com.itwillbs.service.MemberService;

@Controller
public class MypageController {

	@Inject
	private MemberService memberService;


	// 마이페이지
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public String mypage() {
		return "mypage/mypage";
	}

	// 마이페이지 - 회원정보수정
	@RequestMapping(value = "/mypage/modify", method = RequestMethod.GET)
	public String modify(HttpSession session, Model model) {
		// 세션값 가져오기
		String userId=(String)session.getAttribute("userId");
		// id에 대한 정보를 디비에 가져오기
		MemberDTO memberDTO = memberService.getMember(userId);
		// 가져온 정보를 담아 info.jsp 이동
		model.addAttribute("memberDTO", memberDTO);

		// 주소변경없이 이동
		// WEB-INF/views/member/info.jsp 이동
		return "mypage/userModify";
	}
	@RequestMapping(value = "/mypage/modifyPro", method = RequestMethod.POST)
	public String modifyPro(MemberDTO memberDTO, HttpSession session) {
		// 메서드 호출
		MemberDTO memberDTO2=memberService.userCheck(memberDTO);
		System.out.println("MemberController updatePro()"+memberDTO2);
		if(memberDTO2!=null) {
			//아이디 비밀번호 일치
			// 수정작업
			memberService.modUser(memberDTO);
			// 주소변경 이동
			return "redirect:/mains/main";
		}else {
			//아이디 비밀번호 틀림
			return "mypage/msg";
		}
	}

	// 회원탈퇴
	@RequestMapping(value = "/mypage/delete", method = RequestMethod.GET)
	public String delete(HttpSession session, Model model) {

		// 주소변경없이 이동
		// WEB-INF/views/member/delete.jsp 이동
		return "mypage/deleteForm";
	}

	@RequestMapping(value = "/mypage/deletePro", method = RequestMethod.POST)
	public String deletePro(MemberDTO memberDTO, HttpSession session) {
		System.out.println("MemberController deletePro()");
		// 메서드 호출
		MemberDTO memberDTO2=memberService.userCheck(memberDTO);
		if(memberDTO2!=null) {
			//아이디 비밀번호 일치
			// 수정작업
			memberService.delUser(memberDTO);
			// 세션값 초기화
			session.invalidate();
			// /member/main 이동
			// 주소변경 이동
			return "redirect:/member/main";
		}else {
			//아이디 비밀번호 틀림
			return "member/msg";
		}
	}


	// 마이페이지 - 회원연결정보
	@RequestMapping(value = "/mypage/connection", method = RequestMethod.GET)
	public String connection() {
		return "mypage/userConnection";
	}

	// 마이페이지 - 배송지 관리
	@RequestMapping(value = "/mypage/addr", method = RequestMethod.GET)
	public String address() {
		return "mypage/userAddress";
	}

	// 마이페이지 - 포인트
	@RequestMapping(value = "/mypage/point", method = RequestMethod.GET)
	public String point() {
		return "mypage/userPoint";
	}


	@RequestMapping(value = "/mypage/info", method = RequestMethod.GET)
	public String info(HttpSession session, Model model) {
//		// 세션값 가져오기
		String userId=(String)session.getAttribute("userId");
		// id에 대한 정보를 디비에 가져오기
		MemberDTO memberDTO = memberService.getMember(userId);
		// 가져온 정보를 담아 info.jsp 이동
		model.addAttribute("memberDTO",memberDTO);

//		// 주소변경없이 이동
		// WEB-INF/views/member/info.jsp 이동
		return "member/info";
	}



}
