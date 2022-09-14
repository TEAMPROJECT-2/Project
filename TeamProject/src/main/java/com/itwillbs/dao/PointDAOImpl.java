package com.itwillbs.dao;

import java.util.List;

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
	public void updatePoint(MemberDTO memberDTO) {
		System.out.println("PointDAOImpl updatePoint()");
		sqlSession.update(namespace + ".updatePoint", memberDTO);
	}

	
	@Override
	public PointDTO getMember(String userId) {
		return sqlSession.selectOne(namespace + ".getMember", userId);
	}


	@Override
	public void insertPoint(PointDTO pointDTO)  throws Exception {
		sqlSession.insert(namespace + ".insertPoint", pointDTO);
	}


	@Override
	public int getPointCount() {
		return sqlSession.selectOne(namespace+".getPointCount");
	}


	@Override
	public List<PointDTO> getPointList(PageDTO pageDTO) {
		return sqlSession.selectList(namespace+".getPointList",pageDTO);
	}

}
