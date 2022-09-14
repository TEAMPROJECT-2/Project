package com.itwillbs.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itwillbs.service.ApiService;

@Controller
@RequestMapping("/member")
	public class ApiController {

	    @Autowired
	    ApiService ks;

//	    @GetMapping("/do")
//	    public String loginPage()
//	    {
//	        return "kakaoCI/login";
//	    }
//
//	    @GetMapping("/kakao")
//	    public String getCI(@RequestParam String code, Model model) throws IOException {
//	        System.out.println("code = " + code);
//	        String access_token = ks.getToken(code);
//	        Map<String, Object> userInfo = ks.getUserInfo(access_token);
//	        model.addAttribute("code", code);
//	        model.addAttribute("access_token", access_token);
//	        model.addAttribute("userInfo", userInfo);
//
//	        //ci는 비즈니스 전환후 검수신청 -> 허락받아야 수집 가능
//	        return "index";
//	    }

}
