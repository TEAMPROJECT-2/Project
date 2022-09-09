package com.itwillbs.dao;

import java.util.List;
import java.util.Map;

import com.itwillbs.domain.CompDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.ProdDTO;
import com.itwillbs.domain.ProdStockDTO;

public interface CompDAO {

	public void insertProd(ProdDTO prodDTO);

	ProdDTO getProd(String prodLCode);

	List<ProdDTO> getProdList(PageDTO pageDTO);

	int getProdCount(PageDTO pageDTO);

	public void deleteProd(String prodLCode);


	public void updateProd(ProdDTO prodDTO);

	CompDTO getComp(CompDTO compDTO);




}
