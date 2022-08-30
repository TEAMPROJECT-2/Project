package com.itwillbs.service;

import java.util.Map;

import com.itwillbs.domain.ProdDTO;
import com.itwillbs.domain.ProdStockDTO;

public interface CompService {

	void insertProd(ProdDTO prodDTO, Map<String, Object> opMap);

}
