package com.itwillbs.service;

import java.util.List;

import com.itwillbs.domain.ProdDTO;

public interface ProdService {

	public List<ProdDTO> selectProdList(ProdDTO prodDTO);

	public int selectProdListCnt(ProdDTO prodDTO);

	public ProdDTO selectProdDetail(ProdDTO prodDTO);

	/* 상품 id 이름 */
	public ProdDTO getProdNumName(int prodLNum);

}
