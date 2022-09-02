package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.BoardDAO;
import com.itwillbs.dao.ReplyDAO;
import com.itwillbs.domain.BoardDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.ReplyDTO;

@Service
public class ReplyServiceImpl implements ReplyService {
	@Inject
	public ReplyDAO replyDAO;
	
	@Inject
	public BoardDAO boardDAO;
	

	@Override
	public int getBoardCount() {
		
		return boardDAO.getBoardCount();
	}

	@Override
	public List<BoardDTO> getBoardList(PageDTO pageDTO) {
		
		return boardDAO.getBoardList(pageDTO);
	}

	@Override
	public void insetreply(ReplyDTO replyDTO) {
		replyDAO.insetreply(replyDTO);
		
	}

	
	
	
}
