package com.itwillbs.dao;

import java.util.List;

import com.itwillbs.domain.BoardDTO;
import com.itwillbs.domain.LikeDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.ReplyDTO;

public interface BoardDAO {
	//추상메서드 
	void insertBoard(BoardDTO boardDTO);
	
	Integer getMaxNum();

	List<BoardDTO> getBoardList(PageDTO pageDTO);

	int getBoardCount();
	
	BoardDTO getBoard(int boardNum);

	BoardDTO numCheck(BoardDTO boardDTO);

	void updateBoard(BoardDTO boardDTO);

	void updateFile(BoardDTO boardDTO);
	
	void deleteBoard(BoardDTO boardDTO);

	void updateLike(LikeDTO likeDTO);

	void updateLikeCancel(LikeDTO likeDTO);

	void insertLike(LikeDTO likeDTO);

	void deleteLike(LikeDTO likeDTO);

	int likeCheck(LikeDTO likeDTO);

	void updateLikeCheck(LikeDTO likeDTO);

	void updateLikeCheckCancel(LikeDTO likeDTO);



	
	
}
