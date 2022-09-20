package com.itwillbs.controller;

import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.domain.MemberDTO;
import com.itwillbs.service.ApiService;
import com.itwillbs.service.MemberService;

@Controller
public class ApiController {

	@Inject
	private MemberService memberService;

	// 카카오 콜백
	@RequestMapping(value = "/auth/kakao", method = RequestMethod.GET)
	public String kakaoLogin(String code, HttpSession session, MemberDTO memberDTO) throws Exception{
		ApiService apiService = new ApiService();
		String token = apiService.getToken(code);
		Map<String, String> kakaoMap = apiService.getUserInfo(token);

		String userId = kakaoMap.get("user_id");
		String userNm = kakaoMap.get("user_name");
		String userType = kakaoMap.get("user_type");

		memberDTO.setUserId(userId);
		memberDTO.setUserNm(userNm);
		memberDTO.setUserType(userType);
		memberDTO.setUserKakaoLogin(1);

		sessionSet(session, memberDTO, userId, userNm, userType);

		return "redirect:/main/main";
	}

	// 카카오 회원가입
	private void sessionSet(HttpSession session, MemberDTO memberDTO, String user_id, String user_name, String user_type) throws Exception{
		memberDTO.setUserId(user_id);
		memberDTO.setUserNm(user_name);
		memberDTO.setUserType(user_type);
		MemberDTO mt=newMemberDTO(user_id, user_name, user_type);
		MemberDTO memberDTO2=memberService.userCheck(memberDTO);
		if(memberDTO2 == null) {
			memberService.insertMember(mt);
			memberDTO2.setUserId(user_id);
			memberDTO2.setUserNm(user_name);
			memberDTO2.setUserType(user_type);
		}
		session.setAttribute("userId", memberDTO.getUserId());
	}

	private MemberDTO newMemberDTO(String user_id, String user_name, String user_type) {

		MemberDTO memberDTO = new MemberDTO();
		if(user_name == null || "".equals(user_name)) {
			user_name = "익명";
		}
		memberDTO.setUserId(user_id);
		memberDTO.setUserNm(user_name);
		memberDTO.setUserType(user_type);
		return memberDTO;
	}

}