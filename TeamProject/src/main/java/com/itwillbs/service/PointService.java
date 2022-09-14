package com.itwillbs.service;

import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.PointDTO;

public interface PointService {

	int updatePoint(MemberDTO memberDTO);

	PointDTO getMember(String userId);

	void insertPoint(PointDTO pointDTO) throws Exception;

}
