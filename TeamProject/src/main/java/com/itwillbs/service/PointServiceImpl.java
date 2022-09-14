package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.PointDAO;
import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.PointDTO;

@Service
public class PointServiceImpl implements PointService {
	
	@Inject
	private PointDAO pointDAO;
	
	@Override
	public void updatePoint(MemberDTO memberDTO) {
		pointDAO.updatePoint(memberDTO);
	}

	@Override
	public PointDTO getMember(String userId) {
		return pointDAO.getMember(userId);
	}

	@Override
	public void insertPoint(PointDTO pointDTO) throws Exception {
		pointDAO.insertPoint(pointDTO);
	}

	@Override
	public int getPointCount() {
		return pointDAO.getPointCount();
	}

	@Override
	public List<PointDTO> getPointList(PageDTO pageDTO) {
		// pageSize  pageNum  currentPage
		int startRow=(pageDTO.getCurrentPage()-1)*pageDTO.getPageSize()+1;
		int endRow=startRow+pageDTO.getPageSize()-1;
				
		// sql => limit #{startRow -1}, #{pageSize}
				
		pageDTO.setStartRow(startRow-1);
		pageDTO.setEndRow(endRow);
		return pointDAO.getPointList(pageDTO);
	}

}
