package com.itwillbs.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.BoardDTO;
import com.itwillbs.domain.PageDTO;
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

	@Override
	public List<ReplyDTO> getReplyList(PageDTO pageDTO) {
		System.out.println("ReplyDAOImpl.getReplyList");
		return sqlSession.selectList(namespace+".getReplyList",pageDTO);
	}

	@Override
	public int getReplyCount() {
		return sqlSession.selectOne(namespace+".getReplyCount");
	}

	@Override
	public Integer getMaxNum() {
		return sqlSession.selectOne(namespace+".getMaxNum");
	}

	@Override
	public void Replydelete(ReplyDTO replyDTO) {
		sqlSession.delete(namespace+".Replydelete", replyDTO);
		
	}

	@Override
	public ReplyDTO rNumCheck(ReplyDTO replyDTO) {
		return sqlSession.selectOne(namespace+".rNumCheck", replyDTO);
	}



    	
	

}
