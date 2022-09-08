package com.itwillbs.service;

import java.util.List;

import com.itwillbs.domain.BoardDTO;
import com.itwillbs.domain.LikeDTO;
import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.ReplyDTO;

public interface BoardService {
	//추상메서드
	void insertBoard(BoardDTO boardDTO);

	List<BoardDTO> getBoardList(PageDTO pageDTO);

	int getBoardCount();
	
	BoardDTO getBoard(int boardNum);
	
//	BoardDTO boardDTO2=boardService.numCheck(boardDTO);
	BoardDTO numCheck(BoardDTO boardDTO);
	
//	boardService.updateBoard(boardDTO);
	void updateBoard(BoardDTO boardDTO);

	void updateFile(BoardDTO boardDTO);
	
	void deleteBoard(BoardDTO boardDTO);

	void insertLike(LikeDTO likeDTO);

	void updateLike(LikeDTO likeDTO);

	void updateLikeCheck(LikeDTO likeDTO);

	void updateLikeCheckCancel(LikeDTO likeDTO);

	void updateLikeCancel(LikeDTO likeDTO);

	void deleteLike(LikeDTO likeDTO);

	int likeCheck(LikeDTO likeDTO);

	BoardDTO PassCheck(BoardDTO boardDTO);


	

}
