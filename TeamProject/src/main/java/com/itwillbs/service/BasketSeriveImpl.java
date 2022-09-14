package com.itwillbs.service;

import java.sql.Timestamp;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.BasketDAO;
import com.itwillbs.domain.BasketDTO;

@Service
public class BasketSeriveImpl implements BasketSerive {
	@Inject
	private BasketDAO basketDAO;

	@Override // 유저체크
	public BasketDTO getMemberchk(BasketDTO basketDTO) {

		return basketDAO.getMemberchk(basketDTO);
	}

	@Override // 메인에서 카트로 인서트
	public void insertBasket(BasketDTO basketDTO) {
		basketDTO.setShoppingBasketDate(new Timestamp(System.currentTimeMillis()));
		basketDAO.insertBasket(basketDTO);
	}

	@Override // 디비에서 카트물건리스트 갖고오기
	public List<BasketDTO> getBasketList(BasketDTO basketDTO) {

		return basketDAO.getBasketList(basketDTO);
	}

	@Override // 주문 디비에 인서트
	public void insertOrder(BasketDTO basketDTO) {
		basketDAO.insertOrder(basketDTO);
	}

	@Override // 카트에 물건 삭제
	public void deleteBasket(BasketDTO basketDTO) {
		basketDAO.deleteBasket(basketDTO);

	}

}
