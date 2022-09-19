package com.itwillbs.dao;

import java.util.List;
import java.util.Map;

import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.PointDTO;

public interface PointDAO {

	PointDTO getMember(String userId);

	int getPointCount(String userId);

	List<PointDTO> getPointList(PageDTO pageDTO);

	Integer getMaxNum();

	void insertMember(PointDTO pointDTO);

	void insertChargePoint(Map<String, Object> sMap);

	void insertUsePoint(Map<String, Object> sMap);

}
