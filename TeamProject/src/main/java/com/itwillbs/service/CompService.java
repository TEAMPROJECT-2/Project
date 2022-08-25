package com.itwillbs.service;

import com.itwillbs.domain.ProdDTO;
import com.itwillbs.domain.ProdStockDTO;

public interface CompService {

	void insertProd(ProdDTO prodDTO, ProdStockDTO proStockDTO);

}
