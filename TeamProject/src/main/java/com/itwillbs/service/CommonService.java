package com.itwillbs.service;

import java.util.List;

import com.itwillbs.domain.CommonDTO;

public interface CommonService {

	public List<CommonDTO> selectCommonList(CommonDTO commonDTO);

}