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

	@Override
	public BasketDTO getMemberchk(BasketDTO basketDTO) {

		return basketDAO.getMemberchk(basketDTO);
	}

	@Override
	public void insertBasket(BasketDTO basketDTO) {
		basketDTO.setShoppingBasketDate(new Timestamp(System.currentTimeMillis()));
		basketDAO.insertBasket(basketDTO);
	}

	@Override
	public List<BasketDTO> getBasketList(BasketDTO basketDTO) {

		return basketDAO.getBasketList(basketDTO);
	}

}
