package com.itwillbs.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.BasketDTO;

@Repository
public class BasketDAOImpl implements BasketDAO {
	@Inject
	private SqlSession sqlSession;
	private static final String namespace="com.itwillbs.mappers.basketMapper";

	@Override
	public BasketDTO getMemberchk(BasketDTO basketDTO) {
		return sqlSession.selectOne(namespace + ".getUser", basketDTO);
	}

	@Override
	public void insertBasket(BasketDTO basketDTO) {
		sqlSession.insert(namespace + ".insertBasket", basketDTO);
	}





}
