package com.itwillbs.service;

import com.itwillbs.domain.CompDTO;
import com.itwillbs.domain.MemberDTO;

public interface MemberService {
	//추상메서드
	public void insertMember(MemberDTO memberDTO);

	public MemberDTO userCheck(MemberDTO memberDTO);

	public MemberDTO getMember(String userId);

	public void insertComp(CompDTO compDTO);

	public CompDTO compCheck(CompDTO compDTO);

	MemberDTO loginCheck(MemberDTO memberDTO);
}
