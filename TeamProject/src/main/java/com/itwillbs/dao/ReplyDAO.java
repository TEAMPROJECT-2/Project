package com.itwillbs.dao;

import java.util.List;

import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.ReplyDTO;

public interface ReplyDAO {

	void insetreply(ReplyDTO replyDTO);


	List<ReplyDTO> getReplyList(PageDTO pageDTO);


	int getReplyCount();


	Integer getMaxNum();


	void Replydelete(ReplyDTO replyDTO);


	ReplyDTO rNumCheck(ReplyDTO replyDTO);

	


		
	

}
