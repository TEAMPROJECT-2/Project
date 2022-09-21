package com.itwillbs.dao;

import java.util.List;

import com.itwillbs.domain.BoardDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.ProdDTO;

public interface ProdDAO {
	public List<ProdDTO> selectProdList(ProdDTO prodDTO);

	public int selectProdListCnt(ProdDTO prodDTO);

	public ProdDTO selectProdDetail(ProdDTO prodDTO);

	/* 상품 id 이름 */
	public ProdDTO getProdNumName(int prodLNum);
}
