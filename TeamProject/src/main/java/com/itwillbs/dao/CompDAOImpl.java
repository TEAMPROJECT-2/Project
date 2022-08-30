package com.itwillbs.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.ProdDTO;
import com.itwillbs.domain.ProdStockDTO;


@Repository
public class CompDAOImpl implements CompDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace="com.itwillbs.mappers.compMapper";
	@Override
	public void insertProd(ProdDTO prodDTO) {
		System.out.println("MemberDAOImpl insertProd()");
		// 마이바티스 메서드 호출
		sqlSession.insert(namespace + ".insertProd", prodDTO);
		
		
	}
//	@Override
//	public Integer getMaxNum() {
//		return sqlSession.selectOne(namespace+".getMaxNum");
//	}
	
	
}
