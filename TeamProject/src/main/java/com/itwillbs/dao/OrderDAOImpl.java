package com.itwillbs.dao;


import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.BasketDTO;


@Repository
public class OrderDAOImpl implements OrderDAO {

	@Inject
	@Autowired
	private SqlSession sqlSession;
	
	private static final String namespace="com.itwillbs.mappers.orderMapper";
	
	
	@Override
	public void getTotalPrice(BasketDTO basketDTO) {
		sqlSession.insert(namespace + ".getTotalPrice", basketDTO);
	}


	
}
