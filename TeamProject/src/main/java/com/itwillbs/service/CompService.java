package com.itwillbs.service;

import java.util.List;
import java.util.Map;

import com.itwillbs.domain.CompDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.ProdDTO;
import com.itwillbs.domain.ProdStockDTO;

public interface CompService {

	void insertProd(ProdDTO prodDTO);

	List<ProdDTO> getProdList(PageDTO pageDTO);

	int getProdCount();

	ProdDTO getProd(String prodLCode);

	void deleteProd(String prodLCode); // 제품삭제

	void updateProd(ProdDTO prodDTO);

	CompDTO getComp(CompDTO compDTO);

}
