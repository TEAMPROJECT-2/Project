package com.itwillbs.service;

import java.util.Map;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.dao.OrderDAO;
import com.itwillbs.domain.OrderDTO;


@Service
public class OrderServiceImpl implements OrderService {

	@Inject
	@Autowired
	OrderDAO orderDAO;
	
	@Override
	public void insertOrder(OrderDTO orderDTO) {
		
	}

	@Override
	public void orderComplete(Map<String, Object> sMap) {
		orderDAO.orderComplete(sMap);
	}

	
	
}
