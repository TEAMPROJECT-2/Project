package com.itwillbs.dao;

import java.util.List;

import com.itwillbs.domain.CommonDTO;

public interface CommonDAO {

	List<CommonDTO> selectCommonList(CommonDTO commonDTO);
	
	CommonDTO selectCodeSearch(CommonDTO commonDTO);
	
}
