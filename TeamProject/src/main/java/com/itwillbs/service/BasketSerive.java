package com.itwillbs.service;

import java.util.List;

import com.itwillbs.domain.BasketDTO;

public interface BasketSerive {

	BasketDTO getMemberchk(BasketDTO basketDTO);

	void insertBasket(BasketDTO basketDTO);

	List<BasketDTO> getBasketList(BasketDTO basketDTO);

}
