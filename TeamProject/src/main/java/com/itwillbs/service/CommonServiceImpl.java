package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.CommonDAO;
import com.itwillbs.domain.CommonDTO;

@Service
public class CommonServiceImpl implements CommonService {

	@Inject
	private CommonDAO commonDAO;

	@Override
	public List<CommonDTO> selectCommonList(CommonDTO commonDTO) {
		return commonDAO.selectCommonList(commonDTO);
	}

}
