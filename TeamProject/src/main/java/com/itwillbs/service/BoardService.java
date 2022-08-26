package com.itwillbs.service;

import java.util.List;

import com.itwillbs.domain.BoardDTO;
import com.itwillbs.domain.PageDTO;

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
	
}
