package com.itwillbs.service;

import java.util.List;
import java.util.Map;

import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.PointDTO;

public interface PointService {
	//포인트 회원정보 가져오기
	PointDTO getMember(String userId);
	
	//포인트(아이디) 수 조회
	int getPointCount(String userId);
	
	//포인트 리스트 조회 
	List<PointDTO> getPointList(PageDTO pageDTO);
	
	//포인트 DB 저장
	void insertMember(PointDTO pointDTO);
	
	//포인트 충전 DB 저장
	void insertChargePoint(Map<String, Object> sMap);
	
	//포인트 사용 DB 저장
	void insertUsePoint(Map<String, Object> sMap);
	
	//포인트 날짜 리스트조회
	List<PointDTO> getPointCheckList(PageDTO pageDTO);


}
