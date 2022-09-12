package com.itwillbs.service;

import com.itwillbs.domain.BasketDTO;

public interface BasketSerive {

	BasketDTO getMemberchk(BasketDTO basketDTO);

	void insertBasket(BasketDTO basketDTO);

}
