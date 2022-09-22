package com.itwillbs.service;


import java.util.List;
import java.util.Map;

import com.itwillbs.domain.BasketDTO;
import com.itwillbs.domain.OrderDTO;
import com.itwillbs.domain.ProdDTO;

public interface OrderService {

	public void insertOrder(Map<String, Object> sMap);

	void orderComplete(Map<String, Object> sMap);
	
//	public BasketDTO getItemCode(String userId);
	
	public void updateQuantity(Map<String, Object> sMap);
	
	public void removeItemBasket(Map<String, Object> sMap);
	
	List<ProdDTO> getQuantityList(ProdDTO proDTO); 

	public void isertOrderList(Map<String, Object> sMap);

	public void insertUsePoint(Map<String, Object> sMap);
	
}
