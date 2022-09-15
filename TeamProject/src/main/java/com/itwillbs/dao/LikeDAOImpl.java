package com.itwillbs.dao;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.LikeDTO;

@Repository
public class LikeDAOImpl implements LikeDAO {
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace="com.itwillbs.mappers.likeMapper";



	@Override
	public LikeDTO likeCheck(LikeDTO likeDTO) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".likeCheck", likeDTO);
	}



	@Override
	public void insertLike(LikeDTO likeDTO) {
		
			
		
		
		sqlSession.insert(namespace+".insertLike", likeDTO);
		
	}



	@Override
	public void deleteLike(LikeDTO likeDTO) {
		sqlSession.delete(namespace+".deleteLike", likeDTO);
		
	}



	@Override
	public Integer likeMaxNum() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".likeMaxNum");
	}

	
	
	
	
}
