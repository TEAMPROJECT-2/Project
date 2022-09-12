package com.itwillbs.dao;

import com.itwillbs.domain.BasketDTO;

public interface BasketDAO {
	BasketDTO getMemberchk(BasketDTO basketDTO);

	void insertBasket(BasketDTO basketDTO);
}
