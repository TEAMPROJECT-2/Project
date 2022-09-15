package com.itwillbs.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.LikeDAO;
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
		
		likeDTO.setLikeNum(0);
		if(likeDAO.likeMaxNum()==null) {
			likeDTO.setLikeNum(1);
		}else {
			likeDTO.setLikeNum(likeDAO.likeMaxNum() + 1);
		}
		
		likeDAO.insertLike(likeDTO);
		
	}



	@Override
	public void deleteLike(LikeDTO likeDTO) {
		likeDAO.deleteLike(likeDTO);
		
	}

	
	
	
		
		
		
	

	
}
