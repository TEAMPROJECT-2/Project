package com.itwillbs.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.domain.MemberDTO;
import com.itwillbs.service.PointService;

@Controller
public class PointController {
	
	@Inject
	private PointService pointService;
	
	@RequestMapping(value = "/point/point", method = RequestMethod.GET)
	public String point() {
		return "point/point";
	}
	
	@RequestMapping(value = "/point/pointPro", method = RequestMethod.POST)
	public String pointPro(MemberDTO memberDTO,Model model) {
		
		pointService.updatePoint(memberDTO);
		model.addAttribute("memberDTO", memberDTO);
		// 주소변경 이동
		return "redirect:/point/point";
	}
	
//	@RequestMapping(value = "/member/update", method = RequestMethod.GET)
//	public String update(HttpSession session,Model model) {
//		//세션값 가져오기
//		String id=(String)session.getAttribute("id");
//		//id에 대한 정보를 디비에서 가져오기
//		MemberDTO memberDTO=memberService.getMember(id);
//		// 가져온 정보를 담아서 info.jsp 이동
//		model.addAttribute("memberDTO", memberDTO);
//		
//		// 주소변경없이 이동
//		// WEB-INF/views/member/updateForm.jsp 이동
//		return "member/updateForm";
//	}
//	
//	@RequestMapping(value = "/member/updatePro", method = RequestMethod.POST)
//	public String updatePro(MemberDTO memberDTO, HttpSession session) {
//		System.out.println("MemberController updatePro()");
//		// 메서드 호출
//		MemberDTO memberDTO2=memberService.userCheck(memberDTO);
//		if(memberDTO2!=null) {
//			//아이디 비밀번호 일치
//			// 수정작업
//			memberService.updateMember(memberDTO);
//			// /member/main 이동
//			// 주소변경 이동
//			return "redirect:/member/main";
//		}else {
//			//아이디 비밀번호 틀림
//			// "틀림" 뒤로이동
//			// 주소변경없이 이동
//			// WEB-INF/views/member/msg.jsp 이동
//			return "member/msg";
//		}
//	}
	
	
	
}
