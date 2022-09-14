package com.itwillbs.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.PointDAO;
import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.PointDTO;

@Service
public class PointServiceImpl implements PointService {
	
	@Inject
	private PointDAO pointDAO;
	
	@Override
	public int updatePoint(MemberDTO memberDTO) {
		return pointDAO.updatePoint(memberDTO);
	}

	@Override
	public PointDTO getMember(String userId) {
		return pointDAO.getMember(userId);
	}

	@Override
	public void insertPoint(PointDTO pointDTO) throws Exception {
		pointDAO.insertPoint(pointDTO);
	}

}
