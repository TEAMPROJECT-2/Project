package com.itwillbs.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.MypageDAO;
import com.itwillbs.domain.MypageDTO;

@Service
public class MypageServiceImpl implements MypageService {
	
	@Inject
	private MypageDAO mypageDAO;
	
	@Override
	public void insertMypage(MypageDTO userId) {
		mypageDAO.insertMypage(userId);
		
	}

	@Override
	public void boardCount(MypageDTO mypageDTO) {
		mypageDAO.boardCount(mypageDTO);
		
	}

	@Override
	public void boardsub(MypageDTO mypageDTO) {
		mypageDAO.boardsub(mypageDTO);
		
	}

	@Override
	public void replysub(MypageDTO mypageDTO) {
		mypageDAO.replysub(mypageDTO);		
	}

	@Override
	public void replyCount(MypageDTO mypageDTO) {
		mypageDAO.replyCount(mypageDTO);		
	}

	@Override
	public MypageDTO mypageselect(MypageDTO mypageDTO) {
		return mypageDAO.mypageselect(mypageDTO);	
		
	}

}
