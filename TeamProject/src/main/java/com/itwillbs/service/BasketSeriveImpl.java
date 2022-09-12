package com.itwillbs.service;

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

		basketDAO.insertBasket(basketDTO);
	}

}
