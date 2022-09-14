package com.itwillbs.dao;

import java.util.List;

import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.PointDTO;

public interface PointDAO {

	void updatePoint(MemberDTO memberDTO);

	PointDTO getMember(String userId);

	void insertPoint(PointDTO pointDTO) throws Exception;

	int getPointCount();

	List<PointDTO> getPointList(PageDTO pageDTO);

}
