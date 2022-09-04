package com.itwillbs.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.CompDTO;
import com.itwillbs.domain.PageDTO;
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
	@Override
	public ProdDTO getProd(String prodLCode) {
		return sqlSession.selectOne(namespace+".getProd", prodLCode);
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
		sqlSession.delete(namespace+".deleteProd", prodLCode);
	}
	@Override
	public void updateProd(ProdDTO prodDTO) {
		sqlSession.update(namespace + ".updateProd", prodDTO);
	}

	// 업체 정보 갖고 오기
	@Override
	public CompDTO getComp(CompDTO compDTO) {
		return sqlSession.selectOne(namespace + ".getComp", compDTO);
	}


}
