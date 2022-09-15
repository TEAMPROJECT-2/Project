package com.itwillbs.controller;

import java.lang.System.Logger;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwillbs.domain.LikeDTO;
import com.itwillbs.domain.MemberDTO;
import com.itwillbs.service.LikeService;

@Controller
public class LikeController {
	
	@Inject 
	
	private  LikeService likeService;
	
	  @RequestMapping(value = "/board/isnertLike", method = RequestMethod.GET)
	  public String isnertLike(HttpServletRequest request, HttpSession session,Model model) throws Exception { 
	  int boardNum = Integer.parseInt(request.getParameter("boardNum")); 
	  int check = 0;
	  LikeDTO likeDTO = new LikeDTO();
	  likeDTO.setBoardNum(Integer.parseInt(request.getParameter("boardNum")));
	  likeDTO.setUserId((String)session.getAttribute("userId"));
	  likeDTO.setLikeCheck(check);
	  
	  if(check == 0) {
		  likeService.insertLike(likeDTO);
		  check = 1;
	  }else {
		  likeService.deleteLike(likeDTO);
	  }
	  
	  
	  
	  return"redirect:/board/content?boardNum="+boardNum; 
	  }
	  
	  @RequestMapping(value = "/board/deleteLike", method = RequestMethod.GET)
	  public String deleteLike(HttpServletRequest request, HttpSession session,Model model) throws Exception { 
	  int boardNum = Integer.parseInt(request.getParameter("boardNum")); 
	  LikeDTO likeDTO = new LikeDTO();
	  likeDTO.setBoardNum(Integer.parseInt(request.getParameter("boardNum")));
	  likeDTO.setUserId((String)session.getAttribute("userId"));
	  
	  
	  likeService.deleteLike(likeDTO);
	  
	  return"redirect:/board/content?boardNum="+boardNum; 
	  }
	  
	  @RequestMapping(value = "/board/selectLike", method = RequestMethod.GET)
	  public String selectLike(HttpServletRequest request, HttpSession session,Model model) throws Exception { 
	  int boardNum = Integer.parseInt(request.getParameter("boardNum")); 
	  LikeDTO likeDTO = new LikeDTO();
	  likeDTO.setBoardNum(Integer.parseInt(request.getParameter("boardNum")));
	  likeDTO.setUserId((String)session.getAttribute("userId"));
	  
	  
	  likeService.deleteLike(likeDTO);
	  
	  return"redirect:/board/content?boardNum="+boardNum;
	  
	  }
	
	  
	
	
}
