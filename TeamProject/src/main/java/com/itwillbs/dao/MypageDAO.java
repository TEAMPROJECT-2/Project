package com.itwillbs.dao;

import com.itwillbs.domain.MypageDTO;

public interface MypageDAO {


	void insertMypage(MypageDTO userId);

	void boardCount(MypageDTO mypageDTO);

	void boardsub(MypageDTO mypageDTO);

	void replysub(MypageDTO mypageDTO);

	void replyCount(MypageDTO mypageDTO);

	MypageDTO mypageselect(MypageDTO mypageDTO);

}
