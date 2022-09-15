package com.itwillbs.service;

import com.itwillbs.domain.LikeDTO;

public interface LikeService {

	

	
	LikeDTO likeCheck(LikeDTO likeDTO);

	void insertLike(LikeDTO likeDTO);

	void deleteLike(LikeDTO likeDTO);


	
		
}
