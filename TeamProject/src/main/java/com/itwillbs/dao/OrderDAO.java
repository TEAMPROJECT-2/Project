package com.itwillbs.dao;

import java.util.Map;

import com.itwillbs.domain.OrderDTO;

public interface OrderDAO {

	public void insertOrder(OrderDTO orderDTO);
	
	void orderComplete(Map<String, Object> sMap);
}


