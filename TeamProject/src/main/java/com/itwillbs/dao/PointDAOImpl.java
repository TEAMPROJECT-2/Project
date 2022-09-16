package com.itwillbs.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.PointDTO;

@Repository
public class PointDAOImpl implements PointDAO {

	@Inject
	private SqlSession sqlSession;

	private static final String namespace="com.itwillbs.mappers.pointMapper";
	
	@Override
	public PointDTO getMember(String userId) {
		return sqlSession.selectOne(namespace + ".getMember", userId);
	}


	@Override
	public int getPointCount() {
		return sqlSession.selectOne(namespace+".getPointCount");
	}


	@Override
	public List<PointDTO> getPointList(PageDTO pageDTO) {
		return sqlSession.selectList(namespace+".getPointList",pageDTO);
	}


	@Override
	public Integer getMaxNum() {
		return sqlSession.selectOne(namespace+".getMaxNum");
	}


	@Override
	public void insertMember(PointDTO pointDTO) {
		sqlSession.insert(namespace+".insertMember", pointDTO);
	}


	@Override
	public void insertChargePoint(Map<String, Object> sMap) {
		sqlSession.insert(namespace+".insertChargePoint", sMap);
	}

}
