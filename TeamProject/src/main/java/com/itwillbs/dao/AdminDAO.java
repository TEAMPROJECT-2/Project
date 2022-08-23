package com.itwillbs.dao;

import com.itwillbs.domain.ProdDTO;
import com.itwillbs.domain.ProdStockDTO;

public interface AdminDAO {

	public void insertProd(ProdDTO prodDTO,ProdStockDTO proStockDTO);

	Integer getMaxNum();



}
