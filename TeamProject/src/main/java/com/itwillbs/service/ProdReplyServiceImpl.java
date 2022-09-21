package com.itwillbs.service;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.dao.ProdReplyDAO;
import com.itwillbs.domain.ProdReplyDTO;

@Service
public class ProdReplyServiceImpl implements ProdReplyService {

	@Autowired
	private ProdReplyDAO prodReplyDAO;
//	@Inject
//	private ProdReplyDAO prodReplyDAO;

	/* 댓글등록 */
	@Override
	public int enrollReply(ProdReplyDTO dto) {

		int result = prodReplyDAO.enrollReply(dto);

		return result;
	}

}