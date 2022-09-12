package com.itwillbs.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.ProdDTO;
import com.itwillbs.domain.ReplyDTO;

@Repository
public class ReplyDAOImpl implements ReplyDAO{

	@Inject
	private SqlSession sqlSession;

	@Override
	public void insetreply(ReplyDTO replyDTO) {
		// TODO Auto-generated method stub

	}

	@Override
	public List<ReplyDTO> getReplyList(PageDTO pageDTO) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getReplyCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Integer getMaxNum() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void Replydelete(ReplyDTO replyDTO) {
		// TODO Auto-generated method stub

	}

	@Override
	public ReplyDTO rNumCheck(ReplyDTO replyDTO) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public MemberDTO userCheck(MemberDTO memberDTO) {
		// TODO Auto-generated method stub
		return null;
	}



}
