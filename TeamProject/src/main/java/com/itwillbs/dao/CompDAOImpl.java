package com.itwillbs.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.ProdDTO;
import com.itwillbs.domain.ProdStockDTO;


@Repository
public class CompDAOImpl implements CompDAO {

	@Inject
	private SqlSession sqlSession;

	private static final String namespace="com.itwillbs.mappers.compMapper";
	@Override
	public void insertProd(ProdDTO prodDTO,Map<String, Object> opMap) {
		System.out.println("MemberDAOImpl insertProd()");
		// 마이바티스 메서드 호출
		sqlSession.insert(namespace + ".insertProd", prodDTO);
		sqlSession.insert(namespace + ".insertOp", opMap);
	}
	@Override
	public ProdDTO getProd(int num) {
		return sqlSession.selectOne(namespace+".getProd", num);
	}
	@Override
	public List<ProdDTO> getProdList(PageDTO pageDTO) {

		return sqlSession.selectList(namespace+".getProdList",pageDTO);
	}
	@Override
	public int getProdCount() {
		return sqlSession.selectOne(namespace+".getProdCount");
	}
	@Override
	public void deleteProd(String prodLCode) {
		System.out.println( "deleteProd" + prodLCode);
		sqlSession.delete(namespace+".deleteProd", prodLCode);
	}



}
