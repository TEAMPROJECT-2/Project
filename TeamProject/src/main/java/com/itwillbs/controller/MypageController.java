package com.itwillbs.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.itwillbs.domain.BoardDTO;
import com.itwillbs.domain.CompDTO;
import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.PointDTO;
import com.itwillbs.mail.MailUtils;
import com.itwillbs.mail.TempKey;
import com.itwillbs.service.MemberService;
import com.itwillbs.service.PointService;

@Controller
public class MypageController {

	@Inject
	private MemberService memberService;
	@Inject
	private PointService pointService;


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
		if(memberDTO2!=null) {
			// 아이디 비밀번호 일치
			// 수정작업
			memberService.modUser(memberDTO);
			// 주소변경 이동
			return "redirect:/mypage/modify";
		}else {
			//아이디 비밀번호 틀림
			return "mypage/msg";
		}
	}

	// 마이페이지 - 비밀번호 변경 페이지
	@RequestMapping(value = "/mypage/passMod", method = RequestMethod.GET)
	public String passModify() {
		return "mypage/passModify";
	}

	// 비밀번호 변경
	@RequestMapping(value="/mypage/passModPro" , method=RequestMethod.POST)
	public String passMod(HttpSession session, HttpServletRequest request, MemberDTO memberDTO) throws Exception{
		String userPass=request.getParameter("newPass");
		memberDTO.setUserPass(userPass);
		String userId =(String)session.getAttribute("userId");
		memberDTO.setUserId(userId);
		memberService.passMod(memberDTO);
		session.invalidate();
//		("msg", "정보 수정이 완료되었습니다. 다시 로그인해주세요.");

		return "redirect:/member/login";
	}


	// 마이페이지 - 회원연결 정보
	@RequestMapping(value = "/mypage/connection", method = RequestMethod.GET)
	public String connection() {
		return "mypage/userConnection";
	}


	// 마이페이지 - 포인트
	@RequestMapping(value = "/mypage/point", method = RequestMethod.GET)
	public String point(HttpServletRequest request, Model model) {
		// 한화면에 보여줄 글개수
		int pageSize=10;
		//현페이지 번호
		String pageNum=request.getParameter("pageNum");
		if(pageNum==null) {
			pageNum="1";
		}
		//현페이지 번호를 정수형으로 변경
		int currentPage=Integer.parseInt(pageNum);
		// PageDTO 객체생성
		PageDTO pageDTO=new PageDTO();
		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);

		List<PointDTO> pointList=pointService.getPointList(pageDTO);

		// pageBlock  startPage endPage count pageCount
		int count=pointService.getPointCount();
		int pageBlock=10;
		int startPage=(currentPage-1)/pageBlock*pageBlock+1;
		int endPage=startPage+pageBlock-1;
		int pageCount=count / pageSize +(count % pageSize==0?0:1);
		if(endPage > pageCount){
			endPage = pageCount;
		}
		pageDTO.setCount(count);
		pageDTO.setPageBlock(pageBlock);
		pageDTO.setStartPage(startPage);
		pageDTO.setEndPage(endPage);
		pageDTO.setPageCount(pageCount);

		model.addAttribute("pointList", pointList);
		model.addAttribute("pageDTO", pageDTO);
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
		// WEB-INF/views/member/info.jsp 이동
		return "member/info";
	}



}
