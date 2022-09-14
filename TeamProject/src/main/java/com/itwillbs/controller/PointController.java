package com.itwillbs.controller;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.PointDTO;
import com.itwillbs.service.MemberService;
import com.itwillbs.service.PointService;


@Controller
public class PointController {
//	private IamportClient client = new IamportClient("6077548071335284", "dCktE2HC7a2YUwzkDWeeqfuZvZdDen3Sm66vMQja5xQTpoAsMz9YUPZ42kuSyxReMbEXbvtEvOjllVjQ");
//
//	@ResponseBody
//	@RequestMapping(value = "/verify_iamport/{imp_uid}", method = RequestMethod.POST)
//	public IamportResponse<Payment> verifyIamportPOST(@PathVariable(value = "imp_uid") String imp_uid) throws IamportResponseException, IOException {
//	    return client.paymentByImpUid(imp_uid);
//	}
	
	
	@Inject
	private PointService pointService;
	@Inject
	private MemberService memberService;
	
	@RequestMapping(value = "/point/charge", method = RequestMethod.GET)
	public String charge(HttpSession session, Model model) {
		String userId = (String)session.getAttribute("userId");
		if(userId==null) {
			return "/member/msg";
		} else {
		PointDTO pointDTO = pointService.getMember(userId);	
		MemberDTO memberDTO = memberService.getMember(userId); 
		model.addAttribute("memberDTO", memberDTO);
		model.addAttribute("pointDTO", pointDTO);
		return "point/charge";
		}
	}

	@RequestMapping(value = "/point/chargePro", method = RequestMethod.POST)
	public String chargePro(MemberDTO memberDTO, PointDTO pointDTO, HttpSession session) throws Exception {
		// 메서드 호출
		String userId = (String)session.getAttribute("userId");
		MemberDTO memberDTO2 = memberService.getMember(userId);
		if(memberDTO2!=null) {
			//아이디 비밀번호 일치
			// 수정작업
//			memberService.updatePoint(memberDTO);
			pointService.insertPoint(pointDTO);
			// /member/main 이동
			// 주소변경 이동
			return "redirect:/main/main";
		}else {
			//아이디 비밀번호 틀림
			// "틀림" 뒤로이동
			// 주소변경없이 이동
			// WEB-INF/views/member/msg.jsp 이동
			return "member/msg";
		}
	}


	
	
}
