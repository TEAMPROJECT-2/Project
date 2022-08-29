package com.itwillbs.service;

import java.util.List;

import com.itwillbs.domain.CompDTO;
import com.itwillbs.domain.MemberDTO;

public interface MemberService {
	//추상메서드
	public void insertMember(MemberDTO memberDTO) throws Exception;

	public MemberDTO userCheck(MemberDTO memberDTO);

	public MemberDTO getMember(String userId);

	public void insertComp(CompDTO compDTO);

	public CompDTO compCheck(CompDTO compDTO);

	public MemberDTO loginCheck(MemberDTO memberDTO);

	int updateEmailKey(MemberDTO memberDTO) throws Exception;

	int updateEmailAuth(MemberDTO memberDTO) throws Exception;

	int emailAuthFail(String userId) throws Exception;

	List<MemberDTO> idSearch(MemberDTO memberDTO);
}
