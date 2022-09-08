package com.itwillbs.service;

import java.sql.Timestamp;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.BoardDAO;
import com.itwillbs.domain.BoardDTO;
import com.itwillbs.domain.LikeDTO;
import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.PageDTO;

@Service
public class BoardServiceImpl implements BoardService{

//	객체생성 부모=자식
	@Inject
	private BoardDAO boardDAO;
	private BoardDAO likeDAO;
	
	@Override
	public void insertBoard(BoardDTO boardDTO) {
		//폼에서 가져온값 name pass subject content
		// num,readcount,date
		boardDTO.setBoardRecount(0);
		boardDTO.setBoardDate(new Timestamp(System.currentTimeMillis()));
		// num = max(num)+1
		if(boardDAO.getMaxNum()==null) {
			//게시판 글이 없음
			boardDTO.setBoardNum(1);
		}else {
			boardDTO.setBoardNum(boardDAO.getMaxNum() + 1);
		}
		
		System.out.println(boardDTO);
		
		boardDAO.insertBoard(boardDTO);
	}

	@Override
	public List<BoardDTO> getBoardList(PageDTO pageDTO) {
		// pageSize  pageNum  currentPage
		int startRow=(pageDTO.getCurrentPage()-1)*pageDTO.getPageSize()+1;
		int endRow=startRow+pageDTO.getPageSize()-1;
		
		// sql => limit #{startRow -1}, #{pageSize}
		
		pageDTO.setStartRow(startRow-1);
		pageDTO.setEndRow(endRow);
		
		return boardDAO.getBoardList(pageDTO);
		
	}

	@Override
	public int getBoardCount() {
		return boardDAO.getBoardCount();
	}
	@Override
	public BoardDTO getBoard(int boardNum) {
		return boardDAO.getBoard(boardNum);
	}

	@Override
	public BoardDTO numCheck(BoardDTO boardDTO) {
		return boardDAO.numCheck(boardDTO);
	}

	@Override
	public void updateBoard(BoardDTO boardDTO) {
		boardDAO.updateBoard(boardDTO);
	}

	@Override
	public void updateFile(BoardDTO boardDTO) {
		boardDAO.updateFile(boardDTO);
		
	}
	
	@Override
	public void deleteBoard(BoardDTO boardDTO) {
		boardDAO.deleteBoard(boardDTO);
	}
	
	//like
	@Override
	public void updateLike(LikeDTO likeDTO){
		boardDAO.updateLike(likeDTO);
	}
	
	@Override
	public void updateLikeCancel(LikeDTO likeDTO){
		boardDAO.updateLikeCancel(likeDTO);
	}

	
	@Override
	public void insertLike(LikeDTO likeDTO){
		boardDAO.insertLike(likeDTO);
	}
	
	@Override
	public void deleteLike(LikeDTO likeDTO){
		boardDAO.deleteLike(likeDTO);
	}
	
	@Override
	public int likeCheck(LikeDTO likeDTO) {
		return boardDAO.likeCheck(likeDTO);
	}
	
	@Override
	public void updateLikeCheck(LikeDTO likeDTO){
		boardDAO.updateLikeCheck(likeDTO);
	}
	
	@Override
	public void updateLikeCheckCancel(LikeDTO likeDTO){
		boardDAO.updateLikeCheckCancel(likeDTO);
	}

	@Override
	public BoardDTO PassCheck(BoardDTO boardDTO) {
		// TODO Auto-generated method stub
		return boardDAO.PassCheck(boardDTO);
	}

	
	
	

}
