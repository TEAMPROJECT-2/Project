package com.itwillbs.dao;

import java.util.List;
import java.util.Map;

import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.ProdDTO;
import com.itwillbs.domain.ProdStockDTO;

public interface CompDAO {

	public void insertProd(ProdDTO prodDTO, Map<String, Object> opMap);

	ProdDTO getProd(int num);

	List<ProdDTO> getProdList(PageDTO pageDTO);

	int getProdCount();

	public void deleteProd(String num);




}
