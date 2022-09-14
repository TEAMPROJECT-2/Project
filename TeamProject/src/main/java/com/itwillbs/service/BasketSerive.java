package com.itwillbs.service;

import java.util.List;

import com.itwillbs.domain.BasketDTO;

public interface BasketSerive {

	BasketDTO getMemberchk(BasketDTO basketDTO); // 유저체크

	void insertBasket(BasketDTO basketDTO);  // 메인에서 카트로 인서트

	List<BasketDTO> getBasketList(BasketDTO basketDTO); // 디비에서 카트물건리스트 갖고오기

	void insertOrder(BasketDTO basketDTO); // 주문 디비에 인서트

	void deleteBasket(BasketDTO basketDTO); // 카트에 물건 삭제

}
