package com.itwillbs.controller;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.itwillbs.domain.BoardDTO;
import com.itwillbs.domain.LikeDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.service.BoardService;

@Controller
public class BoardController {

	//객체생성 부모인터페이스 = 자식클래스
	@Inject
	private BoardService boardService;
	
	//업로드 경로 servlet-context.mxl upload폴더 경로 이름
	@Resource(name = "uploadPath")
	private String uploadPath;
	
	//	가상주소 시작점 http://localhost:8080/myweb2/board/write 
	
	//	가상주소 시작점 http://localhost:8080/myweb2/board/list
    //	가상주소 시작점 http://localhost:8080/myweb2/board/list?pageNum=2 
	@RequestMapping(value = "/board/list", method = RequestMethod.GET)
	public String list(HttpServletRequest request, Model model) {
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
		
		List<BoardDTO> boardList=boardService.getBoardList(pageDTO);
		
		// pageBlock  startPage endPage count pageCount
		int count=boardService.getBoardCount();
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
		
		//데이터 담아서 list.jsp 이동
		model.addAttribute("boardList", boardList);
		model.addAttribute("pageDTO", pageDTO);
		
		// 주소변경없이 이동
		// WEB-INF/views/board/list.jsp 이동
		return "/board/list";
	}
	
	//	가상주소 시작점 http://localhost:8080/myweb2/board/fwrite 
	@RequestMapping(value = "/board/fwrite", method = RequestMethod.GET)
	public String finsert() {
		// 주소변경없이 이동
		// WEB-INF/views/board/fwriteForm.jsp 이동
		return "/board/fwriteForm";
	}
	
	//가상주소 시작점 http://localhost:8080/myweb2/board/fwritePro
	@RequestMapping(value = "/board/fwritePro", method = RequestMethod.POST)
	public String fwritePro(HttpServletRequest request,MultipartFile file) throws Exception {
		
		//파일 이름  => 랜덤문자_파일이름 
		UUID uuid=UUID.randomUUID();
		String filename=uuid.toString()+"_"+file.getOriginalFilename();
		
		//업로드파일 file.getBytes() => upload/랜덤문자_파일이름 복사
		File uploadFile=new File(uploadPath,filename);
		
		FileCopyUtils.copy(file.getBytes(), uploadFile);
		
		BoardDTO boardDTO=new BoardDTO();
		boardDTO.setUserNicknm(request.getParameter("userNicknm"));
		boardDTO.setBoardPass(request.getParameter("boardPass"));
		boardDTO.setBoardSubject(request.getParameter("boardSubject"));
		boardDTO.setBoardContent(request.getParameter("boardContent"));
		boardDTO.setBoardFile(filename);
		
		boardService.insertBoard(boardDTO);
		
		// 주소변경하면서 이동 /board/list 이동
		return "redirect:/board/list";
	}
//	가상주소 시작점 http://localhost:8080/myweb2/board/content?num=2
	@RequestMapping(value = "/board/content", method = RequestMethod.GET)
	public String content(HttpServletRequest request, Model model) {
		//파라미터 가져오기
		int boardNum=Integer.parseInt(request.getParameter("boardNum"));
		// 디비에서 조회
		BoardDTO boardDTO=boardService.getBoard(boardNum);
		
		// model에 데이터 저장
		model.addAttribute("boardDTO", boardDTO);
		
		// 주소변경없이 이동
		// WEB-INF/views/board/content.jsp 이동
		return "/board/content";
	}
	
	//	가상주소 시작점 http://localhost:8080/myweb2/board/update?num=2
	@RequestMapping(value = "/board/update", method = RequestMethod.GET)
	public String update(HttpServletRequest request, Model model) {
		//파라미터 가져오기
		int boardNum=Integer.parseInt(request.getParameter("boardNum"));
		// 디비에서 조회
		BoardDTO boardDTO=boardService.getBoard(boardNum);
		
		// model에 데이터 저장
		model.addAttribute("boardDTO", boardDTO);
		
		// 주소변경없이 이동
		// WEB-INF/views/board/updateForm.jsp 이동
		return "/board/updateForm";
	}
	
