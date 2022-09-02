package com.itwillbs.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.itwillbs.domain.BoardDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.ReplyDTO;
import com.itwillbs.service.BoardService;
import com.itwillbs.service.ReplyService;

@Controller
public class ReplyController {

	//객체생성 부모인터페이스 = 자식클래스
	@Inject
	private  ReplyService replyService;
	
	
	@RequestMapping(value = "/board/isnertPro", method = RequestMethod.POST)
	public String isnertPro(HttpServletRequest request, HttpSession session,Model model) throws Exception {
		int boardNum = Integer.parseInt(request.getParameter("boardNum"));
		ReplyDTO replyDTO=new ReplyDTO();
		int count = 0;
		if() {
			
		}
		replyDTO.setrNum(1);
		replyDTO.setBoardNum(Integer.parseInt(request.getParameter("boardNum")));
		replyDTO.setUserId((String)session.getAttribute("userId"));
		replyDTO.setrContent(request.getParameter("rContent"));
		System.out.println(replyDTO.getBoardNum());
		System.out.println(replyDTO.getUserId());
		System.out.println(replyDTO.getrContent());
		
		replyService.insetreply(replyDTO);
		
		return "redirect:/board/content?boardNum="+boardNum;
	}
	
	
	
}
