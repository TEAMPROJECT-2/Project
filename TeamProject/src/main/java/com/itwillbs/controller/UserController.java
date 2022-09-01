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
import com.itwillbs.service.UserService;

@Controller
public class UserController {

	@Inject
	private UserService userService;


	@RequestMapping(value = "/user/mypage", method = RequestMethod.GET)
	public String mypage() {
		return "user/mypage";
	}

	@RequestMapping(value = "/user/modify", method = RequestMethod.GET)
	public String Modify() {
		return "user/userModify";
	}

}