	//가상주소 시작점 http://localhost:8080/myweb2/board/updatePro
	@RequestMapping(value = "/board/updatePro", method = RequestMethod.POST)
	public String updatePro(HttpServletRequest request,MultipartFile file) throws Exception {
		String filename = "";
		if(file.isEmpty()) {
			filename=request.getParameter("oldfile");
		}else {
			UUID uuid=UUID.randomUUID();
			filename=uuid.toString()+"_"+file.getOriginalFilename();
			
			//업로드파일 file.getBytes() => upload/랜덤문자_파일이름 복사
			File uploadFile=new File(uploadPath,filename);
			
			FileCopyUtils.copy(file.getBytes(), uploadFile);
		}
				
				BoardDTO boardDTO=new BoardDTO();
				boardDTO.setBoardNum(Integer.parseInt(request.getParameter("boardNum")));
				boardDTO.setUserNicknm(request.getParameter("userNicknm"));
				boardDTO.setBoardPass(request.getParameter("boardPass"));
				boardDTO.setBoardSubject(request.getParameter("boardSubject"));
				boardDTO.setBoardContent(request.getParameter("boardContent"));
				boardDTO.setBoardFile(filename);
				
				
		
		//num pass 일치 확인
		BoardDTO boardDTO2=boardService.numCheck(boardDTO);
		if(boardDTO2!=null) {
//			num pass 일치
			boardService.updateBoard(boardDTO);
			boardService.updateFile(boardDTO);
			// 주소변경하면서 이동 /board/list 이동
			return "redirect:/board/list";
		}else {
			//num pass 틀림
			// "틀림" 뒤로이동
			// 주소변경없이 이동
			// WEB-INF/views/board/msg.jsp 이동
			return "board/msg";
		}
	}
	@RequestMapping(value = "/board/delete", method = RequestMethod.GET)
	public String delete(HttpServletRequest request, Model model) {
		//파라미터 가져오기
		int boardNum=Integer.parseInt(request.getParameter("boardNum"));
		
		// model에 데이터 저장
		model.addAttribute("boardNum", boardNum);
		
		// 주소변경없이 이동
		// WEB-INF/views/board/deleteForm.jsp 이동
		return "/board/deleteForm";
	}

	
	//가상주소 시작점 http://localhost:8080/myweb2/board/deletePro
	@RequestMapping(value = "/board/deletePro", method = RequestMethod.POST)
	public String deletePro(BoardDTO boardDTO) {
		//num pass 일치 확인
		BoardDTO boardDTO2=boardService.numCheck(boardDTO);
		if(boardDTO2!=null) {
//			num pass 일치
			boardService.deleteBoard(boardDTO);
			// 주소변경하면서 이동 /board/list 이동
			return "redirect:/board/list";
		}else {
			//num pass 틀림
			// "틀림" 뒤로이동
			// 주소변경없이 이동
			// WEB-INF/views/board/msg.jsp 이동
			return "board/msg";
	
		}
	
	
	}
	@RequestMapping(value = "/board/likePro", method = RequestMethod.POST)
	public String likePro(HttpServletRequest request, Model model) {
		
		LikeDTO likeDTO=new LikeDTO();
		likeDTO.setBoardNum(Integer.parseInt(request.getParameter("boardNum")));
		likeDTO.setUserNum(Integer.parseInt(request.getParameter("userNum")));
		likeDTO.setBoardNum(Integer.parseInt(request.getParameter("LikeNum")));
		LikeDTO likeDTO2=boardService.countLike(likeDTO);
		
		
		
		return "redirect:/board/list";
	}
	
	
	
	
	
	
	
	
	
}
