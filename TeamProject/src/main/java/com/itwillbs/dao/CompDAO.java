package com.itwillbs.dao;

import com.itwillbs.domain.ProdDTO;
import com.itwillbs.domain.ProdStockDTO;

public interface CompDAO {

	public void insertProd(ProdDTO prodDTO,ProdStockDTO proStockDTO);

	Integer getMaxNum();



}
