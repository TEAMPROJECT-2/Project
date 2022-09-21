package com.itwillbs.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.ProdReplyDTO;

@Repository
public class ProdReplyDAOImpl implements ProdReplyDAO{

	@Inject
	private SqlSession sqlSession;

	private static final String namespace="com.itwillbs.mappers.prodReplyMapper";

	@Override
	public int enrollReply(ProdReplyDTO prodReplyDTO) {
		return sqlSession.selectOne(namespace+".enrollReply",prodReplyDTO);
	}

}