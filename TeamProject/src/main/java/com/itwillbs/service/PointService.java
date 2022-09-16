package com.itwillbs.service;

import java.util.List;

import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.PointDTO;

public interface PointService {

	void updatePoint(MemberDTO memberDTO);

	PointDTO getMember(String userId);

	int getPointCount();

	List<PointDTO> getPointList(PageDTO pageDTO);

	void insertMember(PointDTO pointDTO);


}
