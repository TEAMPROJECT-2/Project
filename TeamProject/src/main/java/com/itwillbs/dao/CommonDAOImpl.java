package com.itwillbs.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.CommonDTO;

@Repository
public class CommonDAOImpl implements CommonDAO {

	@Inject
	private SqlSession sqlSession;

	private static final String namespace="com.itwillbs.mappers.commonMapper";

	@Override
	public List<CommonDTO> selectCommonList(CommonDTO commonDTO) {
		return sqlSession.selectList(namespace+".selectCommonList",commonDTO);
	}
	
	@Override
	public CommonDTO selectCodeSearch(CommonDTO commonDTO) {
		return sqlSession.selectOne(namespace+".selectCodeSearch",commonDTO);
	}
	
}
