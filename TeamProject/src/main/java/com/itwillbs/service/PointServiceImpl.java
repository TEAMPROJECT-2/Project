package com.itwillbs.service;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

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
	public PointDTO getMember(String userId) {
		return pointDAO.getMember(userId);
	}

	@Override
	public int getPointCount(String userId) {
		return pointDAO.getPointCount(userId);
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

	@Override
	public void insertMember(PointDTO pointDTO) {
		pointDTO.setPointDate(new Timestamp(System.currentTimeMillis()));
		
		// max(num)+1
		if(pointDAO.getMaxNum()==null) {
			pointDTO.setPointNum(1);
		}else {
			pointDTO.setPointNum(pointDAO.getMaxNum()+1);
		}
		
		pointDAO.insertMember(pointDTO);
	}

	@Override
	public void insertChargePoint(Map<String, Object> sMap) {
		pointDAO.insertChargePoint(sMap);
	}

	@Override
	public void insertUsePoint(Map<String, Object> sMap) {
		pointDAO.insertUsePoint(sMap);
	}

}
