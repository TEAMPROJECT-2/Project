package com.itwillbs.dao;

import java.util.Map;

import com.itwillbs.domain.ProdDTO;
import com.itwillbs.domain.ProdStockDTO;

public interface CompDAO {

	public void insertProd(ProdDTO prodDTO, Map<String, Object> opMap);




}
