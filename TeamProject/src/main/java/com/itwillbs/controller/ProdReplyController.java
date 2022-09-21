package com.itwillbs.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.itwillbs.domain.ProdReplyDTO;
import com.itwillbs.service.ProdReplyService;

@RestController
@RequestMapping("/reply")
public class ProdReplyController {

	@Autowired
	private ProdReplyService prodReplyService;

	/* 댓글 등록 */
	@RequestMapping(value = "/enroll", method = RequestMethod.POST)
	public void enrollReplyPOST(HttpServletRequest request, Model model, ProdReplyDTO dto) {
		prodReplyService.enrollReply(dto);
	}

}
