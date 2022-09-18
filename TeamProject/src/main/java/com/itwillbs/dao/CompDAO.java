package com.itwillbs.dao;

import java.util.List;
import java.util.Map;

import com.itwillbs.domain.CompDTO;
import com.itwillbs.domain.OrderListDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.ProdDTO;
import com.itwillbs.domain.ProdStockDTO;

public interface CompDAO {
	// 상품 신규등록
	public void insertProd(ProdDTO prodDTO);
	// 개별 상품 정보 갖고오기
	ProdDTO getProd(String prodLCode);

	// 상품 리스트
	List<ProdDTO> getProdList(PageDTO pageDTO);

	// 상품수량
	int getProdCount(PageDTO pageDTO);

	// 상품 삭제
	public void deleteProd(String prodLCode);

	// 상품 수정
	public void updateProd(ProdDTO prodDTO);
	// 아이디 일치하면 업체 정보 갖고오기
	CompDTO getComp(CompDTO compDTO);
	// 업체 정보 수정
	public void modComp(CompDTO compDTO);

	// 업체 탈퇴
	void delComp(CompDTO compDTO);

	// 업체 비밀번호 변경
	void passMod(CompDTO compDTO) throws Exception;
	// 주문 리스트 갖고 오기
	public List<OrderListDTO> getOrdList(PageDTO pageDTO);
	// 주문 리스트 페이징 처리
	public int getOrdCount(PageDTO pageDTO);




}
