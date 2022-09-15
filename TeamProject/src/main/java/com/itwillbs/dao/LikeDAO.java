package com.itwillbs.dao;

import com.itwillbs.domain.LikeDTO;

public interface LikeDAO {

	



	LikeDTO likeCheck(LikeDTO likeDTO);

	void insertLike(LikeDTO likeDTO);

	void deleteLike(LikeDTO likeDTO);

	Integer likeMaxNum();


	

	



}
