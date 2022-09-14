package com.itwillbs.dao;

import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.PointDTO;

public interface PointDAO {

	int updatePoint(MemberDTO memberDTO);

	PointDTO getMember(String userId);

	void insertPoint(PointDTO pointDTO) throws Exception;

}
