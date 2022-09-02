package com.itwillbs.service;

import java.util.List;

import com.itwillbs.domain.BoardDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.ReplyDTO;

public interface ReplyService {

	int getBoardCount();

	List<BoardDTO> getBoardList(PageDTO pageDTO);

	void insetreply(ReplyDTO replyDTO);


}
