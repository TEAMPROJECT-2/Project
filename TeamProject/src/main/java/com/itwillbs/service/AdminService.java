package com.itwillbs.service;

import com.itwillbs.domain.ProdDTO;
import com.itwillbs.domain.ProdStockDTO;

public interface AdminService {

	void insertProd(ProdDTO prodDTO, ProdStockDTO proStockDTO);

}
