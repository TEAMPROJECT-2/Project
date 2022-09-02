package com.itwillbs.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.BoardDTO;
import com.itwillbs.domain.ReplyDTO;

@Repository
public class ReplyDAOImpl implements ReplyDAO{
	
	@Inject
	SqlSession sqlSession;
	
	private static final String namespace="com.itwillbs.mappers.replyMapper";
	
	@Override
	public void insetreply(ReplyDTO replyDTO) {
		sqlSession.insert(namespace+".replyinsert", replyDTO);
	}



	
	

}
