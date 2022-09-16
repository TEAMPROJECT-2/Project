package com.itwillbs.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.LikeDAO;
import com.itwillbs.domain.BoardDTO;
import com.itwillbs.domain.LikeDTO;

@Service
public class LikeServiceImpl implements LikeService {
	@Inject
	public LikeDAO likeDAO;

	

	@Override
	public LikeDTO likeCheck(LikeDTO likeDTO) {
		// TODO Auto-generated method stub
		return likeDAO.likeCheck(likeDTO);
	}



	@Override
	public void insertLike(LikeDTO likeDTO) {
		
		
		likeDAO.insertLike(likeDTO);
		
	}



	@Override
	public void deleteLike(LikeDTO likeDTO) {
		likeDAO.deleteLike(likeDTO);
		
	}



	@Override
	public void updateLike(BoardDTO boardDTO) {
		likeDAO.updateLike(boardDTO);
		
	}



	@Override
	public void updateLikeCancel(BoardDTO boardDTO) {
		likeDAO.updateLikeCancel(boardDTO);
	}

	
	
	
		
		
		
	

	
}
