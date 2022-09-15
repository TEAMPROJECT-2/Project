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

		replyDTO.setBoardNum(boardNum);
		replyDTO.setUserId((String)session.getAttribute("userId"));
		replyDTO.setrPass(request.getParameter("rPass"));
		replyDTO.setrContent(request.getParameter("rContent"));
		

		replyService.insetreply(replyDTO);



		return "redirect:/board/content?boardNum="+boardNum;
	}
	
	@RequestMapping(value = "/board/rdeletePro", method = RequestMethod.GET)
	public String deletePro2(HttpServletRequest request, HttpSession session,Model model) throws Exception {
		
		int boardNum = Integer.parseInt(request.getParameter("boardNum"));
		
		ReplyDTO replyDTO=new ReplyDTO();
		replyDTO.setUserId((String)session.getAttribute("userId"));
		replyDTO.setrNum(Integer.parseInt(request.getParameter("rNum")));
		
		
		
		model.addAttribute("boardNum", boardNum);
		
		
		ReplyDTO replyDTO2=replyService.rNumCheck(replyDTO);

		if(replyDTO2!=null) {
			replyService.Replydelete(replyDTO);
		}else {
			return "board/msg2";
		}




		return "redirect:/board/content?boardNum="+boardNum;
	}



	/*
	 * @RequestMapping(value = "/board/selectPro", method = RequestMethod.POST)
	 * public String selectPro(HttpServletRequest request, HttpSession session,Model
	 * model) throws Exception { int boardNum =
	 * Integer.parseInt(request.getParameter("boardNum")); int pageSize=10; //현페이지
	 * 번호 String pageNum=request.getParameter("pageNum"); if(pageNum==null) {
	 * pageNum="1"; } //현페이지 번호를 정수형으로 변경 int currentPage=Integer.parseInt(pageNum);
	 * // PageDTO 객체생성 PageDTO pageDTO=new PageDTO(); pageDTO.setPageSize(pageSize);
	 * pageDTO.setPageNum(pageNum); pageDTO.setCurrentPage(currentPage);
	 *
	 * List<ReplyDTO> replyList=replyService.getReplyList(pageDTO);
	 *
	 * // pageBlock startPage endPage count pageCount int
	 * count=replyService.getReplyCount(); int pageBlock=10; int
	 * startPage=(currentPage-1)/pageBlock*pageBlock+1; int
	 * endPage=startPage+pageBlock-1; int pageCount=count / pageSize +(count %
	 * pageSize==0?0:1); if(endPage > pageCount){ endPage = pageCount; }
	 *
	 * pageDTO.setCount(count); pageDTO.setPageBlock(pageBlock);
	 * pageDTO.setStartPage(startPage); pageDTO.setEndPage(endPage);
	 * pageDTO.setPageCount(pageCount);
	 *
	 * //데이터 담아서 list.jsp 이동 model.addAttribute("replyList", replyList);
	 * model.addAttribute("pageDTO", pageDTO);
	 *
	 * return "redirect:/board/content?boardNum="+boardNum; }
	 */



}
