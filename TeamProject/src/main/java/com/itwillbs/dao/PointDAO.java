package com.itwillbs.dao;

import java.util.List;

import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.PointDTO;

public interface PointDAO {

	void updatePoint(MemberDTO memberDTO);

	PointDTO getMember(String userId);

	int getPointCount();

	List<PointDTO> getPointList(PageDTO pageDTO);

	Integer getMaxNum();

	void insertMember(PointDTO pointDTO);

}
