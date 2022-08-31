package com.itwillbs.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.PointDAO;
import com.itwillbs.domain.MemberDTO;

@Service
public class PointServiceImpl implements PointService {
	
	@Inject
	private PointDAO pointDAO;
	
	@Override
	public int updatePoint(MemberDTO memberDTO) {
		return pointDAO.updatePoint(memberDTO);
	}

}
