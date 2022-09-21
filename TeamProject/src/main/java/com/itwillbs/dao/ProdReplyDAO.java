package com.itwillbs.dao;

import com.itwillbs.domain.ProdReplyDTO;

public interface ProdReplyDAO {

	/* 댓글 등록 */
	public int enrollReply(ProdReplyDTO prodReplyDTO);
}
