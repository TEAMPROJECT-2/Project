package com.itwillbs.dao;


import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.BasketDTO;
import com.itwillbs.domain.OrderDTO;


@Repository
public class OrderDAOImpl implements OrderDAO {

	@Inject
	@Autowired
	private SqlSession sqlSession;
	
	private static final String namespace="com.itwillbs.mappers.orderMapper";

	@Override
	public void insertOrder(OrderDTO orderDTO) {
		sqlSession.insert(namespace + ".insertOrder", orderDTO);		
	}
	
	


	
}
