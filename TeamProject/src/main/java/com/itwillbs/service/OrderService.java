package com.itwillbs.service;


import java.util.Map;

import com.itwillbs.domain.OrderDTO;

public interface OrderService {

	public void insertOrder(OrderDTO orderDTO);

	void orderComplete(Map<String, Object> sMap);
}
