package com.itwillbs.service;

import java.util.List;
import java.util.Map;

import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.PointDTO;

public interface PointService {

	PointDTO getMember(String userId);

	int getPointCount();

	List<PointDTO> getPointList(PageDTO pageDTO);

	void insertMember(PointDTO pointDTO);

	void insertChargePoint(Map<String, Object> sMap);


}
