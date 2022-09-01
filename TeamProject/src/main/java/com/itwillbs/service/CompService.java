package com.itwillbs.service;

import java.util.List;
import java.util.Map;

import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.ProdDTO;
import com.itwillbs.domain.ProdStockDTO;

public interface CompService {

	void insertProd(ProdDTO prodDTO, Map<String, Object> opMap);

	List<ProdDTO> getProdList(PageDTO pageDTO);

	int getProdCount();

	ProdDTO getProd(int num);

	void deleteProd(String prodLCode); // 제품삭제

}
