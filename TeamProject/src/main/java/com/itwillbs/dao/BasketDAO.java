package com.itwillbs.dao;

import java.util.List;

import com.itwillbs.domain.BasketDTO;

public interface BasketDAO {
	BasketDTO getMemberchk(BasketDTO basketDTO);

	void insertBasket(BasketDTO basketDTO);

	List<BasketDTO> getBasketList(BasketDTO basketDTO);
}
